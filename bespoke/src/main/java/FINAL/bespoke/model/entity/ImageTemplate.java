package FINAL.bespoke.model.entity;

import FINAL.bespoke.model.dto.ImageTemplateDto;
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
@Table(name = "cardImg")
public class ImageTemplate {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable = false)
	private String url;
	
	public ImageTemplateDto toDto() {
		ImageTemplateDto dto = new ImageTemplateDto();
		dto.setId(this.getId());
		dto.setUrl(this.getUrl());
		return dto;
	}
}
