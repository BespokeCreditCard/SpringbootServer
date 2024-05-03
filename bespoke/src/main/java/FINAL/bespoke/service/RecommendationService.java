package FINAL.bespoke.service;

import FINAL.bespoke.config.S3Config;
import FINAL.bespoke.model.dto.RecommendationDto;
import FINAL.bespoke.model.dto.RecommendationTop5Dto;
import FINAL.bespoke.model.entity.ImageTemplate;
import FINAL.bespoke.model.entity.Recommendation;
import FINAL.bespoke.model.entity.User;
import FINAL.bespoke.repository.ImageTemplateRepository;
import FINAL.bespoke.repository.RecommendationRepository;
import co.elastic.clients.elasticsearch.core.GetResponse;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.ScrollPosition;
import org.springframework.data.domain.Window;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;

@Service
@RequiredArgsConstructor
public class RecommendationService {

    private final RecommendationRepository recommendationRepository;
    private final ImageTemplateRepository imageTemplateRepository;
    private final S3Config s3Config;
    private final ReceiveCardService receiveCardService;
    private final ElasticService elasticService;

   /**
     * 사용자 ID에 기반하여 추천된 상위 5개의 이미지 템플릿 ID를 조회하고 이에 대한 정보를 DTO로 반환합니다.
     *
     * @param userId 사용자의 고유 ID, String 타입
     * @return 추천된 상위 5개 이미지 템플릿의 ID와 혜택 리스트를 포함하는 DTO, RecommendationTop5Dto 타입
     */
    public RecommendationTop5Dto getRecommendation(String userId) {
        List<Integer> imageList = new ArrayList<>();
        List<String> benefitList = new ArrayList<>();
        Recommendation recommendation = recommendationRepository.findByUser_UserID(userId);
        System.out.println("### RecommendationService - recommendation: " + recommendation);

        imageList.add(recommendation.getImageTemplate1().getId());
        imageList.add(recommendation.getImageTemplate2().getId());
        imageList.add(recommendation.getImageTemplate3().getId());
        imageList.add(recommendation.getImageTemplate4().getId());
        imageList.add(recommendation.getImageTemplate5().getId());
        
        RecommendationTop5Dto recommendationTop5Dto = new RecommendationTop5Dto();
        recommendationTop5Dto.setImageList(imageList);
        recommendationTop5Dto.setBenefitList(benefitList);
        System.out.println("### RecommendationService - imageList: " + recommendationTop5Dto.getImageList());
        System.out.println("### RecommendationService - benefitList: " + recommendationTop5Dto.getBenefitList());
        
        return recommendationTop5Dto;
    }
    
    /**
     * 사용자 ID에 기반한 이미지 URL을 조회합니다.
     *
     * @param userId 사용자의 고유 ID, String 타입
     * @return 사용자의 이미지 URL, String 타입
     */
    public String getImageUrl(String userId) {
        String fullUrl = s3Config.s3Endpoint() + "upload/" + userId + ".png";
        return fullUrl;
    }
    
   /**
     * 주어진 이미지 ID 리스트에 대한 이미지 URL들을 조회합니다.
     *
     * @param imageIds 이미지 ID 목록, List<Integer> 타입
     * @return 조회된 이미지 URL 목록, List<String> 타입
     */
    public List<String> getImageUrls(List<Integer> imageIds) {
        List<String> imageUrls = new ArrayList<>();

        if (imageIds.isEmpty()) {
            return imageUrls;
        }

        List<ImageTemplate> imageTemplates = imageTemplateRepository.findByIdIn(imageIds);
        for (Integer imageId : imageIds) {
            for (ImageTemplate imageTemplate : imageTemplates) {
                if (imageTemplate.getId() == imageId) {
                    String fullUrl = s3Config.s3Endpoint() + imageTemplate.getUrl();
                    imageUrls.add(fullUrl);
                    System.out.println("### RecommendationService - imageTemplate.getUrl(): " + imageTemplate.getUrl());
                }
            }
        }
        return imageUrls;
    }
    

    /**
     * HTTP 요청을 기반으로 사용자 ID를 모델에 추가합니다.
     *
     * @param model 프레젠테이션 레이어에 데이터를 전달하기 위한 모델 객체, Model 타입
     * @param request 클라이언트로부터 받은 HTTP 요청, HttpServletRequest 타입
     * @throws JsonProcessingException JSON 처리 중 발생할 수 있는 예외
     */
    public void getUserId(Model model, HttpServletRequest request) throws JsonProcessingException {
        User user = receiveCardService.findUserId(request);
        model.addAttribute("userId", user.getUserID());
    } 

    
        /**
     * 추천 정보를 보여주는 메서드로, 사용자 ID에 기반한 이미지 URL 및 카테고리 클래스 정보를 모델에 추가합니다.
     *
     * @param model 프레젠테이션 레이어에 데이터를 전달하기 위한 모델 객체, Model 타입
     * @param request 클라이언트로부터 받은 HTTP 요청, HttpServletRequest 타입
     * @throws JsonProcessingException JSON 처리 중 발생할 수 있는 예외
     */
    public void showRecommendations(Model model, HttpServletRequest request) throws JsonProcessingException {
        ObjectMapper objectMapper = new ObjectMapper();
        long beforeTime = System.currentTimeMillis();
        User user = receiveCardService.findUserId(request);

        RecommendationTop5Dto recommendationTop5Dto = getRecommendation(user.getUserID());
        List<Integer> imageList = recommendationTop5Dto.getImageList();
        List<String> benefitList = recommendationTop5Dto.getBenefitList();

        List<RecommendationDto> RecommendationDtoList = getImageUrlsToDto(imageList);

        model.addAttribute("imageUrls", RecommendationDtoList);
        String benefitListClassJson = objectMapper.writeValueAsString(benefitList);
        System.out.println("### RecommendationService - benefitListClassJson: " + benefitListClassJson);
        model.addAttribute("benefitList", benefitListClassJson);

        List<GetResponse<ObjectNode>> response = elasticService.fetchDataElastic(imageList,"result_bulk");

        List<List<String>> categoryClass = new ArrayList<>();
        categoryClass.add(new ArrayList<>(Arrays.asList("온라인쇼핑", "간편결제", "동물병원", "쇼핑", "마트/편의점", "해외이용", "공항라운지", "주유소", "카페")));
        categoryClass.add(new ArrayList<>(Arrays.asList("온라인쇼핑", "간편결제", "생활", "카페", "배달앱", "대중교통", "통신", "해외", "생활", "디지털구독", "공연/전시")));
        categoryClass.add(new ArrayList<>(Arrays.asList("쇼핑", "영화", "베이커리", "대중교통", "공항라운지")));
        categoryClass.add(new ArrayList<>(Arrays.asList("공항라운지/PP", "해외이용", "생활", "간편결제", "CJ ONE")));
        categoryClass.add(new ArrayList<>(Arrays.asList("영화", "적립")));

        System.out.println("### RecommendationService - categoryClass: " + categoryClass);
        String categoryClassJson = objectMapper.writeValueAsString(categoryClass);
        System.out.println("### RecommendationService - categoryClassJson: " + categoryClassJson);
        model.addAttribute("categoryClassJson", categoryClassJson);

        model.addAttribute("categoryClass", categoryClass);

        System.out.println("### RecommendationService - categoryClass: "+ categoryClass);

        long afterTime = System.currentTimeMillis();
        long secDiffTime = (afterTime - beforeTime);
        System.out.println("시간차이(s) : " + secDiffTime);
    }

    /**
     * 주어진 이미지 ID 리스트를 사용하여 각 ID에 해당하는 S3 이미지 URL을 조회하고, 이를 DTO로 변환하여 반환합니다.
     * 
     * @param imageIds 조회할 이미지 ID 목록, List<Integer> 타입
     * @return 이미지 URL 정보를 담은 RecommendationDto 리스트, List<RecommendationDto> 타입
     */
    public List<RecommendationDto> getImageUrlsToDto(List<Integer> imageIds) {
        List<RecommendationDto> imageUrls = new ArrayList<>();
        
        if (imageIds.isEmpty()) {
            return imageUrls; // 이미지 ID 목록이 비어 있으면 빈 리스트를 반환
        }
        
        // 반복문: imageIds 리스트를 순회하며 각 이미지 ID에 대한 처리 수행
        for (Integer idx : imageIds) {
            // 이미지 템플릿 저장소에서 해당 ID로 이미지 템플릿 검색, 없을 경우 예외 발생
            ImageTemplate imageTemplate = imageTemplateRepository.findById(idx).orElseThrow(RuntimeException::new);
            String fullUrl = s3Config.s3Endpoint() + imageTemplate.getUrl(); // S3 엔드포인트와 이미지 URL 조합
            imageUrls.add(new RecommendationDto(idx, fullUrl)); // 카드 인덱스와 이미지 URL을 포함한 DTO 생성
            System.out.println("### RecommendationService - imageTemplate.getUrl(): " + imageTemplate.getUrl());
        }
        return imageUrls;
    }
    
    /**
     * 사용자 ID를 기반으로 특정 규칙에 따라 포맷팅된 이미지 URL을 반환합니다.
     * 
     * @param userId 조회할 사용자의 ID, String 타입
     * @return 포맷팅된 이미지 URL, String 타입
     */
    public String getImageUrlFromIndexImg(String userId) {
        String userIdTemp = "";
        int num = Integer.parseInt(userId); // 사용자 ID를 정수로 변환
        
        // 사용자 ID를 3자리 문자열로 포맷팅
        if (num >= 100) {
            userIdTemp = userId; // 100 이상인 경우 그대로 사용
        } else if (num >= 10 && num <= 99) {
            userIdTemp = "0" + userId; // 10 이상 99 이하인 경우 앞에 0을 추가
        } else {
            userIdTemp = "00" + userId; // 10 미만인 경우 앞에 00을 추가
        }
        
        System.out.println("### RecommendationService - userIdTemp: " + userIdTemp);
        
        String fullUrl = s3Config.s3Endpoint() + "index_img/bcc_" + userIdTemp + ".png"; // S3 엔드포인트와 포맷팅된 이미지 경로 조합
        return fullUrl;
    }

//    // id가 list일때 url 가져오는 메서드
//    public List<String> getImageUrls(List<Integer> imageIds) {
//        List<String> imageUrls = new ArrayList<>();
//        
//        for (Integer id : imageIds) {
//        	System.out.println(id);
//            // 이미지 ID에 해당하는 URL 조회
//        	ImageTemplate imageTemplate = imageTemplateRepository.getOne(id); // id 가져옴
//        	String fullUrl = s3Config.s3Endpoint() + imageTemplate.getUrl(); // endpoint + 그 아이디에 해당하는 url 
//            imageUrls.add(fullUrl); // 리스트에 추가
//            System.out.println(imageTemplate.getUrl());
//        }
//        System.out.println(imageUrls);
//        return imageUrls;
//    }
}