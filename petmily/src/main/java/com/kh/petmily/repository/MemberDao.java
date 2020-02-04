package com.kh.petmily.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.petmily.entity.MemberDto;

public interface MemberDao {	
	
	void regist(MemberDto memberDto);
	
	MemberDto login(MemberDto memberDto);

	List<MemberDto> mylist(String id);
}
