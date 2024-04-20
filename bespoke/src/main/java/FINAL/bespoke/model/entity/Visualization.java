package FINAL.bespoke.model.entity;

import java.math.BigDecimal;
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
    private Long id;

    @Column(length = 20)
    private String seq;

    @Column(precision = 6, scale = 0)
    private BigDecimal basYh;

    @Column(precision = 2, scale = 0)
	private BigDecimal age;

    @Column(precision = 2, scale = 0)
    private BigDecimal sexCd;

    @Column(precision = 2, scale = 0)
    private BigDecimal mbrRk;

    @Column(precision = 18, scale = 0)
    private BigDecimal housSidoNm;

    @Column(precision = 18, scale = 0)
    private BigDecimal attYear;

    @Column(precision = 18, scale = 0)
    private BigDecimal attMonth;

    @Column(precision = 18, scale = 0)
    private BigDecimal digtChnlUseYn;

    @Column(precision = 18, scale = 0)
    private BigDecimal totUseAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal acdmAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal automntAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal autoslAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal bookAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal cultureAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal distbnpAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal distbpAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal fuelAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal groceryAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal hosAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal hotelAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal insuAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal leisurePAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal leisureSAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal restrntAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal sanitAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal svcAm;

    @Column(precision = 18, scale = 0)
    private BigDecimal trvlAm;

    @Column
    private Double target;
}
