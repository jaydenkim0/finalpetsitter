package com.kh.petmily.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.entity.PetDto;
import com.kh.petmily.repository.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	MemberDto memberDto;
	
	@Override
	public void regist(MemberDto memberDto) {
		memberDao.regist(memberDto);
	}

	@Override	
		public MemberDto login(MemberDto memberDto) {					 
			return memberDao.login(memberDto);	
  
		}
	
	//내정보조회
	@Override
	public MemberDto mylist(String id) {		
		return memberDao.mylist(id);
	}
	
	//반려동물조회
	@Override
	public List<PetDto> mylistpet(String id){
		return memberDao.mylistpet(id);
	}
	
	//로그인 시 최종로그인 업데이트
	@Override
	public void updatelastlogin(String id) {
		memberDao.updatelastlogin(id);
	}

	//아이디찾기
	@Override
	public String findid(MemberDto memberDto) {
		return memberDao.findid(memberDto);
	}
	
	// 비밀번호 변경
	@Override
	public void pwchange(MemberDto memberDto) {		
		memberDao.pwchange(memberDto);
	}

	//펫등록
	@Override
	public void pet_regist(PetDto petDto) {
		memberDao.pet_regist(petDto);
	}

	//회원정보 수정
	@Override
	public void mylistchange(MemberDto memberDto) {
		memberDao.mylistchange(memberDto);
	}

	//아이디중복검사
	@Override
	public int userIdCheck(String user_id) {
		return memberDao.userIdCheck(user_id);
	}

	//회원탈퇴처리
	@Override
	public void memberdelete(String id, String password) {
		memberDto.setId(id);
		memberDto.setPw(password);
		memberDao.memberdelete(memberDto);
	}

	//회원 탈퇴되었는지 검사
	@Override
	public int idExist(String id) {
		return memberDao.idExist(id);
	}


	
	
	
	
	}

