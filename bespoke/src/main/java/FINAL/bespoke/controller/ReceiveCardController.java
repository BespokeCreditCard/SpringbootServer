package FINAL.bespoke.controller;

import java.util.Base64;
import java.util.Optional;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import FINAL.bespoke.model.dto.DeliveryAddressDto;
import FINAL.bespoke.model.entity.User;
import FINAL.bespoke.repository.UserRepository;
import FINAL.bespoke.service.ElasticService;
import FINAL.bespoke.service.RecommendationService;
import FINAL.bespoke.service.ReceiveCardService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ReceiveCardController {
	
	public final ReceiveCardService receiveCardService;
	public final RecommendationService getUrlService;
	public final ElasticService elasticService;
	public final UserRepository userRepository;

	@Autowired
	public ReceiveCardController(ReceiveCardService receiveCardService, RecommendationService getUrlService, ElasticService elasticService, UserRepository userRepository) {
		this.receiveCardService = receiveCardService;
		this.getUrlService = getUrlService;
		this.elasticService = elasticService;
		this.userRepository = userRepository;
	}

	@GetMapping("/receivecard")
	public String deliverData(HttpServletRequest request, HttpSession session, Model model) throws Exception{
//	    HttpSession session = request.getSession();
//	    String name = (String) session.getAttribute("");
		User userIdTemp = receiveCardService.findUserId(request); // ReceiveCardService에서 가져온 행
		model.addAttribute("userData", userIdTemp);
		model.addAttribute("file", session.getAttribute("tempCard"));
		String userImageUrl = getUrlService.getImageUrl(userIdTemp.getUserID()); // id 가져와서
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
	@Transactional
	public void updateUserAddress(String userId, String newAddress) {
        Optional<User> userTemp =  userRepository.findById(userId);
        
        if(userTemp.isPresent()) {
        	User user = userTemp.get();
        	user.setDeliveryAddress(newAddress);
        	userRepository.save(user);
        }
    }
	
	@PostMapping("/receivecard")
    public String updateAddress(@RequestBody DeliveryAddressDto dto) {
		String userId = dto.getUserId();
		String address = dto.getAddress();
        // 주소 업데이트 로직 구현
        System.out.println("수정된 주소: " + dto.getAddress());
        // 필요한 데이터베이스 업데이트 또는 서비스 호출 등의 작업 수행
        updateUserAddress(userId, address);
        // 성공적으로 업데이트되었음을 클라이언트에게 응답
        return "주소가 성공적으로 업데이트되었습니다.";
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
