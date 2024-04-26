package FINAL.bespoke.repository;

import FINAL.bespoke.model.entity.Card;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CardRepository extends JpaRepository<Card, String> {
}