package FINAL.bespoke.controller;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import FINAL.bespoke.model.dto.WordDetailsDto;
import FINAL.bespoke.service.ElasticService;
import FINAL.bespoke.service.ReceiveCardService;
import FINAL.bespoke.service.RecommendationService;
import co.elastic.clients.elasticsearch.core.GetResponse;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class WordCloudController {
	
	private final ElasticService elasticService;
    private final ObjectMapper objectMapper;
    private final RecommendationService recommendationService;
    private final ReceiveCardService receiveCardService;
    
    public WordCloudController(RecommendationService recommendationService,ReceiveCardService receiveCardService, ElasticService elasticService, ObjectMapper objectMapper) {
        this.elasticService = elasticService;
        this.objectMapper = objectMapper;
        this.recommendationService = recommendationService;
        this.receiveCardService = receiveCardService;
    }
	
	@GetMapping("wordcloud")
	public String goWordCloud(Model model, HttpServletRequest request) {
		User user = receiveCardService.findUserId(request);
        // RecommendationService를 통해 recommendation 테이블의 데이터를 가져옴
        RecommendationTop5Dto recommendationTop5Dto = recommendationService.getRecommendation(user.getUserID());;
        List<Integer> cardId = recommendationTop5Dto.getImageList();
        
		List<GetResponse<ObjectNode>> response = elasticService.fetchDataElastic(cardId,"card_word");
		wordDetailsDTO wordDetailsDTO = elasticService.ElasticSearchJsonTocardWordData(response);
//		model.addAttribute("wordcloud",cardWordDetail);
//		System.out.println(cardWordDetail);
		System.out.println("### WordCloudController - wordDetailsDTO.getCardWord(): " + wordDetailsDTO.getCardWord());
		String json = "";
		try {
			json = objectMapper.writeValueAsString(wordDetailsDTO.getCardWord());
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        model.addAttribute("wordcloudJson",json);
        model.addAttribute("word",wordDetailsDTO.getCardWord());
        System.out.println("### WordCloudController - json: " + json);
        model.addAttribute("worddetailscardname",wordDetailsDTO.getCardName());
		return "wordcloud";
	}
	
}
