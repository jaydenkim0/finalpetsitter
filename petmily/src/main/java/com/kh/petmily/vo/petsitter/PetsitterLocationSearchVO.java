package com.kh.petmily.vo.petsitter;

import java.util.List;

import com.kh.petmily.entity.LocationDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class PetsitterLocationSearchVO {
	private int pet_sitter_no;
	private String nick;
	private String info;
	
	private List<LocationDto> list;
}
