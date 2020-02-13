package com.kh.petmily.repository;

import java.io.IOException;
import java.util.List;

import com.kh.petmily.entity.QnaFileDto;

public interface QnaFileDao {
	//qna 파일 업로드
	void uploadqna(QnaFileDto qnafileDto);
	//게시글에 있는 이미지가 몇개인지 가지고오기
	List<QnaFileDto> qnaImageList(int qna_no);
	//게시글 이미지 가져오기(사진정보 한장씩)
	QnaFileDto fileview(int qna_file_no);
	//게시글 이미지 실제로 가져오기(사진정보 한장씩)
	byte[] physicalQnaImage(String savename) throws IOException;

}
