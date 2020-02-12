package com.kh.petmily.repository;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;

import com.kh.petmily.entity.FaqFileDto;
import com.kh.petmily.vo.FaqFileVO;

public interface FaqFileDao {
	//faq 파일 업로드
	void uploadfaq(FaqFileDto faqfileDto);

}
