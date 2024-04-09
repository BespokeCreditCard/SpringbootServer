package FINAL.bespoke.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import FINAL.bespoke.service.UploadService;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;

@Controller
@RequestMapping("/upload")
public class UploadController {

    @Autowired
    private UploadService uploadService;

    @GetMapping("/uploadtest")
    public String showUploadPage() {
        return "upload/uploadtest"; // upload.jsp로 이동!!!!
    }

    @PostMapping("/uploadtest")
    public String uploadImage(@RequestParam("file") MultipartFile file,
                              @RequestParam("customerName") String customerName) {
        try {
            String imageUrl = uploadService.uploadImage(file, customerName);
            System.out.println("4: " + imageUrl);
            // 업로드 성공 시 다른 페이지로 리다이렉트 또는 화면에 성공 메시지 표시
            return "redirect:/imageUrl";
        } catch (IOException e) {
            e.printStackTrace();
            // 업로드 실패 시 에러 페이지로 리다이렉트 또는 에러 메시지 표시
            return "redirect:/error";
        }
    }
}