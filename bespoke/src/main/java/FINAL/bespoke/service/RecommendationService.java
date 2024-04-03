package FINAL.bespoke.service;

import FINAL.bespoke.model.dto.RecommendationDto;
import FINAL.bespoke.model.entity.Recommendation;
import FINAL.bespoke.repository.RecommendationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecommendationService {

    private final RecommendationRepository recommendationRepository;

    @Autowired
    public RecommendationService(RecommendationRepository recommendationRepository) {
        this.recommendationRepository = recommendationRepository;
    }

    public RecommendationDto getRecommendation() {
    	// findBySEQ("ASP1FKF224HGA2GD7IZG") 할 때 반드시 "" 써야함. '' 사용하면 오류 발생
    	Recommendation recommendation = recommendationRepository.findBySEQ("ASP1FKF224HGA2GD7IZG");
		RecommendationDto recommendationDto = new RecommendationDto();
        recommendationDto.setTop1(recommendation.getTop1());
        recommendationDto.setTop2(recommendation.getTop2());
        recommendationDto.setTop3(recommendation.getTop3());
        recommendationDto.setTop4(recommendation.getTop4());
        recommendationDto.setTop5(recommendation.getTop5());
        return recommendationDto;
    }
}