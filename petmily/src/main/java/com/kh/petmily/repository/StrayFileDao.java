package com.kh.petmily.repository;

import java.io.IOException;
import java.util.List;

import com.kh.petmily.entity.StrayFileDto;

public interface StrayFileDao {
	//stray 파일 업로드
	void uploadstray(StrayFileDto strayfileDto);
	//게시글에 있는 이미지가 몇개인지 가지고오기
	List<StrayFileDto> strayImageList(int stray_no);
	//게시글 이미지 가져오기(사진정보 한장씩)
	StrayFileDto fileview(int stray_file_no) throws IOException;
	//게시글 이미지 실제로 가져오기(사진정보 한장씩)
	byte[] physicalStrayImage(String savename) throws IOException;

}
