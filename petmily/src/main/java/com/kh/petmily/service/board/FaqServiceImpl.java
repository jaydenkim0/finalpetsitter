package com.kh.petmily.service.board;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.petmily.entity.FaqDto;
import com.kh.petmily.entity.FaqFileDto;
import com.kh.petmily.repository.FaqDao;
import com.kh.petmily.repository.FaqFileDao;
import com.kh.petmily.vo.FaqFileVO;
import com.kh.petmily.vo.FaqVO;

@Service
public class FaqServiceImpl implements FaqService {
	@Autowired
	private FaqDao faqDao;
	
	@Autowired
	private FaqVO faqVO;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private FaqFileDao faqfileDao;
	
	//게시글 작성
	@Override
	public void create(FaqVO faqVO) throws Exception {
		String faq_title = faqVO.getFaq_title();
		String faq_head = faqVO.getFaq_head();
		String faq_content = faqVO.getFaq_content();
		String member_id = faqVO.getMember_id();
		faqVO.setFaq_title(faq_title);
		faqVO.setFaq_head(faq_head);
		faqVO.setFaq_content(faq_content);
		faqVO.setMember_id(member_id);
		faqDao.create(faqVO);
	}
	//게시글 상세보기
	@Override
	public FaqVO read(int faq_no) throws Exception {
		return faqDao.read(faq_no);
	}
	//게시글 수정
	@Override
	public void update(FaqVO faqVO) throws Exception {
		faqDao.update(faqVO);
	}
	//게시글 삭제
	@Override
	public void delete(int faq_no) throws Exception {
		faqDao.delete(faq_no);
	}
	//게시글 검색목록 조회
	@Override
	public List<FaqVO> listAll(String type, String keyword, int start, int finish) throws Exception {
		return faqDao.listAll(type,keyword,start, finish);
	}
	//게시글 레코드 갯수
	@Override
	public int getCount(String type, String keyword) throws Exception {
		return faqDao.getCount(type,keyword);
	}
	//게시글 목록
	@Override
	public List<FaqVO> getList(int start, int finish) {
		return faqDao.getList(start,finish);
	}
	//게시글 다중파일 등록
	@Override
	public void uploadFile(int no, List<MultipartFile> faq_file) throws IllegalStateException, IOException {
		if(faq_file.get(0).isEmpty()) {
			return;
		}
		
		List<FaqFileDto>list = new ArrayList<>();
		File dir = new File("D:/upload/kh2c/faq");
		dir.mkdirs();
		
		for(MultipartFile mf : faq_file) {
			list.add(
					FaqFileDto.builder()
					.faq_faq_no(no)
					.uploadname(mf.getOriginalFilename())
					.savename(UUID.randomUUID().toString())
					.filetype(mf.getContentType())
					.filesize(mf.getSize())
					.build());
		}
		for(int i=0; i<list.size(); i++) {
			MultipartFile mf = faq_file.get(i);
			FaqFileDto faqfileDto = list.get(i);
			
			File target = new File(dir,faqfileDto.getSavename());
			mf.transferTo(target);
			faqfileDao.uploadfaq(faqfileDto);
		}
	}
	//게시글에 있는 이미지가 몇개인지 가지고오기
	@Override
	public List<FaqFileDto> faqImageList(int faq_no) {
		return faqfileDao.faqImageList(faq_no);
	}
	//게시글 이미지 가져오기(사진정보 한장씩)
	@Override
	public ResponseEntity<ByteArrayResource> fileview(int faq_file_no)
			throws UnsupportedEncodingException, IOException {
		FaqFileDto faqfileDto = faqfileDao.fileview(faq_file_no);
		//실제파일 불러오기
		byte[]data = faqfileDao.physicalFaqImage(faqfileDto.getSavename());
		ByteArrayResource resource = new ByteArrayResource(data);
		return ResponseEntity.ok()
					.contentType(MediaType.APPLICATION_OCTET_STREAM)
					.contentLength(faqfileDto.getFilesize())
					.header(HttpHeaders.CONTENT_ENCODING,"UTF-8")
					.header("Content-Disposition",	"attachment; filename=\""
					+URLEncoder.encode(faqfileDto.getUploadname(),"UTF-8")
					+"\"")
					.body(resource);
	}
}

