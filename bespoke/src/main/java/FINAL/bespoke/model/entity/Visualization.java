package FINAL.bespoke.model.entity;

import java.math.BigDecimal;

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
@Table(name = "visualization")
public class Visualization {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long ID;

    @Column(length = 20)
    private String SEQ;

    @Column(precision = 6, scale = 0)
    private BigDecimal BAS_YH;

    @Column(precision = 2, scale = 0)
	private BigDecimal AGE;

    @Column(precision = 2, scale = 0)
    private BigDecimal SEX_CD;

    @Column(precision = 2, scale = 0)
    private BigDecimal MBR_RK;

    @Column(precision = 18, scale = 0)
    private BigDecimal HOUS_SIDO_NM;

    @Column(precision = 18, scale = 0)
    private BigDecimal ATT_YEAR;

    @Column(precision = 18, scale = 0)
    private BigDecimal ATT_MONTH;

    @Column(precision = 18, scale = 0)
    private BigDecimal DIGT_CHNL_USE_YN;

    @Column(precision = 18, scale = 0)
    private BigDecimal TOT_USE_AM;

    @Column(precision = 18, scale = 0)
    private BigDecimal ACDM_AM;

    @Column(precision = 18, scale = 0)
    private BigDecimal AUTOMNT_AM;

    @Column(precision = 18, scale = 0)
    private BigDecimal AUTOSL_AM;

    @Column(precision = 18, scale = 0)
    private BigDecimal BOOK_AM;

    @Column(precision = 18, scale = 0)
    private BigDecimal CULTURE_AM;

    @Column(precision = 18, scale = 0)
    private BigDecimal DISTBNP_AM;

    @Column(precision = 18, scale = 0)
    private BigDecimal DISTBP_AM;

    @Column(precision = 18, scale = 0)
    private BigDecimal FUEL_AM;

    @Column(precision = 18, scale = 0)
    private BigDecimal GROCERY_AM;

    @Column(precision = 18, scale = 0)
    private BigDecimal HOS_AM;

    @Column(precision = 18, scale = 0)
    private BigDecimal HOTEL_AM;

    @Column(precision = 18, scale = 0)
    private BigDecimal INSU_AM;

    @Column(precision = 18, scale = 0)
    private BigDecimal LEISURE_P_AM;

    @Column(precision = 18, scale = 0)
    private BigDecimal LEISURE_S_AM;

    @Column(precision = 18, scale = 0)
    private BigDecimal RESTRNT_AM;

    @Column(precision = 18, scale = 0)
    private BigDecimal SANIT_AM;

    @Column(precision = 18, scale = 0)
    private BigDecimal SVC_AM;

    @Column(precision = 18, scale = 0)
    private BigDecimal TRVL_AM;

    @Column
    private Double TARGET;

    public VisualizationDto toDto() {
        VisualizationDto dto = new VisualizationDto();
        dto.setSEQ(this.SEQ);
        dto.setBAS_YH(this.BAS_YH);
        dto.setAGE(this.AGE);
        dto.setSEX_CD(this.SEX_CD);
        dto.setMBR_RK(this.MBR_RK);
        dto.setHOUS_SIDO_NM(this.HOUS_SIDO_NM);
        dto.setATT_YEAR(this.ATT_YEAR);
        dto.setATT_MONTH(this.ATT_MONTH);
        dto.setDIGT_CHNL_USE_YN(this.DIGT_CHNL_USE_YN);
        dto.setTOT_USE_AM(this.TOT_USE_AM);
        dto.setACDM_AM(this.ACDM_AM);
        dto.setAUTOMNT_AM(this.AUTOMNT_AM);
        dto.setAUTOSL_AM(this.AUTOSL_AM);
        dto.setBOOK_AM(this.BOOK_AM);
        dto.setCULTURE_AM(this.CULTURE_AM);
        dto.setDISTBNP_AM(this.DISTBNP_AM);
        dto.setDISTBP_AM(this.DISTBP_AM);
        dto.setFUEL_AM(this.FUEL_AM);
        dto.setGROCERY_AM(this.GROCERY_AM);
        dto.setHOS_AM(this.HOS_AM);
        dto.setHOTEL_AM(this.HOTEL_AM);
        dto.setINSU_AM(this.INSU_AM);
        dto.setLEISURE_P_AM(this.LEISURE_P_AM);
        dto.setLEISURE_S_AM(this.LEISURE_S_AM);
        dto.setRESTRNT_AM(this.RESTRNT_AM);
        dto.setSANIT_AM(this.SANIT_AM);
        dto.setSVC_AM(this.SVC_AM);
        dto.setTRVL_AM(this.TRVL_AM);
        dto.setTARGET(this.TARGET);
        return dto;
    }
}
