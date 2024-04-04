package FINAL.bespoke.service;

import com.theokanning.openai.image.CreateImageRequest;
import com.theokanning.openai.service.OpenAiService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AiImageService {

    @Resource(name = "getOpenAiService")
    private final OpenAiService openAiService;
    
//    public AiImageService(OpenAiService openAiService) {
//        this.openAiService = openAiService;
//    }

    public String generatePicture(String prompt) {
    	try {
	        CreateImageRequest createImageRequest = CreateImageRequest.builder()
	                .model("dall-e-3")
	        		.prompt(prompt)
	                .size("1024x1024")
	                .responseFormat("b64_json") //b64_json 포맷으로의 반환을 위해 이 코드 추가!
	                .n(1)
	                .build();
	
//	        String url = openAiService.createImage(createImageRequest).getData().get(0).getUrl();
//	        return url;
	        //이미지 URL 대신 base64 data를 리턴하는 것으로 변경!
	        String b64 = openAiService.createImage(createImageRequest).getData().get(0).getB64Json();
	        return b64;
    	} catch (Exception e) {
            // 이미지 생성 중 에러가 발생하면 예외를 처리합니다.
            e.printStackTrace();
            return null;
        }
    }
    
// // Getter와 Setter 메서드
//    public OpenAiService getOpenAiService() {
//        return openAiService;
//    }
    
}


