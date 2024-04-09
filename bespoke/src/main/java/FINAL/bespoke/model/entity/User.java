package FINAL.bespoke.model.entity;

import java.math.BigDecimal;
import java.time.LocalDate;

import FINAL.bespoke.model.dto.UserDto;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Table(name = "Users")
public class User {

    @Id
    @Column(length = 12)
    private String userID;

    @Column(length = 12, nullable = false)
    private String name;

    @Column(length = 12, nullable = false)
    private String password;

    @Column(nullable = false)
    private LocalDate birthDate;

    @Column(nullable = false)
    private LocalDate registerDate;

    @Column(nullable = false, length = 1)
    private char gender;

    @Column(columnDefinition = "TEXT")
    private String address;

    @Column(precision = 2)
    private BigDecimal grade;

    @Column(nullable = false)
    private boolean agreement;

    @Column(nullable = false)
    private boolean digital;

    @Column(length = 13)
    private String contact;
    
    @Column(length = 12)
    private String cardId;
    
    @Column(columnDefinition = "TEXT")
    private String deliveryAddress;

    public UserDto toDto() {
        UserDto dto = new UserDto();
        dto.setUserID(this.getUserID());
        dto.setName(this.getName());
        dto.setPassword(this.getPassword());
        dto.setBirthDate(this.getBirthDate());
        dto.setRegisterDate(this.getRegisterDate());
        dto.setGender(this.getGender());
        dto.setAddress(this.getAddress());
        dto.setGrade(this.getGrade());
        dto.setAgreement(this.isAgreement());
        dto.setDigital(this.isDigital());
        dto.setContact(this.getContact());
        return dto;
    }
}
