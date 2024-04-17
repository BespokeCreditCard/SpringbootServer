package FINAL.bespoke.service;

import FINAL.bespoke.config.S3Config;
import FINAL.bespoke.model.entity.ImageTemplate;
import FINAL.bespoke.model.entity.Recommendation;
import FINAL.bespoke.repository.ImageTemplateRepository;
import FINAL.bespoke.repository.RecommendationRepository;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.ScrollPosition;
import org.springframework.data.domain.Window;
import org.springframework.stereotype.Service;

@Service
public class GetUrlService {

    private final RecommendationRepository recommendationRepository;

    private final ImageTemplateRepository imageTemplateRepository;
    
    private final S3Config s3Config;
    
    @Autowired
    public GetUrlService(RecommendationRepository recommendationRepository, ImageTemplateRepository imageTemplateRepository, S3Config s3Config) {
        this.recommendationRepository = recommendationRepository;
        this.imageTemplateRepository = imageTemplateRepository;
        this.s3Config = s3Config;
    }

    public List<Integer> getRecommendation() {
    	
    	List<Integer> imageList = new ArrayList<>();
    	// findBySEQ("ASP1FKF224HGA2GD7IZG") 할 때 반드시 "" 써야함. '' 사용하면 오류 발생
    	Recommendation recommendation = recommendationRepository.findBySEQ("8YBQA0UZ1JNAPF1LPQC3");
//		RecommendationDto recommendationDto = new RecommendationDto();
//        recommendationDto.setTop1(recommendation.getTop1());
//        recommendationDto.setTop2(recommendation.getTop2());
//        recommendationDto.setTop3(recommendation.getTop3());
//        recommendationDto.setTop4(recommendation.getTop4());
//        recommendationDto.setTop5(recommendation.getTop5());
//        return recommendationDto;
    	System.out.println("################################");
    	System.out.println("recommendation: "+ recommendation);
    	System.out.println("################################");
    	imageList.add(recommendation.getTop1());
    	imageList.add(recommendation.getTop2());
    	imageList.add(recommendation.getTop3());
    	imageList.add(recommendation.getTop4());
    	imageList.add(recommendation.getTop5());
    	System.out.println("################################");
    	System.out.println("imageList:"+ imageList);
    	System.out.println("################################");
    	
    	return imageList;
    }
    
    // id에 따른 url 가져오기
    public String getImageUrl(String userId) {
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