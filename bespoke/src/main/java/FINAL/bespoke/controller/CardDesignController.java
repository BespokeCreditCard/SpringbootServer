package FINAL.bespoke.controller;

import java.util.Arrays;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import FINAL.bespoke.model.entity.ImageTemplate;
import FINAL.bespoke.service.AiGeneratorService;
import FINAL.bespoke.service.GetUrlService;
import FINAL.bespoke.service.ImageTemplateService;
import FINAL.bespoke.service.TranslatorService;

@Controller
@RequestMapping("/design")
public class CardDesignController {

//    @Autowired
//    private CardDesignService cardDesignServiceDemo;
	private final ImageTemplateService imageTemplateService;
	private final GetUrlService getUrlService;
	
	@Autowired
    public CardDesignController(ImageTemplateService imageTemplateService, GetUrlService getUrlService) {
        this.imageTemplateService = imageTemplateService;
        this.getUrlService = getUrlService;
    }
    
    
    @GetMapping("/carddesign")
    public String showCardDesignPage(@ModelAttribute("cardSelectId") String cardSelectId, Model model) {
    	System.out.println("###############model" + model.getAttribute("selectId"));
        // 이미지 생성 로직을 통해 ImageDto 객체를 생성합니다.
 //   	ImageDto aiImage;
//    	String selectImage = "";
//        
//		try {
//			selectImage = cardDesignServiceDemo.generateImage();
//			// 모델에 ImageDto 객체를 추가합니다.
//			model.addAttribute("selectImage", selectImage);
//			
//			
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}

    	// 가져올 이미지의 ID 리스트를 작성합니다.
        List<Integer> imageIds = Arrays.asList(6, 10, 12, 21, 34, 55, 70, 77, 121, 122);

        // 이미지의 ID 리스트를 기반으로 이미지들을 가져옵니다.
        List<ImageTemplate> images = imageTemplateService.getImagesByIds(imageIds);
        System.out.println("############################################");
        System.out.println(images.toString());
        System.out.println("############################################");
        // 모델에 이미지들을 추가하여 JSP에 전달합니다.
        model.addAttribute("images", images);
        System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$"+cardSelectId);
        String selectImageUrl = getUrlService.getImageUrlFromIndexImg(cardSelectId);
    	model.addAttribute("selectImageUrl", selectImageUrl);
    	System.out.println("############################"+selectImageUrl);
		// 뷰를 반환합니다.
		return "design/carddesign";
	}
    
}
