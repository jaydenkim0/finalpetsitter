package com.kh.petmily.repository;

import com.kh.petmily.entity.FaqFileDto;

public interface FaqFileDao {
	//faq 파일 업로
	void uploadfaq(FaqFileDto faqfileDto);

}
