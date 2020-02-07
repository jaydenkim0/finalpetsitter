package com.kh.petmily.service.board;

import java.util.List;

import com.kh.petmily.entity.CareDto;
import com.kh.petmily.entity.CarePetsitterDto;

public interface CareService {

	//게시글 목록
	List<CareDto> list();

	//게시글목록(펫시터아이디)
	List<CarePetsitterDto> pet_sitter_list();
}
