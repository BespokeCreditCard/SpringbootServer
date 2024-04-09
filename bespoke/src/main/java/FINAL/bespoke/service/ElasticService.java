package FINAL.bespoke.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.elasticsearch._types.ElasticsearchException;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import co.elastic.clients.elasticsearch.core.GetResponse;

@Service
public class ElasticService {
	private final ElasticsearchClient esClient;

    @Autowired
    public ElasticService(ElasticsearchClient esClient) {
        this.esClient = esClient;
    }
	
    public GetResponse<ObjectNode> fetchData() {
    	GetResponse<ObjectNode> response = null;
        try {
			response = esClient.get(g -> g
			    .index("result_bulk")
			    .id("6"),
			    ObjectNode.class     
			);
//	        System.out.println("#####################################################################");
//			System.out.println(response.toString());
//			System.out.println("#####################################################################");
		} catch (ElasticsearchException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return response;
//        return ObjectNode.class;
        
    }
}
