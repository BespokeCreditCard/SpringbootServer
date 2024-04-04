package FINAL.bespoke.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import co.elastic.clients.elasticsearch.ElasticsearchClient;
import com.fasterxml.jackson.databind.node.ObjectNode;
import co.elastic.clients.elasticsearch.core.GetResponse;

@Service
public class ElasticService {
	private final ElasticsearchClient esClient;

    @Autowired
    public ElasticService(ElasticsearchClient esClient) {
        this.esClient = esClient;
    }
	
    public void fetchProduct() {
        GetResponse<ObjectNode> response = esClient.get(g -> g
            .index("products")
            .id("bk-1"),
            ObjectNode.class     
        );
        
    }
}
