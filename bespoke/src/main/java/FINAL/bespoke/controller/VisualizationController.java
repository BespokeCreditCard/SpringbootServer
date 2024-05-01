package FINAL.bespoke.controller;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import FINAL.bespoke.service.ReceiveCardService;
import jakarta.servlet.http.HttpServletRequest;
@Controller
public class VisualizationController {
	 private final ReceiveCardService receiveCardService;
	 
	 public VisualizationController(ReceiveCardService receiveCardService) {
		 this.receiveCardService = receiveCardService;
	 }
	 
	 @GetMapping("/visualization")
	 public String govisualization(Model model,HttpServletRequest request) {
		 String seq = receiveCardService.findUserId(request).getUserID();
		 System.out.println("seq 확인1");
		 model.addAttribute("seq",seq);
		 return "visualization";
	 }

}