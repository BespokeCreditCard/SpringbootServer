package FINAL.bespoke.service;

import FINAL.bespoke.config.S3Config;
import FINAL.bespoke.model.dto.RecommendationDto;
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
@RequiredArgsConstructor
@Service
public class GetUrlService {

    private final RecommendationRepository recommendationRepository;

    private final ImageTemplateRepository imageTemplateRepository;
    
    private final S3Config s3Config;

    private final ReceiveCardService receiveCardService;

    private final ElasticService elasticService;

    public List<Integer> getRecommendation(String userId) {
    	
    	List<Integer> imageList = new ArrayList<>();
    	// findBySEQ("ASP1FKF224HGA2GD7IZG") 할 때 반드시 "" 써야함. '' 사용하면 오류 발생
    	Recommendation recommendation = recommendationRepository.findBySEQ(userId);
    	System.out.println("### GetUrlService - recommendation: "+ recommendation);

        if (recommendation.getCardIdx1() != null) {
            imageList.add(recommendation.getCardIdx1());
        }
        if (recommendation.getCardIdx2() != null) {
            imageList.add(recommendation.getCardIdx2());
        }
        if (recommendation.getCardIdx3() != null) {
            imageList.add(recommendation.getCardIdx3());
        }
        if (recommendation.getCardIdx4() != null) {
            imageList.add(recommendation.getCardIdx4());
        }
        if (recommendation.getCardIdx5() != null) {
            imageList.add(recommendation.getCardIdx5());
        }
    	System.out.println("################################");
    	System.out.println("imageList:"+ imageList);
    	System.out.println("################################");
    	
    	return imageList;
    }
    
 // id에 따른 url 가져오기 index_img
    public String getImageUrlFromIndexImg(String userId) {
        // 이미지 ID에 해당하는 URL 조회
    	String userIdTemp = "";
    	int num = Integer.parseInt(userId);
    	if (num >= 100) {
    		userIdTemp = userId;
    	}
    	else if (num >= 10 && num <= 99) {
    		userIdTemp = "0" + userId;
    	}
    	else {
    		userIdTemp = "00" + userId;
    	}
    	
    	System.out.println("### GetUrlService - userIdTemp:" + userIdTemp);
    	
    	String fullUrl = s3Config.s3Endpoint() + "index_img/bcc_" + userIdTemp + ".png"; // userId에 따라서 upload된 이미지 가져오기
        return fullUrl;
    }
    
    // id에 따른 url 가져오기 upload
    public String getImageUrlFromUpload(String userId) {
        // 이미지 ID에 해당하는 URL 조회
    	String fullUrl = s3Config.s3Endpoint() + "upload/" + userId + ".png"; // userId에 따라서 upload된 이미지 가져오기
        return fullUrl;
    }
    
    
    // id가 list일때 url 가져오는 메서드
    public List<String> getImageUrls(List<Integer> imageIds) {
    	List<String> imageUrls = new ArrayList<>();

        if (imageIds.isEmpty()) {
            return imageUrls; // 이미지 ID 목록이 비어있으면 빈 리스트 반환
        }

        // 이미지 ID 목록을 이용하여 이미지 정보 조회
        Window<ImageTemplate> imageTemplates = imageTemplateRepository.findByIdIn(imageIds,ScrollPosition.offset());

        // Window 객체를 순회하여 각 ImageTemplate 객체를 처리
        for (ImageTemplate imageTemplate : imageTemplates) {
            String fullUrl = s3Config.s3Endpoint() + imageTemplate.getUrl(); // S3 엔드포인트와 이미지 URL 조합
            imageUrls.add(fullUrl); // 이미지 URL을 리스트에 추가
            System.out.println("### GetUrlService - imageTemplate.getUrl(): " + imageTemplate.getUrl());
        }
        return imageUrls;
    }

    public void showRecommendations(Model model, HttpServletRequest request) throws JsonProcessingException {
        // RecommendationService를 통해 recommendation 테이블의 데이터를 가져옴
        long beforeTime = System.currentTimeMillis(); // 코드 실행 전 시간
        User user = receiveCardService.findUserId(request);

        // user.getUserId()로 가져와야함
        List<Integer> imageList = getRecommendation();

        List<RecommendationDto> RecommendationDtoList = getImageUrlsToDto(imageList);

        // recommendationDTO를 모델에 추가하여 JSP 페이지로 전달
        model.addAttribute("imageUrls", RecommendationDtoList);

        List<GetResponse<ObjectNode>> response = elasticService.fetchDataElastic(imageList,"result_bulk");

        List<List<String>> categoryClass = elasticService.ElasticSearchJsonToTextClassInCategory(response);

        ObjectMapper objectMapper = new ObjectMapper();
        System.out.println(categoryClass);
        String categoryClassJson = objectMapper.writeValueAsString(categoryClass);
        System.out.println(categoryClassJson);
        model.addAttribute("categoryClassJson", categoryClassJson);


        model.addAttribute("categoryClass", categoryClass);

        System.out.println("################################");
        System.out.println("categoryClass: "+ categoryClass);
        System.out.println("################################");
        // recommendation.jsp로 이동

        long afterTime = System.currentTimeMillis(); // 코드 실행 후 시간

        long secDiffTime = (afterTime - beforeTime); // 코드 실행 전후 시간 차이 계산(초 단위)

        System.out.println("시간차이(s) : " + secDiffTime);
    }

    public List<RecommendationDto> getImageUrlsToDto(List<Integer> imageIds) {
    	List<RecommendationDto> imageUrls = new ArrayList<>();

        if (imageIds.isEmpty()) {
            return imageUrls; // 이미지 ID 목록이 비어있으면 빈 리스트 반환
        }

        // imageIds를 순회하여 각 ImageTemplate 객체를 처리
        for (Integer idx : imageIds) {
            ImageTemplate imageTemplate = imageTemplateRepository.findById(idx).orElseThrow(RuntimeException::new);
            // 이미지 ID 목록을 이용하여 이미지 정보 조회
            String fullUrl = s3Config.s3Endpoint() + imageTemplate.getUrl(); // S3 엔드포인트와 이미지 URL 조합
            imageUrls.add(new RecommendationDto(idx,fullUrl)); // 카드 인덱스와 이미지 URL을 포함한 DTO 생성
            System.out.println(imageTemplate.getUrl());
        }
        return imageUrls;
    }

    public void showRecommendations(Model model, HttpServletRequest request) throws JsonProcessingException {
        // RecommendationService를 통해 recommendation 테이블의 데이터를 가져옴
        long beforeTime = System.currentTimeMillis(); // 코드 실행 전 시간
        User user = receiveCardService.findUserId(request);

        // user.getUserId()로 가져와야함
        List<Integer> imageList = getRecommendation();

        List<RecommendationDto> RecommendationDtoList = getImageUrlsToDto(imageList);

        // recommendationDTO를 모델에 추가하여 JSP 페이지로 전달
        model.addAttribute("imageUrls", RecommendationDtoList);

        List<GetResponse<ObjectNode>> response = elasticService.fetchDataElastic(imageList,"result_bulk");

        List<List<String>> categoryClass = elasticService.ElasticSearchJsonToTextClassInCategory(response);

        ObjectMapper objectMapper = new ObjectMapper();
        System.out.println(categoryClass);
        String categoryClassJson = objectMapper.writeValueAsString(categoryClass);
        System.out.println(categoryClassJson);
        model.addAttribute("categoryClassJson", categoryClassJson);


        model.addAttribute("categoryClass", categoryClass);

        System.out.println("################################");
        System.out.println("categoryClass: "+ categoryClass);
        System.out.println("################################");
        // recommendation.jsp로 이동

        long afterTime = System.currentTimeMillis(); // 코드 실행 후 시간

        long secDiffTime = (afterTime - beforeTime); // 코드 실행 전후 시간 차이 계산(초 단위)

        System.out.println("시간차이(s) : " + secDiffTime);
    }

    public List<RecommendationDto> getImageUrlsToDto(List<Integer> imageIds) {
    	List<RecommendationDto> imageUrls = new ArrayList<>();

        if (imageIds.isEmpty()) {
            return imageUrls; // 이미지 ID 목록이 비어있으면 빈 리스트 반환
        }

        // imageIds를 순회하여 각 ImageTemplate 객체를 처리
        for (Integer idx : imageIds) {
            ImageTemplate imageTemplate = imageTemplateRepository.findById(idx).orElseThrow(RuntimeException::new);
            // 이미지 ID 목록을 이용하여 이미지 정보 조회
            String fullUrl = s3Config.s3Endpoint() + imageTemplate.getUrl(); // S3 엔드포인트와 이미지 URL 조합
            imageUrls.add(new RecommendationDto(idx,fullUrl)); // 카드 인덱스와 이미지 URL을 포함한 DTO 생성
            System.out.println(imageTemplate.getUrl());
        }
        return imageUrls;
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