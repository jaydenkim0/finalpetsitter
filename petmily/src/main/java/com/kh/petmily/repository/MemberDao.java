package com.kh.petmily.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.petmily.entity.MemberDto;

public interface MemberDao {	
	
	void regist(MemberDto memberDto);
}
