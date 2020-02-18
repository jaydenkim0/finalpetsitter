package com.kh.petmily.service;


import java.util.Map;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;


import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.entity.MemberImageDto;
import com.kh.petmily.entity.PetDto;

public interface MemberService {
	
	void regist(MemberDto memberDto);
	
	MemberDto login(MemberDto memberDto);
	
	//내정보조회
	MemberDto mylist(String id);
	
	//반려동물조회
	List<PetDto> mylistpet(String id);

	//최종로그인업데이트
	void updatelastlogin(String id);

	//아이디찾기
	String findid(MemberDto memberDto);

	void pwchange(MemberDto memberDto);


	void mylistchange(MemberDto memberDto);

	//펫등록
	void pet_regist(PetDto petDto);

	//아이디중복검사
	int userIdCheck(String user_id);

	//회원탈퇴처리
	void memberdelete(String id, String password);

	//회원 탈퇴되었는지 검사
	int idExist(String id);

	//회원이미지 등록
	void member_image_regist(String id, MultipartFile member_image) throws IllegalStateException, IOException;

	//펫이미지 등록
	void pet_image_regist(int pet_no, MultipartFile pet_image) throws IllegalStateException, IOException;

	//해당 회원의 회원 이미지 번호 구해오기
	Integer member_image_no(String id);

	//회원이미지 가지고 오기(1장씩 요청)
	ResponseEntity<ByteArrayResource> member_image(int member_image_no) 
			throws UnsupportedEncodingException, IOException;

	//펫번호로 펫 이미지 번호 구하기
	int pet_image_no(int pet_no);

	//펫이미지 가지고 오기(1장씩 요청)
	ResponseEntity<ByteArrayResource> pet_image(int pet_image_no)
			throws UnsupportedEncodingException, IOException;

	//펫번호 가지고오기
	int pet_no(String pet_name,String pet_age, String pet_type);

	//펫정보 가지고오기
	PetDto getpet(String pet_no);

	//펫정보수정
	void petchange(PetDto petDto);

	//회원이미지정보
	MemberImageDto getImageInfo(int member_image_no);

	//회원이미지수정
	void member_image_change(MemberImageDto memberImageDto, MultipartFile member_image) throws IllegalStateException, IOException;

}
