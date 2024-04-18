 package FINAL.bespoke.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import FINAL.bespoke.model.entity.User;

public interface UserRepository extends JpaRepository<User, String> {

    Boolean existsByuserID(String userId);
	//username을 받아 DB 테이블에서 회원을 조회하는 메소드 작성
    User findByuserID(String userId);
    
//    @Modifying
//    @Query("Update 	users u set u.deliveryAddress = :addressChange where u.userid = :userId")
//    String changeAddress(String userId, String addressChange);
}