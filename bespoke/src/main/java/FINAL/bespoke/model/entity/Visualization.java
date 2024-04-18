package FINAL.bespoke.model.entity;

import java.math.BigDecimal;

import FINAL.bespoke.model.dto.UserDto;
import FINAL.bespoke.model.dto.VisualizationDto;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "Visualization")
public class Visualization {
	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
    
    @Column(length = 40)
    private String seq;

    @Column(length = 2)
    private String age;

    @Column(length = 2)
    private String sexCd;

    @Column(length = 2)
    private String mbrRk;

    @Column(precision = 18, scale = 0)
    private BigDecimal crdslUseAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal funitrAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal applncAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal hlthfsAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal bldmngAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal architAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal opticAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal agrictrAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal leisureSAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal leisurePAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal cultureAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal sanitAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal insuAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal offcomAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal bookAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal rprAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal hotelAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal goodsAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal trvlAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal fuelAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal svcAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal distbnpAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal distbpAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal groceryAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal hosAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal clothAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal restrntAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal automntAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal autoslAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal kitwrAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal fabricAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal acdmAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal mbrshopAm;
    
    public VisualizationDto toDto() {
        VisualizationDto dto = new VisualizationDto();
        dto.setSeq(this.getSeq());
        dto.setAge(this.getAge());
        dto.setSexCd(this.getSexCd());
        dto.setMbrRk(this.getMbrRk());
        dto.setCrdslUseAm(this.getCrdslUseAm());
        dto.setFunitrAm(this.getFunitrAm());
        dto.setApplncAm(this.getApplncAm());
        dto.setHlthfsAm(this.getHlthfsAm());
        dto.setBldmngAm(this.getBldmngAm());
        dto.setArchitAm(this.getArchitAm());
        dto.setOpticAm(this.getOpticAm());
        dto.setAgrictrAm(this.getAgrictrAm());
        dto.setLeisureSAm(this.getLeisureSAm());
        dto.setLeisurePAm(this.getLeisurePAm());
        dto.setCultureAm(this.getCultureAm());
        dto.setSanitAm(this.getSanitAm());
        dto.setInsuAm(this.getInsuAm());
        dto.setOffcomAm(this.getOffcomAm());
        dto.setBookAm(this.getBookAm());
        dto.setRprAm(this.getRprAm());
        dto.setHotelAm(this.getHotelAm());
        dto.setGoodsAm(this.getGoodsAm());
        dto.setTrvlAm(this.getTrvlAm());
        dto.setFuelAm(this.getFuelAm());
        dto.setSvcAm(this.getSvcAm());
        dto.setDistbnpAm(this.getDistbnpAm());
        dto.setDistbpAm(this.getDistbpAm());
        dto.setGroceryAm(this.getGroceryAm());
        dto.setHosAm(this.getHosAm());
        dto.setClothAm(this.getClothAm());
        dto.setRestrntAm(this.getRestrntAm());
        dto.setAutomntAm(this.getAutomntAm());
        dto.setAutoslAm(this.getAutoslAm());
        dto.setKitwrAm(this.getKitwrAm());
        dto.setFabricAm(this.getFabricAm());
        dto.setAcdmAm(this.getAcdmAm());
        dto.setMbrshopAm(this.getMbrshopAm());
        return dto;
    }
}
