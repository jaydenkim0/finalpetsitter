package com.kh.petmily.repository;

import com.kh.petmily.entity.QnaFileDto;

public interface QnaFileDao {
	//qna 파일 업로드
	void uploadqna(QnaFileDto qnafileDto);

}
