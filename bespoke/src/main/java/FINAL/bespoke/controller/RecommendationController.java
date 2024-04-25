package FINAL.bespoke.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.fasterxml.jackson.core.JsonProcessingException;
import FINAL.bespoke.service.RecommendationService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/recommendation_view")
public class RecommendationController {

    private final RecommendationService recommendationService;
//    public RecommendationController(GetUrlService recommendationService, ElasticService elasticService, ReceiveCardService receiveCardService) {
//        this.recommendationService = recommendationService;
//        this.elasticService = elasticService;
//        this.receiveCardService = receiveCardService;
//    }
    
    @GetMapping("/recommendation")
    public String showRecommendation(Model model, HttpServletRequest request) throws JsonProcessingException {
    	// 여기 있던 코드를 service -> showRecommendations로 넣음
    	recommendationService.showRecommendations(model, request);
        return "recommendation_view/recommendation";
    }

    @GetMapping("/selectRecommendation")
    public String getSelectRecommendationPage(Model model, HttpServletRequest request) throws JsonProcessingException {
    	recommendationService.getUserId(model, request);
        return "recommendation_view/selectRecommendation";
    }
}