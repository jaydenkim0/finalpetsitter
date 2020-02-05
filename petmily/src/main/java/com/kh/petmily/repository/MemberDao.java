package com.kh.petmily.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.entity.PetDto;

public interface MemberDao {	
	
	void regist(MemberDto memberDto);
	
	MemberDto login(MemberDto memberDto);

	MemberDto mylist(String id);

	List<PetDto> mylistpet(String id);

	void updatelastlogin(String id);

	// 비밀번호 변경
	void pwchange(MemberDto memberDto);
}
