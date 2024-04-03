package FINAL.bespoke.service;

import FINAL.bespoke.model.dto.RecommendationDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import FINAL.bespoke.repository.RecommendationRepository;

@Service
public class RecommendationService {

    private final RecommendationRepository recommendationRepository;

    @Autowired
    public RecommendationService(RecommendationRepository recommendationRepository) {
        this.recommendationRepository = recommendationRepository;
    }

    public RecommendationDto getTopRecommendations() {
        // RecommendationRepository를 통해 top5_recommendation 테이블의 데이터를 가져오는 로직 구현
        // 이 데이터를 RecommendationDTO에 매핑하여 반환
        // 예시로는 데이터베이스에서 가져온 데이터를 DTO에 매핑하는 과정만 표시함
        RecommendationDto recommendationDto = new RecommendationDto();
        recommendationDto.setRecommendation1("추천1");
        recommendationDto.setRecommendation2("추천2");
        recommendationDto.setRecommendation3("추천3");
        recommendationDto.setRecommendation4("추천4");
        recommendationDto.setRecommendation5("추천5");

        return recommendationDto;
    }
}