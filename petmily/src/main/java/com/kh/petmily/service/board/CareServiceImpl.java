package com.kh.petmily.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petmily.entity.CareDto;
import com.kh.petmily.entity.CarePetsitterDto;
import com.kh.petmily.repository.CareDao;
import com.kh.petmily.repository.CarePetsitterDao;

@Service
public class CareServiceImpl implements CareService{

	@Autowired
	private CareDao careDao;
	
	@Autowired
	private CarePetsitterDao carePetsitterDao; 

	//게시글 목록
	@Override
	public List<CareDto> list() {
		return careDao.list();
	}

	//게시글목록(펫시터아이디)
	@Override
	public List<CarePetsitterDto> pet_sitter_list() {
		return carePetsitterDao.pet_sitter_list();
	}

	//펫시터아이디로 펫시터번호 구하기
	@Override
	public int id_to_number(String care_sitter_id) {
		return careDao.id_to_number(care_sitter_id);
	}

	//돌봄방 생성
	@Override
	public void write(CareDto careDto) {
		careDao.write(careDto);
	}

	//돌봄방 정보 불러오기
	@Override
	public CareDto list(String care_board_no) {
		return careDao.list(care_board_no);
	}

	//펫시터번호로 펫시터아이디 구하기
	@Override
	public String number_to_id(int care_sitter_no) {
		return careDao.number_to_id(care_sitter_no);
	}

}
