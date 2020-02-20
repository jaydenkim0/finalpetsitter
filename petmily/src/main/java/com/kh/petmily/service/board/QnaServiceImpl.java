package com.kh.petmily.service.board;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
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
		int qna_no = qnaVO.getQna_no();
		
		int superno = qnaVO.getSuperno();
		int groupno = qnaVO.getGroupno();
		int depth = qnaVO.getDepth();
		
		//새글 : 글번호와 그룹번호는 동일, 부모글 0번 , 차수 0
		if(qnaVO.getSuperno() == 0) {
			qnaVO.setQna_no(qna_no);
			qnaVO.setGroupno(qna_no);
		}
		//답글 : 그룹번호는 부모 그룹 번호, superno = 부모글 번호, 차수 = 부모글 + 1
		else {
			qnaVO.setQna_no(qna_no);
			qnaVO.setGroupno(groupno);
			qnaVO.setSuperno(superno);
			qnaVO.setDepth(depth+1);
		}
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
	//게시글 삭제 검색목록 조회
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
		if(qna_file.get(0).isEmpty()) {
			return;
		}
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
	//게시글에 있는 이미지가 몇개인지 가지고 오기
	@Override
	public List<QnaFileDto> qnaImageList(int qna_no) {
		return qnafileDao.qnaImageList(qna_no);
	}
	//게시글 이미지 가져오기(사진정보 한장씩)
	@Override
	public ResponseEntity<ByteArrayResource> fileview(int qna_file_no) throws UnsupportedEncodingException, IOException{
		QnaFileDto qnafileDto = qnafileDao.fileview(qna_file_no);
		byte[]data = qnafileDao.physicalQnaImage(qnafileDto.getSavename());
		ByteArrayResource resource = new ByteArrayResource(data);
		return ResponseEntity.ok()
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.contentLength(qnafileDto.getFilesize())
				.header(HttpHeaders.CONTENT_ENCODING,"UTF-8")
				.header("Content-Disposition",	"attachment; filename=\""
				+URLEncoder.encode(qnafileDto.getUploadname(),"UTF-8")
				+"\"")
				.body(resource);
	}
}

