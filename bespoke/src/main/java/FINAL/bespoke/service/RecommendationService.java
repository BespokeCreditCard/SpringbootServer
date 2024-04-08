package FINAL.bespoke.service;

import FINAL.bespoke.model.entity.ImageTemplate;
import FINAL.bespoke.model.entity.Recommendation;
import FINAL.bespoke.repository.ImageTemplateRepository;
import FINAL.bespoke.repository.RecommendationRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecommendationService {

    private final RecommendationRepository recommendationRepository;

    private final ImageTemplateRepository imageTemplateRepository;
    
    @Autowired
    public RecommendationService(RecommendationRepository recommendationRepository, ImageTemplateRepository imageTemplateRepository) {
        this.recommendationRepository = recommendationRepository;
        this.imageTemplateRepository = imageTemplateRepository;
    }

    public List<Integer> getRecommendation() {
    	
    	List<Integer> imageList = new ArrayList<>();
    	// findBySEQ("ASP1FKF224HGA2GD7IZG") 할 때 반드시 "" 써야함. '' 사용하면 오류 발생
    	Recommendation recommendation = recommendationRepository.findBySEQ("ASP1FKF224HGA2GD7IZG");
//		RecommendationDto recommendationDto = new RecommendationDto();
//        recommendationDto.setTop1(recommendation.getTop1());
//        recommendationDto.setTop2(recommendation.getTop2());
//        recommendationDto.setTop3(recommendation.getTop3());
//        recommendationDto.setTop4(recommendation.getTop4());
//        recommendationDto.setTop5(recommendation.getTop5());
//        return recommendationDto;
    	System.out.println("################################");
    	System.out.println(recommendation);
    	System.out.println("################################");
    	imageList.add(recommendation.getTop1());
    	imageList.add(recommendation.getTop2());
    	imageList.add(recommendation.getTop3());
    	imageList.add(recommendation.getTop4());
    	imageList.add(recommendation.getTop5());
    	System.out.println("################################");
    	System.out.println(imageList);
    	System.out.println("################################");
    	
    	return imageList;
    }
    
    public List<String> getImageUrlsByImageIds(List<Integer> imageIds) {
        List<String> imageUrls = new ArrayList<>();

        for (Integer id : imageIds) {
        	System.out.println(id);
            // 이미지 ID에 해당하는 URL 조회
        	ImageTemplate imageTemplate = imageTemplateRepository.getOne(id);
        	System.out.println(imageTemplate.getUrl());
            imageUrls.add(imageTemplate.getUrl());
            System.out.println(imageTemplate.getUrl());
        }
        System.out.println(imageUrls);
        return imageUrls;
    }
}