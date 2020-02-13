package com.kh.petmily.repository;

import java.io.IOException;
import java.util.List;

import com.kh.petmily.entity.CareDto;
import com.kh.petmily.entity.CareImageDto;
import com.kh.petmily.entity.CareReplyDto;
import com.kh.petmily.entity.CareReplyImageDto;

public interface CareDao {

	//게시글목록
	List<CareDto> list();

	//펫시터아이디로 펫시터번호 구하기
	int id_to_number(String care_sitter_id);

	//돌봄방 생성
	void write(CareDto careDto);

	//돌봄방 정보 불러오기
	CareDto list(String care_board_no);

	//펫시터번호로 펫시터아이디 구하기
	String number_to_id(int care_sitter_no);

	//돌봄 방 제목 변경
	void content_edit(CareDto careDto);

	//돌봄 방 삭제
	void delete(String care_board_no);

	//돌봄 방 댓글 목록
	List<CareReplyDto> replylist(String care_board_no);

	//돌봄 방 댓글 등록
	void reply_regist(CareReplyDto careReplyDto);

	//돌봄 방 댓글 수정
	void reply_change(CareReplyDto careReplyDto);

	//돌봄 방 비밀번호 검사
	int care_board_password(CareDto careDto);

	//돌봄 방 댓글 삭제
	void reply_delete(CareReplyDto careReplyDto);

	//파일업로드를 위한 댓글번호찾기
	int find_care_reply_no();

	//돌봄이미지 등록
	void care_image_regist(CareImageDto careImageDto);

	//펫시터 아이디 존재 검사
	int userIdCheck(String user_id);

	//돌봄이미지 가지고 오기(1장씩 요청)
	CareReplyImageDto getImage(int care_image_no);

	//돌봄이미지 실제로 가지고오기(1장씩 요청)
	byte[] physicalImage(String savename) throws IOException;

	//해당 돌봄 방의 돌봄 댓글 개수 구하기
	int getCount(String care_board_no);

	//검색X돌봄방개수
	int getListCount();

	//care_board_no 검색개수
	int getListCount_care_board_no(String keyword);

	//care_member_id 검색개수
	int getListCount_care_member_id(String keyword);

	//care_sitter_id 검색개수.
	int getListCount_care_sitter_no(String keyword);

	//care_board_content 검색개수
	int getListCount_care_board_content(String keyword);

}
