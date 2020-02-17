package com.kh.petmily.service.board;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import com.kh.petmily.entity.StrayFileDto;
import com.kh.petmily.vo.StrayReplyVO;
import com.kh.petmily.vo.StrayVO;

public interface StrayService {
	//게시글 검색목록 조회
	List<StrayVO> listAll(String type, String keyword, int start, int finish);
	//게시글 목록
	List<StrayVO> getList(int start, int finish);
	//게시글 레코드 갯수
	int getCount(String type, String keyword);
	//게시글 작성
	void create(StrayVO strayVO);
	//게시글 수정
	void update(StrayVO strayVO);
	//게시글 삭제
	void delete(int stray_no);
	//게시글 다중파일 등록
	void uploadFile(int no, List<MultipartFile> stray_file) throws IllegalStateException, IOException;
	//게시글 상세보기
	StrayVO read(int stray_no);
	//게시글 이미지 가져오기(사진정보 한장씩)
	ResponseEntity<ByteArrayResource> fileview(int stray_file_no) throws IOException;
	//게시글에 있는 이미지가 몇개인지 가지고 오기
	List<StrayFileDto> strayImageList(int stray_no);

}
