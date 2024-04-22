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
    private Long ID;
    private String SEQ;
    private BigDecimal BAS_YH;
    private BigDecimal AGE;
    private BigDecimal SEX_CD;
    private BigDecimal MBR_RK;
    private BigDecimal HOUS_SIDO_NM;
    private BigDecimal ATT_YEAR;
    private BigDecimal ATT_MONTH;
    private BigDecimal DIGT_CHNL_USE_YN;
    private BigDecimal TOT_USE_AM;
    private BigDecimal ACDM_AM;
    private BigDecimal AUTOMNT_AM;
    private BigDecimal AUTOSL_AM;
    private BigDecimal BOOK_AM;
    private BigDecimal CULTURE_AM;
    private BigDecimal DISTBNP_AM;
    private BigDecimal DISTBP_AM;
    private BigDecimal FUEL_AM;
    private BigDecimal GROCERY_AM;
    private BigDecimal HOS_AM;
    private BigDecimal HOTEL_AM;
    private BigDecimal INSU_AM;
    private BigDecimal LEISURE_P_AM;
    private BigDecimal LEISURE_S_AM;
    private BigDecimal RESTRNT_AM;
    private BigDecimal SANIT_AM;
    private BigDecimal SVC_AM;
    private BigDecimal TRVL_AM;
    
    public Visualization toEntity() {
        Visualization entity = new Visualization();
        entity.setSEQ(this.SEQ);
        entity.setBAS_YH(this.BAS_YH);
        entity.setAGE(this.AGE);
        entity.setSEX_CD(this.SEX_CD);
        entity.setMBR_RK(this.MBR_RK);
        entity.setHOUS_SIDO_NM(this.HOUS_SIDO_NM);
        entity.setATT_YEAR(this.ATT_YEAR);
        entity.setATT_MONTH(this.ATT_MONTH);
        entity.setDIGT_CHNL_USE_YN(this.DIGT_CHNL_USE_YN);
        entity.setTOT_USE_AM(this.TOT_USE_AM);
        entity.setACDM_AM(this.ACDM_AM);
        entity.setAUTOMNT_AM(this.AUTOMNT_AM);
        entity.setAUTOSL_AM(this.AUTOSL_AM);
        entity.setBOOK_AM(this.BOOK_AM);
        entity.setCULTURE_AM(this.CULTURE_AM);
        entity.setDISTBNP_AM(this.DISTBNP_AM);
        entity.setDISTBP_AM(this.DISTBP_AM);
        entity.setFUEL_AM(this.FUEL_AM);
        entity.setGROCERY_AM(this.GROCERY_AM);
        entity.setHOS_AM(this.HOS_AM);
        entity.setHOTEL_AM(this.HOTEL_AM);
        entity.setINSU_AM(this.INSU_AM);
        entity.setLEISURE_P_AM(this.LEISURE_P_AM);
        entity.setLEISURE_S_AM(this.LEISURE_S_AM);
        entity.setRESTRNT_AM(this.RESTRNT_AM);
        entity.setSANIT_AM(this.SANIT_AM);
        entity.setSVC_AM(this.SVC_AM);
        entity.setTRVL_AM(this.TRVL_AM);
        return entity;
    }

}
