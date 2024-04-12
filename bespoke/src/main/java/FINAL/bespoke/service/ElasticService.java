package FINAL.bespoke.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.elasticsearch._types.ElasticsearchException;
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
	
    // test elasticsearch for 문
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
