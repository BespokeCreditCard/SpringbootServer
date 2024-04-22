package FINAL.bespoke.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import FINAL.bespoke.model.dto.wordDetailsDTO;
import FINAL.bespoke.service.ElasticService;
import co.elastic.clients.elasticsearch.core.GetResponse;
import jakarta.servlet.http.HttpServletRequest;


@Controller
public class WordCloudController {
	private final ElasticService elasticService;
    private final ObjectMapper objectMapper;

    public WordCloudController(ElasticService elasticService, ObjectMapper objectMapper) {
        this.elasticService = elasticService;
        this.objectMapper = objectMapper;
    }
	
	@GetMapping("wordcloud")
	public String goWordCloud(Model model, HttpServletRequest request) {

		// 세션에서 값 불러오기
		List<Integer> cardId = List.of(22, 6, 1, 2, 3);
		List<GetResponse<ObjectNode>> response = elasticService.fetchDataElastic(cardId,"card_word");
		wordDetailsDTO wordDetailsDTO = elasticService.ElasticSearchJsonTocardWordData(response);
//		model.addAttribute("wordcloud",cardWordDetail);
//		System.out.println(cardWordDetail);
		System.out.println(wordDetailsDTO.getCardWord());
		String json = "";
		try {
			json = objectMapper.writeValueAsString(wordDetailsDTO.getCardWord());
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        model.addAttribute("wordcloudJson",json);
        model.addAttribute("word",wordDetailsDTO.getCardWord());
        System.out.println(json);
        model.addAttribute("worddetailscardname",wordDetailsDTO.getCardName());
		return "wordcloud";
	}
	
}
