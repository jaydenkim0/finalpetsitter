package com.kh.petmily.test;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class PetSitter {
	private int pet_sitter_no;
	private String id;
	private String name;
	
	private List<Location> list;
}
