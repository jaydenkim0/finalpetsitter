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

import com.kh.petmily.entity.CarePetsitterDto;
import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.entity.MemberImageDto;
import com.kh.petmily.entity.PetDto;
import com.kh.petmily.entity.PetImageDto;
import com.kh.petmily.entity.PetImagePetDto;
import com.kh.petmily.entity.ReservationReviewPaySitterDto;
import com.kh.petmily.entity.ReviewSitterDto;
import com.kh.petmily.vo.QnaVO;
import com.kh.petmily.vo.StrayVO;

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
	//내정보조회 마이페이지
	@Override
	public MemberDto mypage(String id) {
		return sqlSession.selectOne("member.mypage",id);
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

	//회원탈퇴처리
	@Override
	public void memberdelete(String id) {
		sqlSession.delete("member.memberdelete",id);
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
		File file = new File("D:/upload/kh2c/member_image",savename);
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
		System.out.println("savename = "+savename);
		File file = new File("D:/upload/kh2c/pet_image",savename);
		byte[] data = FileUtils.readFileToByteArray(file);
		return data;
	}

	//펫정보 가지고오기
	@Override
	public PetImagePetDto getpet(String pet_no) {
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

	//블랙리스트인지 검사
	@Override
	public int isBlack(String id) {
		return sqlSession.selectOne("member.isBlack",id);
	}

	//경고횟수
	@Override
	public int blackcount(String id) {
		return sqlSession.selectOne("member.blackcount",id);
	}

	//내가 쓴 리뷰
	@Override
	public List<ReviewSitterDto> myreview(String id,int start, int finish) {
		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("start",start);
		map.put("finish", finish);
		return sqlSession.selectList("member.myreview",map);
	}

	//내가 쓴 리뷰 개수 세기
	@Override
	public int getmyreviewCount(String id) {
		return sqlSession.selectOne("member.getmyreviewCount",id);
	}

	//리뷰 상세보기
	@Override
	public ReviewSitterDto myreview_content(int review_no) {
		return sqlSession.selectOne("member.myreview_content",review_no);
	}

	//내 승인된 예약의 개수
	@Override
	public int getmyreservationCount(String id) {
		return sqlSession.selectOne("member.getmyreservationCount",id);
	}

	//멤버+예약+결제+리뷰 합친 예약.
	@Override
	public List<ReservationReviewPaySitterDto> myreservation(String id, int start, int finish) {
		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("start", start);
		map.put("finish", finish);
		return sqlSession.selectList("member.myreservation",map);
	}

	//내가 만든 돌봄방 개수
	@Override
	public int getmycareboardCount(String id) {
		return sqlSession.selectOne("member.getmycareboardCount",id);
	}

	//내가 만든 돌봄방 정보
	@Override
	public List<CarePetsitterDto> mycareboard(String id, int start, int finish) {
		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("start", start);
		map.put("finish", finish);
		return sqlSession.selectList("member.mycareboard",map);
	}

	//내가 올린 문의/신고 개수
	@Override
	public int getmyqnaboardCount(String id) {
		return sqlSession.selectOne("member.getmyqnaboardCount",id);
	}

	//내가 올린 문의/신고 정보
	@Override
	public List<QnaVO> myqnaboard(String id, int start, int finish) {
		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("start", start);
		map.put("finish", finish);
		return sqlSession.selectList("member.myqnaboard",map);
	}

	//내가 올린 Save the Pets ! 개수
	@Override
	public int getmystrayboardCount(String id) {
		return sqlSession.selectOne("member.getmystrayboardCount",id);
	}

	//내가 Save the Pets ! 정보
	@Override
	public List<StrayVO> mystrayboard(String id, int start, int finish) {
		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("start", start);
		map.put("finish", finish);
		return sqlSession.selectList("member.mystrayboard",map);
	}
	
	//아이디중복검사
	@Override
	public int userIdCheck(String user_id) {
		return sqlSession.selectOne("member.userIdCheck",user_id);
	}

	//이메일중복검사
	@Override
	public int emailCheck(String email) {
		return sqlSession.selectOne("member.emailCheck",email);
	}
	
	//이메일 변경전에 아이디와 이메일이 있는지 확인
	@Override
	public MemberDto passwordfind(String email, String id) {
		Map<String,Object> map = new HashMap<>();
		map.put("email", email);
		map.put("id", id);
		return sqlSession.selectOne("member.passwordfind", map);
	}

	//마이페이지 로딩시에 찍어줄 정보
	@Override
	public MemberDto mypage2(String id) {
		return sqlSession.selectOne("member.mypage2",id);
	}
	@Override
	public int size(String id) {
		return sqlSession.selectOne("member.size",id);
	}

	//멤버이미지개수
	@Override
	public int imagecount(String id) {
		return sqlSession.selectOne("member.imagecount",id);
	}

	//펫이미지개수
	@Override
	public int petimagecount(int pet_image_pet_no) {
		return sqlSession.selectOne("member.petimagecount",pet_image_pet_no);
	}

	//사용자 이메일 구해오기
	@Override
	public String get_email(String userId) {
		return sqlSession.selectOne("member.get_email",userId);
	}

	//회원 프로필이미지 삭제
	@Override
	public void member_noimage(String id) {
		sqlSession.delete("member.member_noimage",id);
	}

	//펫 프로필이미지 삭제
	@Override
	public void pet_noimage(int pet_noimage) {
		sqlSession.delete("member.pet_noimage",pet_noimage);
	}

}
