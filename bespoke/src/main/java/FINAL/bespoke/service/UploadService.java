package FINAL.bespoke.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.core.SdkBytes;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.ListObjectsRequest;
import software.amazon.awssdk.services.s3.model.ListObjectsV2Request;
import software.amazon.awssdk.services.s3.model.ListObjectsV2Response;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;
import software.amazon.awssdk.services.s3.model.PutObjectResponse;
import software.amazon.awssdk.services.s3.model.S3Object;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class UploadService {

    @Autowired
    private S3Client s3Client;

    // S3에 이미지 업로드
    public String uploadImage(MultipartFile file, String customerName) throws IOException {
//        String key = "upload/" + customerName + ".png";
        String key = ("8YBQA0UZ1JNAPF1LPQC3") + ".png";
        System.out.println("1: " + key);

        try {
        	byte[] bytes = file.getBytes();
            RequestBody requestBody = RequestBody.fromBytes(bytes);
            
            PutObjectRequest request = PutObjectRequest.builder()
                    .bucket("upload")
                    .key(key)
                    .contentType("image/png")
                    .build();

            // PutObjectRequest를 사용하여 파일 업로드	
            s3Client.putObject(request, requestBody);
            System.out.println("2: " + request);
            // 업로드된 객체의 URL 생성
            System.out.println("3: " + generateImageUrl(key));
            String testUrl = generateImageUrl(key);
            System.out.println(testUrl);
            return testUrl;

        } catch (IOException e) {
            throw new IOException("Failed to upload file to S3", e);
        }
    }
    
    private String generateImageUrl(String key) {
        return "https://woori-fisa-bucket.s3.amazonaws.com/" + key;
    }
}