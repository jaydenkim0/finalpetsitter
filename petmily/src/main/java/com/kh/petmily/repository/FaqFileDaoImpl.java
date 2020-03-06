package com.kh.petmily.repository;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.FaqFileDto;
import com.kh.petmily.vo.FaqFileVO;

@Repository
public class FaqFileDaoImpl implements FaqFileDao{

	@Autowired
	SqlSession sqlSession;
	
	//faq 파일 업로드
	@Override
	public void uploadfaq(FaqFileDto faqfileDto) {
		sqlSession.insert("faq.faqfile",faqfileDto);
	}
	//게시글에 있는 이미지가 몇개인지 가지고오기
	@Override
	public List<FaqFileDto> faqImageList(int faq_no) {
		return sqlSession.selectList("faq.faqImageList",faq_no);
	}
	//게시글 이미지 가져오기(사진정보 한장씩)
	@Override
	public FaqFileDto fileview(int faq_file_no) {
		return sqlSession.selectOne("faq.fileview",faq_file_no);
	}
	//게시글 이미지 실제로 가져오기(사진정보 한장씩)
	@Override
	public byte[] physicalFaqImage(String savename) throws IOException {
		File file = new File("D:/upload/kh2c/faq",savename);
		byte[]data = FileUtils.readFileToByteArray(file);
		return data;
	}
}
