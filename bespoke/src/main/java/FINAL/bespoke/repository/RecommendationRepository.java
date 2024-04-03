package FINAL.bespoke.repository;

import FINAL.bespoke.model.entity.Recommendation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface RecommendationRepository extends JpaRepository<Recommendation, Long> {
    // 특별한 메서드가 필요하지 않은 경우, JpaRepository에서 기본적으로 제공되는 메서드를 사용할 수 있습니다.
	@Query(value = "SELECT * FROM top5_recommendation LIMIT 1", nativeQuery = true)
	Recommendation findTopRecommendation();
}
