package FINAL.bespoke.controller;

import java.util.Arrays;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import FINAL.bespoke.model.entity.ImageTemplate;
import FINAL.bespoke.service.ImageTemplateService;

@Controller
@RequestMapping("/design")
public class CardDesignController {

//    @Autowired
//    private CardDesignService cardDesignServiceDemo;
    
    @Autowired
    private ImageTemplateService imageTemplateService;
    
    @GetMapping("/carddesign")
    public String showHomePage(Model model) {
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
        System.out.println("### CardDesignController - images.toString(): " + images.toString());
        // 모델에 이미지들을 추가하여 JSP에 전달합니다.
        model.addAttribute("images", images);
    	
		// 뷰를 반환합니다.
		return "design/carddesign";
	}
    
}
