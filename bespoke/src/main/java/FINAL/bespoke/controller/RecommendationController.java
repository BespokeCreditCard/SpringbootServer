package FINAL.bespoke.controller;

import FINAL.bespoke.model.dto.RecommendationDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import FINAL.bespoke.service.RecommendationService;

@Controller
public class RecommendationController {

    private final RecommendationService recommendationService;

    @Autowired
    public RecommendationController(RecommendationService recommendationService) {
        this.recommendationService = recommendationService;
    }

    @GetMapping("/recommendation")
    public String showRecommendation(Model model) {
        // RecommendationService를 통해 top5_recommendation 테이블의 데이터를 가져옴
        RecommendationDto recommendationDto = recommendationService.getTopRecommendations();

        // recommendationDTO를 모델에 추가하여 JSP 페이지로 전달
        model.addAttribute("recommendations", recommendationDto);

        // recommendation.jsp로 이동
        return "recommendation";
    }
}