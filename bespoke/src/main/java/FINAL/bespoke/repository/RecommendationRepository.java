package FINAL.bespoke.repository;

import FINAL.bespoke.model.entity.Recommendation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
//import org.springframework.data.jpa.repository.Query;

@Repository
public interface RecommendationRepository extends JpaRepository<Recommendation, String> {
//	@Query("SELECT SEQ, Top1, Top2, Top3, Top4, Top5 FROM top5_recommendation LIMIT 1")
    Recommendation findBySEQ(String SEQ);
}