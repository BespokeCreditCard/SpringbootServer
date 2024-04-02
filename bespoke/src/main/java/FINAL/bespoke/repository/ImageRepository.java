package FINAL.bespoke.repository;

import FINAL.bespoke.model.entity.Image;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ImageRepository extends JpaRepository<Image, Integer> {
    // 이미지 관련된 추가적인 메서드가 있다면 여기에 추가할 수 있음
}
