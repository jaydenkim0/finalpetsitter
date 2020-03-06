package com.kh.petmily.repository;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.QnaFileDto;
@Repository
public class QnaFileDaoImpl implements QnaFileDao{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public void uploadqna(QnaFileDto qnafileDto) {
		sqlSession.insert("qna.qnafile",qnafileDto);
	}
	//게시글에 있는 이미지가 몇개인지 가지고오기
	@Override
	public List<QnaFileDto> qnaImageList(int qna_no) {
		return sqlSession.selectList("qna.qnaImageList",qna_no);
	}
	//게시글 이미지 가져오기(사진정보 한장씩)
	@Override
	public QnaFileDto fileview(int qna_file_no) {
		return sqlSession.selectOne("qna.fileview",qna_file_no);
	}
	//게시글 이미지 실제로 가져오기(사진정보 한장씩)
	@Override
	public byte[] physicalQnaImage(String savename) throws IOException{
		File file = new File("D:/upload/kh2cqna",savename);
		byte[]data = FileUtils.readFileToByteArray(file);
		return data;
	}
}
