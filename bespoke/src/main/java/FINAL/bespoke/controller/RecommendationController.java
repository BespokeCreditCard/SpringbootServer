package FINAL.bespoke.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import FINAL.bespoke.model.entity.User;
import FINAL.bespoke.service.ElasticService;
import FINAL.bespoke.service.GetUrlService;
import FINAL.bespoke.service.ReceiveCardService;
import co.elastic.clients.elasticsearch.core.GetResponse;
import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/recommendation_view")
public class RecommendationController {

    private final GetUrlService recommendationService;

    private final ElasticService elasticService;
    
    private final ReceiveCardService receiveCardService;
    
    private final GetUrlService getUrlService;
    
    @Autowired
    public RecommendationController(GetUrlService recommendationService, ElasticService elasticService, ReceiveCardService receiveCardService, GetUrlService getUrlService) {
        this.recommendationService = recommendationService;
        this.elasticService = elasticService;
        this.receiveCardService = receiveCardService;
        this.getUrlService = getUrlService;
    }
        
    @GetMapping("/recommendation")
    public String showRecommendation(Model model, HttpServletRequest request) throws JsonProcessingException {
    	// 여기 있던 코드를 service -> showRecommendations로 넣음
    	recommendationService.showRecommendations(model, request);
        return "recommendation_view/recommendation";
    }

    @GetMapping("/selectRecommendation")
    public String getSelectRecommendationPage() {
        return "recommendation_view/selectRecommendation";
    }
}