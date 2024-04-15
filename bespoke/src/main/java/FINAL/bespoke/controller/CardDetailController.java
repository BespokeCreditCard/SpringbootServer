package FINAL.bespoke.controller;

import FINAL.bespoke.service.ElasticService;
import FINAL.bespoke.service.GetUrlService;
import co.elastic.clients.elasticsearch.core.GetResponse;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

@Controller
@RequestMapping("/carddetail_view")
public class CardDetailController {

    private final GetUrlService recommendationImageUrlService;
    
    private final ElasticService elasticService;

    @Autowired
    public CardDetailController(GetUrlService recommendationImageUrlService, ElasticService elasticService) {
        this.recommendationImageUrlService = recommendationImageUrlService;
        this.elasticService = elasticService;
    }
        
    @GetMapping("/carddetail")
    public String showRecommendation(Model model) {
        // RecommendationService를 통해 recommendation 테이블의 데이터를 가져옴
        List<Integer> imageList = recommendationImageUrlService.getRecommendation();

        List<String> imageUrls = recommendationImageUrlService.getImageUrls(imageList);
        
        // recommendationDTO를 모델에 추가하여 JSP 페이지로 전달
        model.addAttribute("imageUrls", imageUrls); // imageUrls[0], imageUrls[1], imageUrls[2], imageUrls[3], imageUrls[4]

        List<Integer> jsonImageId = recommendationImageUrlService.getImageIds(imageList);
        List<GetResponse<ObjectNode>> response = elasticService.fetchData(jsonImageId);
        
        List<List<String>> productDetails = new ArrayList<>(); // 각 제품 정보를 담을 리스트의 리스트
        List<List<String>> categoryDetails = new ArrayList<>(); // 각 제품 정보를 담을 리스트의 리스트

        // ####################################################
        for (GetResponse<ObjectNode> responseObject : response) {
        	// responseObject는 response 에서 하나씩 jsonImageId 값을 하나씪 받음
        	ObjectNode json = responseObject.source();
        	
        	List<String> productNames = new ArrayList<>();
        	JsonNode cardNameNode = json.get("card_name"); // 카드 이름
            productNames.add(cardNameNode.asText()); // elasticresults[0]
            
            JsonNode cardTypeNode = json.get("card_type"); // 카드 타입
            productNames.add(cardTypeNode.asText());// elasticresults[1]
            
            JsonNode domesticYearCostNode = json.get("domestic_year_cost"); // 카드 국내 연회비
            productNames.add(domesticYearCostNode.asText());// elasticresults[2]
            
            JsonNode abroadYearCostNode = json.get("abroad_year_cost"); // 카드 해외 연회비
            productNames.add(abroadYearCostNode.asText());// elasticresults[3]
            
            JsonNode previousMonthPerformanceNode = json.get("previous_month_performance"); // 카드 전월 실적
            productNames.add(previousMonthPerformanceNode.asText());// elasticresults[4]
            
            JsonNode categoryNode = json.get("category");
            List<String> categories = new ArrayList<>();
            if (categoryNode != null && categoryNode.isArray()) {
                for (JsonNode node : categoryNode) {
                    String categoryClass = node.get("class").asText();
                    categories.add(categoryClass);
                    String categoryBenefit = node.get("benefit").asText();
                    categories.add(categoryBenefit);
                    String categoryCondition = node.get("condition").asText();
                    categories.add(categoryCondition);
                }
            }
            
            productDetails.add(productNames);
            categoryDetails.add(categories);
        }
    	
        
//        
        
        model.addAttribute("elasticresultDetail", productDetails);
        model.addAttribute("categoriesResultDetail", categoryDetails);
//        
        
        // recommendation.jsp로 이동
        return "carddetail_view/carddetail";
    }
}