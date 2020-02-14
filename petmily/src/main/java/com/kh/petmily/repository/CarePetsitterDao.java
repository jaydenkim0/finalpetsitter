package com.kh.petmily.repository;

import java.util.List;

import com.kh.petmily.entity.CarePetsitterDto;

public interface CarePetsitterDao {
	//게시글목록
	List<CarePetsitterDto> pet_sitter_list(int start, int finish);

	//care_board_no 검색목록
	List<CarePetsitterDto> pet_sitter_list_care_board_no(String keyword, int start, int finish);

	//care_member_id 검색목록
	List<CarePetsitterDto> pet_sitter_list_care_member_id(String keyword, int start, int finish);

	//care_sitter_no 검색목록
	List<CarePetsitterDto> pet_sitter_list_care_sitter_no(String keyword, int start, int finish);

	//care_board_content 검색목록
	List<CarePetsitterDto> pet_sitter_list_care_board_content(String keyword, int start, int finish);
}
