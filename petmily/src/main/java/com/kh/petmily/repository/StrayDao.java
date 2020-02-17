package com.kh.petmily.repository;

import java.util.List;

import com.kh.petmily.vo.StrayVO;

public interface StrayDao {
	//게시글 작성
	void create(StrayVO strayVO);
	//게시글 상세보기
	StrayVO read(int stray_no);
	//게시글 삭제
	void delete(int stray_no);
	//게시글 삭제
	void update(StrayVO strayVO);
	//게시글 검색 목록 조회
	List<StrayVO> listAll(String type, String keyword, int start, int finish);
	//게시글 목록 조회
	List<StrayVO> getList(int start, int finish);
	//게시글 레코드 갯수 메소드
	int getCount(String type, String keyword);
	//게시글 번호 구해오기
	int getSequence();
	
}
