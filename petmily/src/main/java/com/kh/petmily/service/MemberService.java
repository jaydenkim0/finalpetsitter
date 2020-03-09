package com.kh.petmily.service;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

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

public interface MemberService {
	
	void regist(MemberDto memberDto);
	
	MemberDto login(MemberDto memberDto);
	
	//내정보조회
	MemberDto mylist(String id);
	
	//반려동물조회
	List<PetImagePetDto> mylistpet(String id);

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

	//이메일중복검사
	int emailCheck(String email);
	
	//회원탈퇴처리
	void memberdelete(String id, String password);

	//회원 탈퇴되었는지 검사
	int idExist(String id);

	//회원이미지 등록
	void member_image_regist(String id, MultipartFile member_image) throws IllegalStateException, IOException;


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
	PetImagePetDto getpet(String pet_no);

	//펫정보수정
	void petchange(PetDto petDto);

	//회원이미지정보
	MemberImageDto getImageInfo(int member_image_no);

	//회원이미지수정
	void member_image_change(MemberImageDto memberImageDto, MultipartFile member_image) throws IllegalStateException, IOException;

	//펫이미지정보
	PetImageDto getPetImageInfo(int pet_image_pet_no);

	//펫이미지수정
	void pet_image_change(PetImageDto petImageDto, MultipartFile pet_image) throws IllegalStateException, IOException;

	//펫이미지 등록
	void pet_image_regist(int pet_no, MultipartFile pet_image) throws IllegalStateException, IOException;

	//펫삭제
	void pet_delete(int pet_no);

	//펫숫자세기
	int pet_exist(String id);

	//펫 존재여부에 따라 멤버의 반려동물여부 값 바꾸기
	void pet_Yes(String id);
	void pet_No(String id);

	//블랙리스트인지 검사
	int isBlack(String id);

	//경고횟수
	int blackcount(String id);

	//내가 쓴 리뷰
	List<ReviewSitterDto> myreview(String id,int start, int finish);

	//내가 쓴 리뷰 개수 세기
	int getmyreviewCount(String id);

	//리뷰 상세보기
	ReviewSitterDto myreview_content(int review_no);

	//내 승인된 예약의 개수
	int getmyreservationCount(String id);

	//멤버+예약+결제+리뷰 합친 예약.
	List<ReservationReviewPaySitterDto> myreservation(String id, int start, int finish);

	//내가 만든 돌봄방 개수
	int getmycareboardCount(String id);

	//돌봄방 정보
	List<CarePetsitterDto> mycareboard(String id, int start, int finish);

	//내가 올린 문의/신고 개수
	int getmyqnaboardCount(String id);

	//내가 올린 문의/신고 정보
	List<QnaVO> myqnaboard(String id, int start, int finish);

	//내가 올린 Save the Pets ! 개수
	int getmystrayboardCount(String id);

	//내가 쓴 Save the Pets ! 정보
	List<StrayVO> mystrayboard(String id, int start, int finish);

	// 이메일 변경전에 아이디와 이메일이 있는지 확인
	MemberDto passwordfind(String email, String id);

	//마이페이지 로딩시에 찍어줄 정보
	MemberDto mypage(String id);

	int size(String id);

}
