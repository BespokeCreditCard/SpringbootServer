package FINAL.bespoke.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import FINAL.bespoke.model.entity.Visualization;
import FINAL.bespoke.service.ReceiveCardService;
import FINAL.bespoke.service.VisualizationService;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class VisualizationController {
	 private final VisualizationService visualizationService;
	 private final ReceiveCardService receiveCardService;
	 
	 public VisualizationController(VisualizationService visualizationService, ReceiveCardService receiveCardService) {
		 this.visualizationService = visualizationService;
		 this.receiveCardService = receiveCardService;
	 }
	 
	 @GetMapping("visualization")
	 public String govisualization(Model model,HttpServletRequest request) {
		 String seq = receiveCardService.findUserId(request).getUserID();
		 Visualization visual = visualizationService.getVisualization(seq);
		 model.addAttribute("visual",visual);
		 return "visualization";
	 }
}
