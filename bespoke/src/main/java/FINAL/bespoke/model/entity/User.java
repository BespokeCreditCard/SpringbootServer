package FINAL.bespoke.model.entity;

import java.math.BigDecimal;
import java.time.LocalDate;

import FINAL.bespoke.model.dto.UserDto;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
@Table(name = "users")
public class User {

    @Id
    @Column(length = 20)
    private String userID;

    @Column(length = 20, nullable = false)
    private String name;

    @Column(length = 100, nullable = false)
    private String password;

    @Column(nullable = false)
    private LocalDate birthDate;

    @Column(nullable = false)
    private LocalDate registerDate;

    @Column(nullable = false, length = 4)
    private char gender;

    @Column(columnDefinition = "TEXT")
    private String address;

    @Column(precision = 2)
    private BigDecimal grade;

    @Column(nullable = false, columnDefinition = "TINYINT")
    private boolean agreement;

    @Column(nullable = false, columnDefinition = "TINYINT")
    private boolean digital;

    @Column(length = 13)
    private String contact;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cardId", referencedColumnName = "id")
    private ImageTemplate imageTemplate;
    
    @Column(columnDefinition = "TEXT")
    private String deliveryAddress;

    @Column(length = 30)
    private String role;
    
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
        dto.setRole(this.getRole());
        return dto;
    }
}
