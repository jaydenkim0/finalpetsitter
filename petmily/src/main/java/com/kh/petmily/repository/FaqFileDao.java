package com.kh.petmily.repository;

import java.io.IOException;
import java.util.List;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;

import com.kh.petmily.entity.FaqFileDto;
import com.kh.petmily.vo.FaqFileVO;

public interface FaqFileDao {
	//faq 파일 업로드
	void uploadfaq(FaqFileDto faqfileDto);
	//게시글에 있는 이미지가 몇개인지 가지고오기
	List<FaqFileDto> faqImageList(int faq_no);
	//게시글 이미지 가져오기(사진정보 한장씩)
	FaqFileDto fileview(int faq_file_no);
	//게시글 이미지 실제로 가져오기(사진정보 한장씩)
	byte[] physicalFaqImage(String savename) throws IOException;

}
