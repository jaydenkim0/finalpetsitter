package com.kh.petmily.repository;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.entity.PetDto;

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
	public MemberDto mylist(String id) {
		return sqlSession.selectOne("member.mylist",id);
	}
	
	//반려동물조회
	@Override
	public List<PetDto> mylistpet(String id){
		return sqlSession.selectList("member.mylistpet",id);
	}

	//최종로그인일시 업데이트
	@Override
	public void updatelastlogin(String id) {
		sqlSession.update("member.updatelastlogin",id);
		
	}
	
	

}
