package com.kh.petmily.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.CareDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class CareDaoImpl implements CareDao{

	@Autowired
	private SqlSession sqlSession;

	//게시글 목록
	@Override
	public List<CareDto> list() {
		return sqlSession.selectList("care.list");
	}
	
}
