package FINAL.bespoke.model.dto;

import java.math.BigDecimal;

import FINAL.bespoke.model.entity.Visualization;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VisualizationDto {
	private int id;
    private String seq;
    private String age;
    private String sexCd;
    private String mbrRk;
    private BigDecimal crdslUseAm;
    private BigDecimal funitrAm;
    private BigDecimal applncAm;
    private BigDecimal hlthfsAm;
    private BigDecimal bldmngAm;
    private BigDecimal architAm;
    private BigDecimal opticAm;
    private BigDecimal agrictrAm;
    private BigDecimal leisureSAm;
    private BigDecimal leisurePAm;
    private BigDecimal cultureAm;
    private BigDecimal sanitAm;
    private BigDecimal insuAm;
    private BigDecimal offcomAm;
    private BigDecimal bookAm;
    private BigDecimal rprAm;
    private BigDecimal hotelAm;
    private BigDecimal goodsAm;
    private BigDecimal trvlAm;
    private BigDecimal fuelAm;
    private BigDecimal svcAm;
    private BigDecimal distbnpAm;
    private BigDecimal distbpAm;
    private BigDecimal groceryAm;
    private BigDecimal hosAm;
    private BigDecimal clothAm;
    private BigDecimal restrntAm;
    private BigDecimal automntAm;
    private BigDecimal autoslAm;
    private BigDecimal kitwrAm;
    private BigDecimal fabricAm;
    private BigDecimal acdmAm;
    private BigDecimal mbrshopAm;
    
    public Visualization toEntity() {
        Visualization entity = new Visualization();
        entity.setSeq(this.getSeq());
        entity.setAge(this.getAge());
        entity.setSexCd(this.getSexCd());
        entity.setMbrRk(this.getMbrRk());
        entity.setCrdslUseAm(this.getCrdslUseAm());
        entity.setFunitrAm(this.getFunitrAm());
        entity.setApplncAm(this.getApplncAm());
        entity.setHlthfsAm(this.getHlthfsAm());
        entity.setBldmngAm(this.getBldmngAm());
        entity.setArchitAm(this.getArchitAm());
        entity.setOpticAm(this.getOpticAm());
        entity.setAgrictrAm(this.getAgrictrAm());
        entity.setLeisureSAm(this.getLeisureSAm());
        entity.setLeisurePAm(this.getLeisurePAm());
        entity.setCultureAm(this.getCultureAm());
        entity.setSanitAm(this.getSanitAm());
        entity.setInsuAm(this.getInsuAm());
        entity.setOffcomAm(this.getOffcomAm());
        entity.setBookAm(this.getBookAm());
        entity.setRprAm(this.getRprAm());
        entity.setHotelAm(this.getHotelAm());
        entity.setGoodsAm(this.getGoodsAm());
        entity.setTrvlAm(this.getTrvlAm());
        entity.setFuelAm(this.getFuelAm());
        entity.setSvcAm(this.getSvcAm());
        entity.setDistbnpAm(this.getDistbnpAm());
        entity.setDistbpAm(this.getDistbpAm());
        entity.setGroceryAm(this.getGroceryAm());
        entity.setHosAm(this.getHosAm());
        entity.setClothAm(this.getClothAm());
        entity.setRestrntAm(this.getRestrntAm());
        entity.setAutomntAm(this.getAutomntAm());
        entity.setAutoslAm(this.getAutoslAm());
        entity.setKitwrAm(this.getKitwrAm());
        entity.setFabricAm(this.getFabricAm());
        entity.setAcdmAm(this.getAcdmAm());
        entity.setMbrshopAm(this.getMbrshopAm());
        
        return entity;
    }

}
