package FINAL.bespoke.model.dto;


import java.math.BigDecimal;
import java.time.LocalDate;
import FINAL.bespoke.model.entity.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDto {
    
    private String userID;
    private String name;
    private String password;
    private LocalDate birthDate;
    private LocalDate registerDate;
    private char gender;
    private String address;
    private BigDecimal grade;
    private boolean agreement;
    private boolean digital;
    private String contact;
    private String cardId;
    private String deliveryAdress;
    private String role;
    
    public User toEntity() {
        User user = new User();
        user.setUserID(this.getUserID());
        user.setName(this.getName());
        user.setPassword(this.getPassword());
        user.setBirthDate(this.getBirthDate());
        user.setRegisterDate(this.getRegisterDate());
        user.setGender(this.getGender());
        user.setAddress(this.getAddress());
        user.setGrade(this.getGrade());
        user.setAgreement(this.isAgreement());
        user.setDigital(this.isDigital());
        user.setContact(this.getContact());
        user.setRole(this.getRole());
        
        return user;
    }
}
