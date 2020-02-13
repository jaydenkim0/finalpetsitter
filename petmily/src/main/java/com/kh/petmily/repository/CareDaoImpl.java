package com.kh.petmily.repository;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.CareDto;
import com.kh.petmily.entity.CareImageDto;
import com.kh.petmily.entity.CareReplyDto;
import com.kh.petmily.entity.CareReplyImageDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class CareDaoImpl implements CareDao{

	@Autowired
	private SqlSession sqlSession;

	//게시글 목록
	@Override
	public List<CareDto> list() {
		return sqlSession.selectList("care.list");
	}

	//펫시터아이디로 펫시터번호 구하기
	@Override
	public int id_to_number(String care_sitter_id) {
		return sqlSession.selectOne("care.id_to_number",care_sitter_id);
	}

	//돌봄방 생성
	@Override
	public void write(CareDto careDto) {
		sqlSession.insert("care.write",careDto);
	}

	//돌봄방 정보 불러오기
	@Override
	public CareDto list(String care_board_no) {
		return sqlSession.selectOne("care.listcontent",care_board_no);
	}

	//펫시터번호로 펫시터아이디 구하기
	@Override
	public String number_to_id(int care_sitter_no) {
		return sqlSession.selectOne("care.number_to_id",care_sitter_no);
	}

	//돌봄 방 제목 변경
	@Override
	public void content_edit(CareDto careDto) {
		sqlSession.update("care.content_edit",careDto);
	}

	//돌봄 방 삭제
	@Override
	public void delete(String care_board_no) {
		sqlSession.delete("care.delete",care_board_no);
	}

	//돌봄 방 댓글 목록
	@Override
	public List<CareReplyDto> replylist(String care_board_no) {
		return sqlSession.selectList("care.replylist",care_board_no);
	}

	//돌봄 방 댓글 등록
	@Override
	public void reply_regist(CareReplyDto careReplyDto) {
		sqlSession.insert("care.reply_regist",careReplyDto);
	}

	//돌봄 방 댓글 수정
	@Override
	public void reply_change(CareReplyDto careReplyDto) {
		sqlSession.update("care.reply_change",careReplyDto);
	}

	//돌봄 방 비밀번호 검사
	@Override
	public int care_board_password(CareDto careDto) {
		return sqlSession.selectOne("care.care_board_password",careDto);
	}

	//돌봄 방 댓글 삭제
	@Override
	public void reply_delete(CareReplyDto careReplyDto) {
		sqlSession.delete("care.reply_delete",careReplyDto);
	}

	//파일업로드를위한 댓글번호찾기
	@Override
	public int find_care_reply_no() {
		return sqlSession.selectOne("care.find_care_reply_no");
	}

	//돌봄 이미지 등록
	@Override
	public void care_image_regist(CareImageDto careImageDto) {
		sqlSession.insert("care.care_image_regist",careImageDto);
	}

	//펫시터 아이디 존재 검사
	@Override
	public int userIdCheck(String user_id) {
		return sqlSession.selectOne("care.userIdCheck",user_id);
	}

	//돌봄이미지 가지고 오기(1장씩 요청)
	@Override
	public CareReplyImageDto getImage(int care_reply_no) {
		return sqlSession.selectOne("care.getImage",care_reply_no);
	}

	//돌봄이미지 실제로 가지고오기(1장씩 요청)
	@Override
	public byte[] physicalImage(String savename) throws IOException {
		File file = new File("C:/upload/care_image",savename);
		byte[] data = FileUtils.readFileToByteArray(file);
		return data;
	}

	//해당 돌봄 방의 돌봄댓글 개수 구하기
	@Override
	public int getCount(String care_board_no) {
		return sqlSession.selectOne("care.getCount",care_board_no);
	}

	//검색X돌봄방개수
	@Override
	public int getListCount() {
		return sqlSession.selectOne("care.getListCount");
	}

}
