package com.kh.petmily.service.board;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import com.kh.petmily.entity.QnaFileDto;
import com.kh.petmily.repository.QnaDao;
import com.kh.petmily.repository.QnaFileDao;
import com.kh.petmily.vo.QnaReplyVO;
import com.kh.petmily.vo.QnaVO;

@Service
public class QnaServiceImpl implements QnaService{
	@Autowired
	private QnaDao qnaDao;
	
	@Autowired
	private QnaVO qnaVO;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private QnaFileDao qnafileDao;
	
	//게시글 작성
	@Override
	public void create(QnaVO qnaVO) throws Exception {
		String qna_title = qnaVO.getQna_title();
		String qna_head = qnaVO.getQna_head();
		String qna_content = qnaVO.getQna_content();
		String qna_writer = qnaVO.getQna_writer();
		qnaVO.setQna_title(qna_title);
		qnaVO.setQna_head(qna_head);
		qnaVO.setQna_content(qna_content);
		qnaVO.setQna_writer(qna_writer);
		qnaDao.create(qnaVO);
	}
	//게시글 상세보기
	@Override
	public QnaVO read(int qna_no) throws Exception {
		return qnaDao.read(qna_no);
	}
	//게시글 수정
	@Override
	public void update(QnaVO qnaVO) throws Exception {
		qnaDao.update(qnaVO);
	}
	//게시글 삭제
	@Override
	public void delete(int qna_no) throws Exception {
		qnaDao.delete(qna_no);
	}
	//게시글 검색목록 조회
	@Override
	public List<QnaVO> listAll(String type, String keyword, int start, int finish) throws Exception {
		return qnaDao.listAll(type,keyword,start, finish);
	}
	//게시글 레코드 갯수
	@Override
	public int getCount(String type, String keyword) throws Exception {
		return qnaDao.getCount(type,keyword);
	}
	//게시글 목록
	@Override
	public List<QnaVO> getList(int start, int finish) {
		return qnaDao.getList(start,finish);
	}
	//게시글 다중파일 등록
	@Override
	public void uploadFile(int no, List<MultipartFile> qna_file) throws IllegalStateException, IOException {
		List<QnaFileDto>list = new ArrayList<>();
		File dir = new File("D:/upload/qna");
		dir.mkdirs();
		
		for(MultipartFile mf : qna_file) {
			list.add(
					QnaFileDto.builder()
					.qna_qna_no(no)
					.uploadname(mf.getOriginalFilename())
					.savename(UUID.randomUUID().toString())
					.filetype(mf.getContentType())
					.filesize(mf.getSize())
					.build());
		}
		for(int i=0; i<list.size(); i++) {
			MultipartFile mf = qna_file.get(i);
			QnaFileDto qnafileDto = list.get(i);
			
			File target = new File(dir,qnafileDto.getSavename());
			mf.transferTo(target);
			qnafileDao.uploadqna(qnafileDto);
		}
	}

	}

