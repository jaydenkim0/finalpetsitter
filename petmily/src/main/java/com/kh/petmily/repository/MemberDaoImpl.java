package com.kh.petmily.repository;


import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.entity.MemberImageDto;
import com.kh.petmily.entity.PetDto;
import com.kh.petmily.entity.PetImageDto;
import com.kh.petmily.entity.PetImagePetDto;

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
	public List<PetImagePetDto> mylistpet(String id){
		return sqlSession.selectList("member.mylistpet",id);
	}

	//최종로그인일시 업데이트
	@Override
	public void updatelastlogin(String id) {
		sqlSession.update("member.updatelastlogin",id);
		
	}

	//아이디찾기
	@Override
	public String findid(MemberDto memberDto) {
		return sqlSession.selectOne("member.findid",memberDto);
	}

	// 비밀번호 변경
	@Override
	public void pwchange(MemberDto memberDto) {	
		sqlSession.update("member.pwchange", memberDto);
	}


	@Override
	public void mylistchange(MemberDto memberDto) {
		sqlSession.update("member.mylistchange", memberDto);		
	}
	
	

	//펫등록
	@Override
	public void pet_regist(PetDto petDto) {
		sqlSession.insert("member.pet_regist",petDto);
	}

	//아이디중복검사
	@Override
	public int userIdCheck(String user_id) {
		return sqlSession.selectOne("member.userIdCheck",user_id);
	}

	//회원탈퇴처리
	@Override
	public void memberdelete(MemberDto memberDto) {
		sqlSession.delete("member.memberdelete",memberDto);
	}

	//회원 탈퇴되었는지 검사
	@Override
	public int idExist(String id) {
		return sqlSession.selectOne("member.idExist",id);
	}

	//펫 번호 구해오기
	@Override
	public int pet_no(String pet_name,String pet_age,String pet_type) {
		Map<String,Object> map = new HashMap<>();
		map.put("pet_name", pet_name);
		map.put("pet_age", pet_age);
		return sqlSession.selectOne("member.pet_no",map);
	}

	//펫 이미지 등록
	@Override
	public void pet_image_regist(PetImageDto petImageDto) {
		sqlSession.insert("member.pet_image_regist",petImageDto);
	}

	//해당 회원의 회원 이미지 번호 구해오기
	@Override
	public Integer member_image_no(String id) {
		return sqlSession.selectOne("member.member_image_no",id);
	}

	//회원이미지 가지고 오기(1장씩 요청)
	@Override
	public MemberImageDto getmember_image(int member_image_no) {
		return sqlSession.selectOne("member.getmember_image",member_image_no);
	}

	//회원이미지 실제로 가지고오기(1장씩 요청)
	@Override
	public byte[] physicalmember_image(String savename) throws IOException{
		File file = new File("C:/upload/member_image",savename);
		byte[] data = FileUtils.readFileToByteArray(file);
		return data;
	}

	//펫번호로 펫 이미지 번호 구하기
	@Override
	public int pet_image_no(int pet_no) {
		return sqlSession.selectOne("member.pet_image_no",pet_no);
	}

	//펫이미지 가지고 오기(1장씩 요청)
	@Override
	public PetImageDto getpet_image(int pet_image_no) {
		return sqlSession.selectOne("member.getpet_image",pet_image_no);
	}

	//펫이미지 실제로 가지고오기(1장씩 요청)
	@Override
	public byte[] physicalpet_image(String savename) throws IOException {
		File file = new File("C:/upload/pet_image",savename);
		byte[] data = FileUtils.readFileToByteArray(file);
		return data;
	}

	//펫정보 가지고오기
	@Override
	public PetDto getpet(String pet_no) {
		return sqlSession.selectOne("member.getpet",pet_no);
	}

	//펫정보수정
	@Override
	public void petchange(PetDto petDto) {
		sqlSession.update("member.petchange",petDto);
	}

	//회원이미지정보
	@Override
	public MemberImageDto getImageInfo(int member_image_no) {
		return sqlSession.selectOne("member.getImageInfo",member_image_no);
	}
	
	//회원 이미지 등록
	@Override
	public void member_image_regist(MemberImageDto memberImageDto) {
		sqlSession.insert("member.member_image_regist",memberImageDto);
	}

	//회원이미지수정
	@Override
	public void member_image_change(MemberImageDto memberImage) {
		sqlSession.update("member.member_image_change",memberImage);
	}

	//펫이미지정보
	@Override
	public PetImageDto getPetImageInfo(int pet_image_pet_no) {
		return sqlSession.selectOne("member.getPetImageInfo",pet_image_pet_no);
	}

	//펫이미지수정
	@Override
	public void pet_image_change(PetImageDto petImage) {
		sqlSession.update("member.pet_image_change",petImage);
	}

	//펫이미지등록
	@Override
	public void pet_image_regist2(PetImageDto petImageDto) {
		sqlSession.insert("member.pet_image_regist2",petImageDto);
	}

	//펫삭제
	@Override
	public void pet_delete(int pet_no) {
		sqlSession.delete("member.pet_delete",pet_no);
	}

	//펫숫자세기
	@Override
	public int pet_exist(String id) {
		return sqlSession.selectOne("member.pet_exist",id);
	}

	//펫 존재여부에 따라 멤버의 반려동물여부 값 바꾸기
	@Override
	public void pet_Yes(String id) {
		sqlSession.update("member.pet_Yes",id);
	}
	@Override
	public void pet_No(String id) {
		sqlSession.update("member.pet_No",id);
	}


}
