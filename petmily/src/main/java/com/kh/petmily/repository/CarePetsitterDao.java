package com.kh.petmily.repository;

import java.util.List;

import com.kh.petmily.entity.CarePetsitterDto;

public interface CarePetsitterDao {
	//게시글목록
	List<CarePetsitterDto>pet_sitter_list();
}
