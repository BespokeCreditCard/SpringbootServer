package FINAL.bespoke.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fasterxml.jackson.databind.node.ObjectNode;

import FINAL.bespoke.service.ElasticService;
import co.elastic.clients.elasticsearch.core.GetResponse;

@Controller
public class WordCloudController {
	private final ElasticService elasticService;
	
	public WordCloudController(ElasticService elasticService) {
		this.elasticService = elasticService;
	}
	
	@GetMapping("wordcloud")
	public String goWordCloud(Model model) {
		
		int cardid = 1;
		GetResponse<ObjectNode> response = elasticService.fetchDataElastic(String.valueOf(cardid),"card_word");
		List<String> cardWordDetail = elasticService.ElasticSearchJsonTocardWordData(response);
		model.addAttribute("wordcloud",cardWordDetail);
		System.out.println(cardWordDetail); 
		return "wordcloud";
	}
	
}
