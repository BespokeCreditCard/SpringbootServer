package FINAL.bespoke.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;
import java.io.IOException;

@Service
public class UploadService {

    @Autowired
    private S3Client s3Client;
    
    @Autowired
    private String s3Endpoint; // S3 엔드포인트 정보를 주입받음

    // S3에 이미지 업로드
    public String uploadImage(MultipartFile file, String customerName, String mode) throws IOException {
        String key = customerName + ".png";
//        String key = ("004J3BM4AIGOOG7TRIJM") + ".png";
        System.out.println("### UploadService - key: " + key);
        String testUrl = "";
        try {
            // 업로드할 파일의 바이트 배열을 가져옴
        	byte[] bytes = file.getBytes(); 
            // RequestBody를 생성하여 업로드할 파일 데이터를 담기
        	if (mode == "upload") {
	            RequestBody requestBody = RequestBody.fromBytes(bytes);
	            // S3에 업로드할 객체의 요청을 생성합니다
	            PutObjectRequest request = PutObjectRequest.builder()
	                    .bucket("upload") // 업로드할 버킷안의 폴더 이름을 지정
	                    .key(key) // 업로드할 객체의 키 (파일 이름)를 지정
	                    .contentType("image/png") // 업로드할 파일의 컨텐츠 타입을 지정
	                    .build();
	
	            // PutObject를 사용하여 파일 업로드	
	            s3Client.putObject(request, requestBody);
	            System.out.println("### UploadService - request: " + request);
	            // 업로드된 객체의 URL 생성
	            testUrl = generateImageUrl(key, "upload");
	            System.out.println("### UploadService - generateImageUrl(key): " + testUrl);
        	}
        	else if (mode == "addcard") {
                RequestBody requestBody = RequestBody.fromBytes(bytes);
                // S3에 업로드할 객체의 요청을 생성합니다
                PutObjectRequest request = PutObjectRequest.builder()
                        .bucket("index_img") // 업로드할 버킷안의 폴더 이름을 지정
                        .key("bcc_140.png") // 업로드할 객체의 키 (파일 이름)를 지정
                        .contentType("image/png") // 업로드할 파일의 컨텐츠 타입을 지정
                        .build();

                // PutObject를 사용하여 파일 업로드	
                s3Client.putObject(request, requestBody);
                System.out.println("### UploadService - request: " + request);
                // 업로드된 객체의 URL 생성
                testUrl = generateImageUrl(key, "addcard");
	            System.out.println("### UploadService - generateImageUrl(key): " + testUrl);
        	}
        	
            // 업로드된 객체의 URL을 생성
            return testUrl;

        } catch (IOException e) {
            throw new IOException("Failed to upload file to S3", e);
        }
    }
    
    private String generateImageUrl(String key, String mode) {
    	String returnUrl = "";
    	if (mode == "upload") {
    		returnUrl = s3Endpoint + "upload/" + key;
    	}
    	else if (mode == "addcard") {
    		returnUrl = s3Endpoint + "index_img/" + key;
    	}
        return returnUrl;
    }
}