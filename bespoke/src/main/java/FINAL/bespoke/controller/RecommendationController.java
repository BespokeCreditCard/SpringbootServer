package FINAL.bespoke.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import FINAL.bespoke.model.entity.User;
import FINAL.bespoke.service.ElasticService;
import FINAL.bespoke.service.RecommendationService;
import FINAL.bespoke.service.ReceiveCardService;
import co.elastic.clients.elasticsearch.core.GetResponse;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/recommendation_view")
public class RecommendationController {

    private final RecommendationService recommendationService;
    private final ElasticService elasticService;
    private final ReceiveCardService receiveCardService;
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