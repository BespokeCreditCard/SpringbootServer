package FINAL.bespoke.service;

//import com.theokanning.openai.image.CreateImageRequest;
import com.theokanning.openai.image.*;
import com.theokanning.openai.model.*;
import com.theokanning.openai.service.OpenAiService;
import jakarta.annotation.Resource;

import org.springframework.stereotype.Service;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AiGeneratorService {

    @Resource(name = "getOpenAiService")
    private final OpenAiService openAiService;

    public String generatePicture(String prompt) {
    	try {
	        CreateImageRequest createImageRequest = CreateImageRequest.builder()
	        		.model("dall-e-3")
	        		.quality("hd")
                    .prompt(prompt)
                    .style("vivid")
//                    .size("1024x1024")
                    .size("1024x1792")
                    .n(1)
                    .responseFormat("url")
	                .responseFormat("b64_json") //b64_json 포맷으로의 반환을 위해 이 코드 추가!
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
    
}