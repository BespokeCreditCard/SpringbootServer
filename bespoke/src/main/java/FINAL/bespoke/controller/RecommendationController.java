package FINAL.bespoke.controller;

import FINAL.bespoke.model.dto.RecommendationDto;
import FINAL.bespoke.service.RecommendationService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/recommendation_view")
public class RecommendationController {

    private final RecommendationService recommendationService;

    @Autowired
    public RecommendationController(RecommendationService recommendationService) {
        this.recommendationService = recommendationService;
    }
        
    @GetMapping("/recommendation")
    public String showRecommendation(Model model) {
        // RecommendationService를 통해 recommendation 테이블의 데이터를 가져옴
        List<Integer> imageList = recommendationService.getRecommendation();

        List<String> imageUrls = recommendationService.getImageUrlsByImageIds(imageList);
        
        // recommendationDTO를 모델에 추가하여 JSP 페이지로 전달
        model.addAttribute("imageUrls", imageUrls);

    	System.out.println("################################");
    	System.out.println(imageUrls);
    	System.out.println("################################");
        // recommendation.jsp로 이동
        return "recommendation_view/recommendation";
    }
}