package FINAL.bespoke.model.dto;

import FINAL.bespoke.model.entity.Image;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ImageDto {
    private int id;
    private String cardName;
    private String imageUrl;
    
	// Dto -> Entity로 데이터를 전송
	public Image toEntity() {
		Image image = new Image();
		image.setId(this.getId());
		image.setCardName(this.getCardName());
		image.setImageUrl(this.getImageUrl());
		return image;
		
	}
}
