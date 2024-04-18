package FINAL.bespoke.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.List;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ReceiveCardController {
	
	public final ReceiveCardService receiveCardService;
	
	public final GetUrlService getUrlService;
	
	public final ElasticService elasticService;
	private final String s3Endpoint;

	@Autowired
	public ReceiveCardController(ReceiveCardService receiveCardService, GetUrlService getUrlService, ElasticService elasticService, String s3Endpoint) {
		this.receiveCardService = receiveCardService;
		this.getUrlService = getUrlService;
		this.elasticService = elasticService;
		this.s3Endpoint = s3Endpoint;
	}

	@GetMapping("/receivecard")
	public String deliverData(HttpServletRequest request, HttpSession session, Model model) throws Exception{
//	    HttpSession session = request.getSession();
//	    String name = (String) session.getAttribute("");
		User userIdTemp = receiveCardService.findUserId(request); // ReceiveCardService에서 가져온 행
		model.addAttribute("userData", userIdTemp);
		
		String userImageUrl = getUrlService.getImageUrlFromUpload(userIdTemp.getUserID()); // id 가져와서 
		model.addAttribute("userImageUrl", userImageUrl);

 		//userid 로 elasticservice에 참조하는 코드
// 		GetResponse<ObjectNode> response = elasticService.fetchDataElastic(userIdTemp.getCardId(),"result_bulk");
//
//        List<String> productDetails = elasticService.ElasticSearchJsonToTextProduct(response);
//        List<String> categoryDetails = elasticService.ElasticSearchJsonToTextCategory(response);
//
//        model.addAttribute("elasticresultDetail", productDetails);
//        model.addAttribute("categoriesResultDetail", categoryDetails);
//        System.out.println(categoryDetails);

		return "receivecard";
	}

	@PostMapping(path = "/receivecard", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
	public String deliveryFile(@RequestPart(name = "files", required = false) MultipartFile file,
							   HttpSession session, RedirectAttributes ra) throws Exception{
		byte[] fileBytes = file.getBytes();
		String base64EncodedFile = Base64.getEncoder().encodeToString(fileBytes);
		session.setAttribute("tempCard", base64EncodedFile);
		// 파일의 경로를 리다이렉션된 페이지로 전달
		ra.addFlashAttribute("file", base64EncodedFile);

		return "redirect:/receivecard";
	}
}
