package com.kh.petmily.repository;

import java.util.List;

import com.kh.petmily.entity.CareDto;
import com.kh.petmily.entity.CareImageDto;
import com.kh.petmily.entity.CareReplyDto;

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

	//파일번호찾기
	int care_image_no();

	//파일 데이터베이스에 저장
	void care_image(CareImageDto careImageDto);

}
