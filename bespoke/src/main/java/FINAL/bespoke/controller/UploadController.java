package FINAL.bespoke.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import FINAL.bespoke.model.entity.User;
import FINAL.bespoke.service.CardService;
import FINAL.bespoke.service.ReceiveCardService;
import FINAL.bespoke.service.UploadService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;

@Controller
@RequiredArgsConstructor
@RequestMapping("/upload")
public class UploadController {

    @Autowired
    private UploadService uploadService;
    @Autowired
    private ReceiveCardService receiveCardService;
    
    @GetMapping("/uploadtest")
    public String showUploadPage() {
        return "upload/uploadtest"; // upload.jsp로 이동!!!!
    }

    @PostMapping("/uploadtest")
    public String uploadImage(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
        try {
        	User user = receiveCardService.findUserId(request);
     		System.out.print(user);
            String imageUrl = uploadService.uploadImage(file, user.getUserID(), "upload");
            System.out.println("### UploadController - imageUrl(upload): " + imageUrl);
            
            return "redirect:/receivecard";
            
        } catch (IOException e) {
            // 업로드 실패 시 에러 페이지로 리다이렉트 또는 에러 메시지 표시
            // users 테이블에 cardId 컬럼에 있는 값을 carddesign?selectCardId= 뒤에 붙여야 함
            return "redirect:/carddesign";
        }
    }
}