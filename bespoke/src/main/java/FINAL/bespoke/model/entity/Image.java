package FINAL.bespoke.model.entity;

import FINAL.bespoke.model.dto.ImageDto;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
//@RequiredArgsConstructor
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String cardName;
    private String imageUrl;

	// entity -> dto toDto
	public ImageDto toDto() {
		ImageDto dto = new ImageDto();
		dto.setId(this.getId());
		dto.setCardName(this.getCardName());
		dto.setImageUrl(this.getImageUrl());
		return dto;
	}
}
