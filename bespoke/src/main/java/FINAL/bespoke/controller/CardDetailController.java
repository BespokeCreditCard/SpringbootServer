package FINAL.bespoke.controller;

import FINAL.bespoke.model.dto.RecommendationTop5Dto;
import FINAL.bespoke.model.entity.User;
import FINAL.bespoke.service.ElasticService;
import FINAL.bespoke.service.ReceiveCardService;
import FINAL.bespoke.service.RecommendationService;
import co.elastic.clients.elasticsearch.core.GetResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletRequest;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

@Controller
@RequestMapping("/carddetail_view")
public class CardDetailController {

    private final RecommendationService recommendationService;
    private final ReceiveCardService receiveCardService;
    
    
    private final ElasticService elasticService;
    
    private final ReceiveCardService receiveCardService;

    @Autowired
    public CardDetailController(RecommendationService recommendationService, ElasticService elasticService, ReceiveCardService receiveCardService) {
        this.recommendationService = recommendationService;
		this.receiveCardService = receiveCardService;
        this.elasticService = elasticService;
        this.receiveCardService = receiveCardService;
    }
        
    @GetMapping("/carddetail")
    public String showRecommendation(Model model , HttpServletRequest request) throws JsonProcessingException {
    	// json 파일로 굽기 위한 class
    	ObjectMapper objectMapper = new ObjectMapper();
    	// RecommendationService를 통해 recommendation 테이블의 데이터를 가져옴
        long beforeTime = System.currentTimeMillis(); // 코드 실행 전 시간
        User user = receiveCardService.findUserId(request);
        
        // RecommendationService를 통해 recommendation 테이블의 데이터를 가져옴
        RecommendationTop5Dto recommendationTop5Dto = recommendationService.getRecommendation(user.getUserID());;
        List<Integer> imageList = recommendationTop5Dto.getImageList();
        
        // 버튼쪽에 선택한 혜택 보여주고 싶으면 이거 쓰면 됨
        List<String> benefitList = recommendationTop5Dto.getBenefitList();

        List<String> imageUrls = recommendationService.getImageUrls(imageList);
        
        // recommendationDTO를 모델에 추가하여 JSP 페이지로 전달
        model.addAttribute("imageUrls", imageUrls); // imageUrls[0], imageUrls[1], imageUrls[2], imageUrls[3], imageUrls[4]

        List<GetResponse<ObjectNode>> response = elasticService.fetchDataElastic(imageList,"result_bulk");
        
        List<List<String>> productDetails = elasticService.ElasticSearchJsonToTextProduct(response);
        List<List<String>> categoryDetails = elasticService.ElasticSearchJsonToTextCategory(response);
        
        
        model.addAttribute("elasticresultDetail", productDetails);
        model.addAttribute("categoriesResultDetail", categoryDetails);

        return "carddetail_view/carddetail";
    }
}