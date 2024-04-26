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
    
    @GetMapping("/recommendation")
    public String showRecommendation(Model model, HttpServletRequest request) throws JsonProcessingException {
    	recommendationService.showRecommendations(model, request);
        return "recommendation_view/recommendation";
    }

    @GetMapping("/selectRecommendation")
    public String getSelectRecommendationPage(Model model, HttpServletRequest request) throws JsonProcessingException {
    	recommendationService.getUserId(model, request);
        return "recommendation_view/selectRecommendation";
    }
}