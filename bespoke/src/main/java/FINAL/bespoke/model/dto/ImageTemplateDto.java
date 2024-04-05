package FINAL.bespoke.model.dto;

import FINAL.bespoke.model.entity.ImageTemplate;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ImageTemplateDto {
	private int id;
	private String url;
	
	public ImageTemplate toEntity() {
		ImageTemplate board = new ImageTemplate();
		board.setId(this.getId());
		board.setUrl(this.getUrl());
		return board;
	}
}
