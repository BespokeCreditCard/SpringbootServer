package FINAL.bespoke.config;

//import org.apache.http.Header;
import org.apache.http.HttpHost;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.impl.client.BasicCredentialsProvider;
//import org.apache.http.message.BasicHeader;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestClientBuilder;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

//import co.elastic.clients.elasticsearch.ElasticsearchClient;
//import co.elastic.clients.json.jackson.JacksonJsonpMapper;
//import co.elastic.clients.transport.ElasticsearchTransport;
//import co.elastic.clients.transport.rest_client.RestClientTransport;

@Configuration
public class ElasticSearchConfig {

    @Value("${spring.elasticsearch.rest.uris}")
    private String elasticsearchUrl;

    @Value("${spring.elasticsearch.rest.username}")
    private String elasticID;

    @Value("${spring.elasticsearch.rest.password}")
    private String elasticPW;

    @Bean(destroyMethod = "close")
    public RestClient restClient() {
        // Elasticsearch REST client를 설정합니다.
        RestClientBuilder builder = RestClient.builder(
                HttpHost.create(elasticsearchUrl))
                .setHttpClientConfigCallback(httpClientBuilder -> {
                    // 인증 정보 설정
                    httpClientBuilder.setDefaultCredentialsProvider(
                            new BasicCredentialsProvider() {{
                                setCredentials(AuthScope.ANY,
                                        new UsernamePasswordCredentials(elasticID, elasticPW));
                            }});
                    return httpClientBuilder;
                });

        return builder.build();
    }
	
	
//	// URL and API key
////	String serverUrl = "http://localhost:9200";
//	String serverUrl = "http://medxwzhbga.a.pinggy.link";
////	String apiKey = "VnVhQ2ZHY0JDZGJrU...";
//
//	// Create the low-level client
//	RestClient restClient = RestClient
//	    .builder(HttpHost.create(serverUrl))
////	    .setDefaultHeaders(new Header[]{
////	        new BasicHeader("Authorization", "ApiKey " + apiKey)
////	    })
//	    .build();
//
//	// Create the transport with a Jackson mapper
//	ElasticsearchTransport transport = new RestClientTransport(restClient, new JacksonJsonpMapper());
//
//	// And create the API client
//	ElasticsearchClient esClient = new ElasticsearchClient(transport);
}
