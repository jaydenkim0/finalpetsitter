package com.kh.petmily.repository;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.entity.MemberImageDto;
import com.kh.petmily.entity.PetDto;
import com.kh.petmily.entity.PetImageDto;

public interface MemberDao {	
	
	void regist(MemberDto memberDto);
	
	MemberDto login(MemberDto memberDto);

	//내정보조회
	MemberDto mylist(String id);

	//반려동물조회
	List<PetDto> mylistpet(String id);

	//최종로그인일시업데이트
	void updatelastlogin(String id);

	//아이디찾기
	String findid(MemberDto memberDto);

	// 비밀번호 변경
	void pwchange(MemberDto memberDto);

	
	//회원정보 변경
	void mylistchange(MemberDto memberDto);


	//펫등록
	void pet_regist(PetDto petDto);

	//아이디중복검사
	int userIdCheck(String user_id);

	//회원탈퇴처리
	void memberdelete(MemberDto memberDto);

	//회원 탈퇴되었는지 검사
	int idExist(String id);

	//회원이미지 등록
	void member_image_regist(MemberImageDto memberImageDto);

	//펫 번호 구해오기
	int pet_no(String pet_name,String pet_age,String pet_type);

	//펫 이미지 등록
	void pet_image_regist(PetImageDto petImageDto);

	//해당 회원의 회원 이미지 번호 구해오기
	Integer member_image_no(String id);

	//회원이미지 가지고오기(1장씩 요청)
	MemberImageDto getmember_image(int member_image_no);

	//회원이미지 실제로 가지고오기(1장씩 요청)
	byte[] physicalmember_image(String savename) throws IOException;

	//펫 번호로 펫 이미지 번호 구하기
	int pet_image_no(int pet_no);

	//펫이미지 가지고 오기(1장씩 요청)
	PetImageDto getpet_image(int pet_image_no);

	//펫이미지 실제로 가지고오기(1장씩 요청)
	byte[] physicalpet_image(String savename) throws IOException;

	//펫정보 가지고오기
	PetDto getpet(String pet_no);

	//펫정보수정
	void petchange(PetDto petDto);

	//회원이미지정보
	MemberImageDto getImageInfo(int member_image_no);

	//회원이미지수정
	void member_image_change(MemberImageDto memberImage);

	//펫이미지정보
	PetImageDto getPetImageInfo(int pet_image_pet_no);

	//펫이미지수정
	void pet_image_change(PetImageDto petImage);

	//펫이미지등록
	void pet_image_regist2(PetImageDto petImageDto);


}
