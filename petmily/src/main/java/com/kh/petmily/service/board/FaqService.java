package com.kh.petmily.service.board;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import com.kh.petmily.entity.FaqDto;
import com.kh.petmily.entity.FaqFileDto;
import com.kh.petmily.vo.FaqFileVO;
import com.kh.petmily.vo.FaqVO;

public interface FaqService {
	//게시글 작성
	void create(FaqVO faqVO) throws Exception;
	//게시글 상세보기
	FaqVO read(int faq_no) throws Exception;
	//게시글 수정
	void update(FaqVO faqVO) throws Exception;
	//게시글 삭제
	void delete(int faq_no) throws Exception;
	//게시글 검색목록 조회
	List<FaqVO> listAll(String type, String keyword, int start, int finish) throws Exception;
	//게시글 레코드 갯수
	public int getCount(String type, String keyword) throws Exception;
	//게시글 목록
	List<FaqVO> getList(int start, int finish);
	//게시글 다중파일 등록
	void uploadFile(int no, List<MultipartFile> faq_file) throws IllegalStateException, IOException;
	//게시글에 있는 이미지가 몇개인지 가지고오기
	List<FaqFileDto>faqImageList(int faq_no);
	//게시글 이미지 가져오기(사진정보 한장씩)
	ResponseEntity<ByteArrayResource> fileview(int faq_file_no) throws UnsupportedEncodingException, IOException;
}