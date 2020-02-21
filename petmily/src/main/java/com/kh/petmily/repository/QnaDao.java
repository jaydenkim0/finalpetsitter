package com.kh.petmily.repository;

import java.util.List;

import org.springframework.ui.Model;

import com.kh.petmily.vo.QnaVO;

public interface QnaDao {
	//게시글 작성
		void create(QnaVO qnaVO) throws Exception;
		//게시글 상세보기
		QnaVO read(int qna_no) throws Exception;
		//게시글 수정
		void update(QnaVO qnaVO) throws Exception;
		//게시글 삭제
		void delete(int qna_no) throws Exception;
		//게시글 검색목록 조회
		List<QnaVO> listAll(String type, String keyword, int start, int finish) throws Exception;
		//게시글 레코드 갯수 메소드
		public int getCount(String type, String keyword) throws Exception;
		//게시글 목록 조회
		List<QnaVO> getList(int start, int finish);
		//게시글 번호 구해오기
		int getSequence();
		//게시글 답글
		void createReply(QnaVO qnaVO);
}
