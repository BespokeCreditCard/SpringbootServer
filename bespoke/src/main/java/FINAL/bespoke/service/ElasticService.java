package FINAL.bespoke.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.elasticsearch._types.ElasticsearchException;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import co.elastic.clients.elasticsearch.core.GetResponse;
import co.elastic.clients.elasticsearch.core.SearchResponse;

@Service
public class ElasticService {
	private final ElasticsearchClient esClient;

    @Autowired
    public ElasticService(ElasticsearchClient esClient) {
        this.esClient = esClient;
    }
	

    public List<GetResponse<ObjectNode>> fetchData(List<Integer> imageId) {
    	List<GetResponse<ObjectNode>> responses = new ArrayList<>();
    	for (Integer imageIdtmp : imageId) {
	        try {
	        	GetResponse<ObjectNode> response = esClient.get(g -> g
				    .index("result_bulk")
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
    
    public GetResponse<ObjectNode> fetchData(String imageId) {
        try {
            // Elasticsearch의 Get API를 사용하여 문서를 가져옴
            GetResponse<ObjectNode> response = esClient.get(g -> g
                .index("result_bulk")
                .id(imageId), ObjectNode.class);
            return response; // 가져온 문서를 반환
        } catch (ElasticsearchException | IOException e) {
            e.printStackTrace();  // 에러 스택 추적을 출력하거나 로그로 남김
            return null;  // 에러 발생 시 null 반환
        }
    }
    
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
            
            JsonNode idNode = json.get("id"); // 카드 전월 실적
            productNames.add(idNode.asText());// elasticresults[5]
            
            productDetails.add(productNames);
    	}
    	return productDetails;
    }
    
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
    
    // category에서 class만 가져오는 메소드
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
