package com.kh.petmily.repository;

import java.util.List;

import com.kh.petmily.entity.CareDto;

public interface CareDao {

	//게시글목록
	List<CareDto> list();

}
