package FINAL.bespoke.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fasterxml.jackson.databind.node.ObjectNode;

import FINAL.bespoke.model.entity.User;
import FINAL.bespoke.service.ElasticService;
import FINAL.bespoke.service.GetUrlService;
import FINAL.bespoke.service.ReceiveCardService;
import co.elastic.clients.elasticsearch.core.GetResponse;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ReceiveCardController {
	
	public final ReceiveCardService receiveCardService;
	
	public final GetUrlService getUrlService;
	
	public final ElasticService elasticService;
	@Autowired
	public ReceiveCardController(ReceiveCardService receiveCardService, GetUrlService getUrlService, ElasticService elasticService) {
		this.receiveCardService = receiveCardService;
		this.getUrlService = getUrlService;
		this.elasticService = elasticService;
	}
	
	@GetMapping("/receivecard")
	public String deliverData(HttpServletRequest request, Model model) throws Exception{
//	    HttpSession session = request.getSession();
//	    String name = (String) session.getAttribute("");
		User userIdTemp = receiveCardService.findUserId(request); // ReceiveCardService에서 가져온 행 
		model.addAttribute("userData", userIdTemp);
		
		String userImageUrl = getUrlService.getImageUrl(userIdTemp.getUserID()); // id 가져와서 
		model.addAttribute("userImageUrl", userImageUrl);

 		//userid 로 elasticservice에 참조하는 코드
 		GetResponse<ObjectNode> response = elasticService.fetchimageIdData(userIdTemp.getCardId());
        
        List<String> productDetails = elasticService.ElasticSearchJsonToTextProduct(response);
        List<String> categoryDetails = elasticService.ElasticSearchJsonToTextCategory(response);
        
        model.addAttribute("elasticresultDetail", productDetails);
        model.addAttribute("categoriesResultDetail", categoryDetails);
        System.out.println(categoryDetails);
		
		return "receivecard";
	}
	
}
