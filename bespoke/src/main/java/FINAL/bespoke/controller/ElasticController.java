package FINAL.bespoke.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

import FINAL.bespoke.service.ElasticService;
import co.elastic.clients.elasticsearch.core.GetResponse;

@Controller
@RequestMapping("/elasticsearch")
public class ElasticController {

    private final ElasticService elasticService;

    @Autowired
    public ElasticController(ElasticService elasticService) {
        this.elasticService = elasticService;
    }

    @GetMapping("/elastictest")
    public String fetchData(Model model) {
    	GetResponse<ObjectNode> response = elasticService.fetchData();
    	List<String> productNames = new ArrayList<>();
        ObjectNode json = response.source();
        JsonNode cardNameNode = json.get("card_name"); // 카드 이름
        productNames.add(cardNameNode.asText()); // elasticresults[0]
        
        JsonNode idNode = json.get("id"); // 카드 id
        productNames.add(idNode.asText());// elasticresults[1]
        
        JsonNode cardLinkNode = json.get("card_link"); // 카드 링크
        productNames.add(cardLinkNode.asText());// elasticresults[2]
        
        JsonNode cardTypeNode = json.get("card_type"); // 카드 타입
        productNames.add(cardTypeNode.asText());// elasticresults[3]
        
        JsonNode domesticYearCostNode = json.get("domestic_year_cost"); // 카드 국내 연회비
        productNames.add(domesticYearCostNode.asText());// elasticresults[4]
        
        JsonNode abroadYearCostNode = json.get("abroad_year_cost"); // 카드 해외 연회비
        productNames.add(abroadYearCostNode.asText());// elasticresults[5]
        
        JsonNode previousMonthPerformanceNode = json.get("previous_month_performance"); // 카드 전월 실적
        productNames.add(previousMonthPerformanceNode.asText());// elasticresults[6]
        
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
//                String categoryInfo = "Class: " + categoryClass + ", Benefit: " + categoryBenefit + ", Condition: " + categoryCondition;
//                categories.add(categoryInfo);
            }
        }
        
        
        
//        if (response != null && response.found()) {
//            ObjectNode json = response.source();
//            productName = json.get("name").asText();
//        }
        model.addAttribute("elasticresults", productNames);
        model.addAttribute("categories", categories);
        
        
        System.out.println("#####################################################################");
		System.out.println(productNames);
		System.out.println("#####################################################################");
        return "elasticsearch/elastictest";
    }
    
    
}

