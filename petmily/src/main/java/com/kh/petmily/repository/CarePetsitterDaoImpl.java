package com.kh.petmily.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.CarePetsitterDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class CarePetsitterDaoImpl implements CarePetsitterDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	//게시글목록
	@Override
	public List<CarePetsitterDto> pet_sitter_list(int start,int finish) {
		Map<String,Object> map = new HashMap<>();
		map.put("start", start);
		map.put("finish",finish);
		return sqlSession.selectList("care.sitter_id",map);
	}

	//care_board_no 검색목록
	@Override
	public List<CarePetsitterDto> pet_sitter_list_care_board_no(String keyword, int start, int finish) {
		Map<String,Object> map = new HashMap<>();
		map.put("start", start);
		map.put("finish",finish);
		map.put("keyword",keyword);
		return sqlSession.selectList("care.pet_sitter_list_care_board_no",map);
	}

	//care_member_id 검색목록
	@Override
	public List<CarePetsitterDto> pet_sitter_list_care_member_id(String keyword, int start, int finish) {
		Map<String,Object> map = new HashMap<>();
		map.put("start", start);
		map.put("finish",finish);
		map.put("keyword",keyword);
		return sqlSession.selectList("care.pet_sitter_list_care_member_id",map);
	}

	//care_sitter_no 검색목록
	@Override
	public List<CarePetsitterDto> pet_sitter_list_care_sitter_no(String keyword, int start, int finish) {
		Map<String,Object> map = new HashMap<>();
		map.put("start", start);
		map.put("finish",finish);
		map.put("keyword",keyword);
		return sqlSession.selectList("care.pet_sitter_list_care_sitter_no",map);
	}

	//care_board_content 검색목록
	@Override
	public List<CarePetsitterDto> pet_sitter_list_care_board_content(String keyword, int start, int finish) {
		Map<String,Object> map = new HashMap<>();
		map.put("start", start);
		map.put("finish",finish);
		map.put("keyword",keyword);
		return sqlSession.selectList("care.pet_sitter_list_care_board_content",map);
	}
}
