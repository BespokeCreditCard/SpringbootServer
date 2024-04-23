package FINAL.bespoke.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

import FINAL.bespoke.model.dto.wordDetailsDTO;
import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.elasticsearch._types.ElasticsearchException;
import co.elastic.clients.elasticsearch.core.GetResponse;

@Service
public class ElasticService {
	private final ElasticsearchClient esClient;

    @Autowired
    public ElasticService(ElasticsearchClient esClient) {
        this.esClient = esClient;
    }
    
    public List<String> ElasticSearchJsonTocardWordData(GetResponse<ObjectNode> response) {
    	List<String> cardWordDetails = new ArrayList<>();
    	ObjectNode json = response.source();
    	JsonNode cardname = json.get("card_name"); // 카드 이름
    	cardWordDetails.add(cardname.asText()); 
    	JsonNode cardword = json.get("data"); // 카드 이름
//    	cardWordDetails.add(cardword.toPrettyString()); 
    	cardWordDetails.add(cardword.toString()); 
    	System.out.println("### ElasticService - cardWordDetails: " + cardWordDetails);
    	return cardWordDetails;
    }
    
    public wordDetailsDTO ElasticSearchJsonTocardWordData(List<GetResponse<ObjectNode>> response) {
    	List<String> cardWord = new ArrayList<>();
    	List<String> cardNameList = new ArrayList<>();
    	for (GetResponse<ObjectNode> responseObject : response) {
    		// 2차원 배열에 저장하기 위한 1차원 배열
    		
    		System.out.println("### ElasticService - responseObject: " + responseObject);
        	// responseObject는 response 에서 하나씩 jsonImageId 값을 하나씪 받음
        	ObjectNode json = responseObject.source();
        	JsonNode cardname = json.get("card_name"); // 카드 이름
        	cardNameList.add(cardname.asText()); 
        	JsonNode cardword = json.get("data"); // 카드 이름
        	cardWord.add(cardword.toString()); 
    	}
    	return new wordDetailsDTO(cardNameList, cardWord);
    }
    
    /**
     * Elasticsearch에서 특정 이미지 ID에 해당하는 문서를 검색하고 반환합니다.
     * 
     * @param imageId 검색할 이미지 ID
     * @return 검색된 문서의 GetResponse<ObjectNode>, 검색에 실패하면 null 반환
     */
    public GetResponse<ObjectNode> fetchDataElastic(int Id,String elastic_index) {
    	try {
    		// Elasticsearch의 Get API를 사용하여 문서를 가져옴
    		GetResponse<ObjectNode> response = esClient.get(g -> g
    				.index(elastic_index)
    				.id(Integer.toString(Id)), ObjectNode.class);
    		return response; // 가져온 문서를 반환
    	} catch (ElasticsearchException | IOException e) {
    		e.printStackTrace();  // 에러 스택 추적을 출력하거나 로그로 남김
    		return null;  // 에러 발생 시 null 반환
    	}
    }
    
    /**
     * 주어진 이미지 ID 리스트를 사용하여 Elasticsearch에서 각각의 문서를 검색하고 결과를 반환합니다.
     * 
     * @param imageIds 검색할 이미지 ID의 리스트
     * @return 검색된 문서들의 GetResponse<ObjectNode> 리스트
     */
    public List<GetResponse<ObjectNode>> fetchDataElastic(List<Integer> imageId,String elastic_index) {
    	List<GetResponse<ObjectNode>> responses = new ArrayList<>();
    	for (Integer imageIdtmp : imageId) {
	        try {
	        	GetResponse<ObjectNode> response = esClient.get(g -> g
				    .index(elastic_index)
				    .id(imageIdtmp.toString()), ObjectNode.class);
	        	responses.add(response);
			} catch (ElasticsearchException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
    	}
        return responses;
    }
    
    /**
     * Elasticsearch 응답 리스트에서 각각의 카드 정보를 추출하여 제품 상세 정보를 리스트 형태로 변환하여 반환합니다.
     * 
     * @param responses Elasticsearch로부터 받은 응답 리스트
     * @return 각 카드의 정보를 담은 문자열 리스트의 리스트
     */
    public List<List<String>> ElasticSearchJsonToTextProduct(List<GetResponse<ObjectNode>> response) {
    	List<List<String>> productDetails = new ArrayList<>(); // 각 제품 정보를 담을 리스트의 리스트
    	for (GetResponse<ObjectNode> responseObject : response) {
        	// responseObject는 response 에서 하나씩 jsonImageId 값을 하나씪 받음
        	ObjectNode json = responseObject.source();
        	
        	List<String> productNames = new ArrayList<>();
        	
        	JsonNode cardNameNode = json.get("card_name"); // 카드 이름
            productNames.add(cardNameNode.asText()); // elasticresults[0]
            
            JsonNode cardTypeNode = json.get("card_type"); // 카드 타입
            productNames.add(cardTypeNode.asText());// elasticresults[1]
            
            JsonNode domesticYearCostNode = json.get("domestic_year_cost"); // 카드 국내 연회비
            productNames.add(domesticYearCostNode.asText());// elasticresults[2]
            
            JsonNode abroadYearCostNode = json.get("abroad_year_cost"); // 카드 해외 연회비
            productNames.add(abroadYearCostNode.asText());// elasticresults[3]
            
            JsonNode previousMonthPerformanceNode = json.get("previous_month_performance"); // 카드 전월 실적
            productNames.add(previousMonthPerformanceNode.asText());// elasticresults[4]
            
            JsonNode idNode = json.get("id"); // 카드 아이디
            productNames.add(idNode.asText());// elasticresults[5]
            System.out.println("### ElasticService - productNames: " + productNames);
            
            productDetails.add(productNames);
    	}
    	return productDetails;
    }
    
    /**
     * 단일 Elasticsearch 응답에서 카드 정보를 추출하여 제품 상세 정보를 리스트로 반환합니다.
     * 
     * @param response 단일 Elasticsearch 응답
     * @return 카드의 세부 정보를 담은 문자열 리스트
     */
    public List<String> ElasticSearchJsonToTextProduct(GetResponse<ObjectNode> responseObject) {
        List<String> productDetails = new ArrayList<>(); // 각 제품 정보를 담을 리스트의 리스트
        // responseObject는 response 에서 하나씩 jsonImageId 값을 하나씪 받음
        ObjectNode json = responseObject.source();
        
        JsonNode cardNameNode = json.get("card_name"); // 카드 이름
        productDetails.add(cardNameNode.asText()); // elasticresults[0]
        
        JsonNode cardTypeNode = json.get("card_type"); // 카드 타입
        productDetails.add(cardTypeNode.asText());// elasticresults[1]
        
        JsonNode domesticYearCostNode = json.get("domestic_year_cost"); // 카드 국내 연회비
        productDetails.add(domesticYearCostNode.asText());// elasticresults[2]
        
        JsonNode abroadYearCostNode = json.get("abroad_year_cost"); // 카드 해외 연회비
        productDetails.add(abroadYearCostNode.asText());// elasticresults[3]
        
        JsonNode previousMonthPerformanceNode = json.get("previous_month_performance"); // 카드 전월 실적
        productDetails.add(previousMonthPerformanceNode.asText());// elasticresults[4]
        
        return productDetails;
    }
    
    /**
     * 여러 Elasticsearch 응답에서 카테고리 정보를 추출하여 각 카테고리의 세부 정보를 리스트의 리스트 형태로 반환합니다.
     * 
     * @param responses 여러 Elasticsearch 응답 객체
     * @return 각 카테고리의 세부 정보를 담은 문자열 리스트의 리스트
     */
    public List<List<String>> ElasticSearchJsonToTextCategory(List<GetResponse<ObjectNode>> response) {
    	List<List<String>> categoryDetails = new ArrayList<>(); // 각 제품 정보를 담을 리스트의 리스트

        // ####################################################
        for (GetResponse<ObjectNode> responseObject : response) {
        	// responseObject는 response 에서 하나씩 jsonImageId 값을 하나씪 받음
        	ObjectNode json = responseObject.source();
            JsonNode categoryNode = json.get("category");
            List<String> categories = new ArrayList<>();
            if (categoryNode != null && categoryNode.isArray()) {
                for (JsonNode node : categoryNode) {
                    String categoryClass = node.get("class").asText();
                    categories.add(categoryClass);
                    String categoryBenefit = node.get("benefit").asText();
                    categories.add(categoryBenefit);
                    String categoryCondition = node.get("condition").asText();
                    categories.add(categoryCondition);
                }
            }
            
            categoryDetails.add(categories);
        }
    	return categoryDetails;
    }
    
    /**
     * 단일 Elasticsearch 응답에서 카테고리 정보를 추출하여 리스트로 반환합니다.
     * 
     * @param response 단일 Elasticsearch 응답
     * @return 카테고리의 세부 정보를 담은 문자열 리스트
     */
    public List<String> ElasticSearchJsonToTextCategory(GetResponse<ObjectNode> responseObject) {

    	ObjectNode json = responseObject.source();
        JsonNode categoryNode = json.get("category");
        List<String> categories = new ArrayList<>();
        if (categoryNode != null && categoryNode.isArray()) {
            for (JsonNode node : categoryNode) {
                String categoryClass = node.get("class").asText();
                categories.add(categoryClass);
                String categoryBenefit = node.get("benefit").asText();
                categories.add(categoryBenefit);
                String categoryCondition = node.get("condition").asText();
                categories.add(categoryCondition);
            }
        }
        return categories;
    }
    
    /**
     * 여러 Elasticsearch 응답에서 'class' 카테고리 정보만을 추출하여 리스트의 리스트 형태로 반환합니다.
     * 
     * @param responses 여러 Elasticsearch 응답 객체
     * @return 'class' 카테고리 정보만을 포함하는 문자열 리스트의 리스트
     */
    public List<List<String>> ElasticSearchJsonToTextClassInCategory(List<GetResponse<ObjectNode>> response) {
    	List<List<String>> categoryDetails = new ArrayList<>(); // 각 제품 정보를 담을 리스트의 리스트

        for (GetResponse<ObjectNode> responseObject : response) {
        	// responseObject는 response 에서 하나씩 jsonImageId 값을 하나씪 받음
        	ObjectNode json = responseObject.source();
            JsonNode categoryNode = json.get("category");
            List<String> categories = new ArrayList<>();
            if (categoryNode != null && categoryNode.isArray()) {
                for (JsonNode node : categoryNode) {
                    String categoryClass = node.get("class").asText();
                    categories.add(categoryClass);
                }
            }
            categoryDetails.add(categories);
        }
    	return categoryDetails;
    }
    
//    public GetResponse<ObjectNode> fetchData(List<Integer> imageId) {
//    	GetResponse<ObjectNode> response = null;
//        try {
////        	response = esClient.search(g -> g
////    			    .index("result_bulk")
////    			    .query(q -> q
////    			    		.match(t -> t
////    			    				.field("id")
////    			    				.query(imageId))),
////    			    ObjectNode.class     
////    			);
//			response = esClient.get(g -> g
//			    .index("result_bulk")
//			    .id("6"),
//			    ObjectNode.class     
//			);
//		} catch (ElasticsearchException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//        return response;
//        
//    }
}
