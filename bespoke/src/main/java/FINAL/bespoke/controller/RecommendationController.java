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
        // RecommendationService를 통해 recommendation 테이블의 데이터를 가져옴
    	long beforeTime = System.currentTimeMillis(); // 코드 실행 전 시간
    	
    	User userIdTemp = receiveCardService.findUserId(request); // ReceiveCardService에서 가져온 행 
		
        List<Integer> imageList = recommendationService.getRecommendation(userIdTemp.getUserID());
        System.out.println("### RecommendationController - imageList: " + imageList);
        model.addAttribute("imageIdList", imageList);
        List<String> imageUrls = recommendationService.getImageUrls(imageList);
        
        // recommendationDTO를 모델에 추가하여 JSP 페이지로 전달
        model.addAttribute("imageUrls", imageUrls);

        User user = receiveCardService.findUserId(request);
        List<GetResponse<ObjectNode>> response = elasticService.fetchData(imageList);
        
        List<List<String>> categoryClass = elasticService.ElasticSearchJsonToTextClassInCategory(response);
        
        ObjectMapper objectMapper = new ObjectMapper();
        System.out.println("### RecommendationController - categoryClass: " + categoryClass);
        String categoryClassJson = objectMapper.writeValueAsString(categoryClass);
        System.out.println("### RecommendationController - categoryClassJson: " + categoryClassJson);
        model.addAttribute("categoryClassJson", categoryClassJson);
        
        
//        model.addAttribute("categoryClass", categoryClass);
        
    	System.out.println("### RecommendationController - categoryClass: "+ categoryClass);
        // recommendation.jsp로 이동
    	
    	long afterTime = System.currentTimeMillis(); // 코드 실행 후 시간
    	
    	long secDiffTime = (afterTime - beforeTime); // 코드 실행 전후 시간 차이 계산(초 단위)
    	
    	System.out.println("### RecommendationController - secDiffTime(시간차이(s)): " + secDiffTime);
        return "recommendation_view/recommendation";
    }
}