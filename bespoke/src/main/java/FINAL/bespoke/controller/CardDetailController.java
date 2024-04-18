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

        List<GetResponse<ObjectNode>> response = elasticService.fetchimageIdData(imageList);
        
        List<List<String>> productDetails = elasticService.ElasticSearchJsonToTextProduct(response);
        List<List<String>> categoryDetails = elasticService.ElasticSearchJsonToTextCategory(response);
        
        
        model.addAttribute("elasticresultDetail", productDetails);
        model.addAttribute("categoriesResultDetail", categoryDetails);

        return "carddetail_view/carddetail";
    }
}