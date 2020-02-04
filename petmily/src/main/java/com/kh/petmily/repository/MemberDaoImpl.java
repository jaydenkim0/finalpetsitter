package com.kh.petmily.repository;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.MemberDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void regist(MemberDto memberDto) {
		sqlSession.insert("member.regist", memberDto);		
	}

	@Override
	public MemberDto login(MemberDto memberDto) {		
		
		return sqlSession.selectOne("member.login", memberDto);		
	}

	//내정보조회
	@Override
	public List<MemberDto> mylist(String id) {
		return sqlSession.selectList("member.mylist",id);
	}
	
	

}
