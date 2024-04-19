package FINAL.bespoke.service;

import FINAL.bespoke.model.dto.FlaskClusterGetDto;
import FINAL.bespoke.model.dto.FlaskCardGetDto;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class FlaskService {

    private final ObjectMapper objectMapper;
    private String seq_tmp;
	private Integer clusterNum;
	private List<String> benefits;
    private List<Integer> cardIdxs;
    private List<String> selectedBenefits;
    private List<Integer> top5CardIdxs;
    
	public String sendClusterFlask(String seq) throws JsonProcessingException {
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        String param = objectMapper.writeValueAsString(seq);
        HttpEntity<String> entity = new HttpEntity<>(param, headers);
        String url = "http://127.0.0.1:5000/get_cluster";
        String response = restTemplate.postForObject(url, entity, String.class);
        
        // JSON 문자열을 FlaskClusterGetDto 객체로 변환
        FlaskClusterGetDto clusterGetDto = objectMapper.readValue(response, FlaskClusterGetDto.class);
        System.out.print("flask cluster response 확인");
        System.out.print(response);
        
        if (response != null) {
            seq_tmp = clusterGetDto.getSeq();
            clusterNum = clusterGetDto.getCluster_num();
            cardIdxs = clusterGetDto.getCard_idxs();
            benefits = clusterGetDto.getBenefits();
        }
        
		Map<String, Object> result = new HashMap<>();
        result.put("seq", seq_tmp);
        result.put("clusterNum", clusterNum);
        result.put("cardIdxs", cardIdxs);
        result.put("benefits", benefits);
        
        // Map을 JSON 문자열로 변환하여 반환
        return objectMapper.writeValueAsString(result);
    }
	
	public String sendCardFlask(String seq, List<String> selected_benefits, int cluster_num) throws JsonProcessingException {
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        
        Map<String, Object> bodyMap = new HashMap<>();
        bodyMap.put("seq", seq);
        bodyMap.put("selected_benefits", selected_benefits);
        bodyMap.put("cluster_num", cluster_num);
        
        String param = objectMapper.writeValueAsString(bodyMap);
        HttpEntity<String> entity = new HttpEntity<>(param, headers);
        String url = "http://127.0.0.1:5000/get_top5_cards";
        String response = restTemplate.postForObject(url, entity, String.class);
        
        // JSON 문자열을 FlaskClusterGetDto 객체로 변환
        FlaskCardGetDto cardGetDto = objectMapper.readValue(response, FlaskCardGetDto.class);
        System.out.print("flask get_top5_cards response 확인");
        System.out.print(response);
        
        if (response != null) {
            seq_tmp = cardGetDto.getSeq();
            clusterNum = cardGetDto.getCluster_num();
            selectedBenefits = cardGetDto.getSelected_benefits();
            top5CardIdxs = cardGetDto.getTop5_card_idxs();
        }
        
		Map<String, Object> result = new HashMap<>();
        result.put("seq", seq_tmp);
        result.put("clusterNum", clusterNum);
        result.put("selectedBenefits", selectedBenefits);
        result.put("top5CardIdxs", top5CardIdxs);
        
        // Map을 JSON 문자열로 변환하여 반환
        return objectMapper.writeValueAsString(result);
    }
    
}