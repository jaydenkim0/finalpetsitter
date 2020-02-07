package com.kh.petmily.repository;

import java.util.List;

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
	public List<CarePetsitterDto> pet_sitter_list() {
		return sqlSession.selectList("care.sitter_id");
	}

}
