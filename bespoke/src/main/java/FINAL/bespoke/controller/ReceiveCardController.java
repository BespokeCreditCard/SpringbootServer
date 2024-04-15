package FINAL.bespoke.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import FINAL.bespoke.service.GetUrlService;
import co.elastic.clients.elasticsearch.security.User;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ReceiveCardController {
	
	@GetMapping("/receivecard")
	public String deliverData(HttpServletRequest request, Model model) throws Exception{
//	    HttpSession session = request.getSession();
//	    String name = (String) session.getAttribute("");
		User userIdTemp = ReceiveCardService.findUserId(); // ReceiveCardService에서 가져온 행 
		String userImageUrl = GetUrlService.getImageUrl(userIdTemp.getUserId()); // id 가져와서 
		
		model.addAttribute("userData", userIdTemp);
		model.addAttribute("userImageUrl", userImageUrl);
		return "receivecard";
	}
	
}
