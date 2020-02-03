package com.kh.petmily.repository;

import com.kh.petmily.entity.FaqDto;

public interface FaqDao {
	//게시글 작성
	public void write(FaqDto faqDto) throws Exception;
}
