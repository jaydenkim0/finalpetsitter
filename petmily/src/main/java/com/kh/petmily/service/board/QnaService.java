package com.kh.petmily.service.board;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.kh.petmily.entity.QnaFileDto;
import com.kh.petmily.vo.QnaFileVO;
import com.kh.petmily.vo.QnaReplyVO;
import com.kh.petmily.vo.QnaVO;

public interface QnaService {
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
	//게시글 레코드 갯수
	public int getCount(String type, String keyword) throws Exception;
	//게시글 목록
	List<QnaVO> getList(int start, int finish);
	//게시글 다중파일 등록
	void uploadFile(int no, List<MultipartFile> qna_file) throws IllegalStateException, IOException;
	//게시글에 있는 이미지가 몇개인지 가지고 오기
	List<QnaFileDto> qnaImageList(int qna_no);
	//게시글 이미지 가져오기(사진정보 한장씩)
	ResponseEntity<ByteArrayResource> fileview(int qna_file_no) throws UnsupportedEncodingException, IOException;
}