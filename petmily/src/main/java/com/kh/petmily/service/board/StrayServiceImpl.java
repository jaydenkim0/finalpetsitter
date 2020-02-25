package com.kh.petmily.service.board;

import java.io.File;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.petmily.entity.StrayFileDto;
import com.kh.petmily.repository.StrayDao;
import com.kh.petmily.repository.StrayFileDao;
import com.kh.petmily.vo.StrayReplyVO;
import com.kh.petmily.vo.StrayVO;
@Service
public class StrayServiceImpl implements StrayService{
	@Autowired
	private StrayDao strayDao;
	
	@Autowired
	private StrayVO strayVO;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private StrayFileDao strayfileDao;

	@Override
	public List<StrayVO> listAll(String type, String keyword, int start, int finish) {
		return strayDao.listAll(type,keyword,start, finish);
	}

	@Override
	public List<StrayVO> getList(int start, int finish) {
		return strayDao.getList(start,finish);
	}

	@Override
	public int getCount(String type, String keyword) {
		return strayDao.getCount(type,keyword);
	}

	@Override
	public void create(StrayVO strayVO) {
		int stray_no = strayVO.getStray_no();
		
		int superno = strayVO.getSuperno();
		int groupno = strayVO.getGroupno();
		int depth = strayVO.getDepth();
		
		//새글
		if(strayVO.getSuperno() == 0) {
			strayVO.setStray_no(stray_no);
			strayVO.setGroupno(stray_no);
		}
		//답글
		else {
			strayVO.setStray_no(stray_no);
			strayVO.setGroupno(groupno);
			strayVO.setSuperno(superno);
			strayVO.setDepth(depth+1);
		}
		strayDao.create(strayVO);
		
	}

	@Override
	public void uploadFile(int no, List<MultipartFile> stray_file) throws IllegalStateException, IOException {
		if(stray_file.get(0).isEmpty()) {
			return;
		}
		
		List<StrayFileDto>list = new ArrayList<>();
		File dir = new File("D:/upload/stray");
		dir.mkdirs();
		
		for(MultipartFile mf : stray_file) {
			list.add(
					StrayFileDto.builder()
					.stray_stray_no(no)
					.uploadname(mf.getOriginalFilename())
					.savename(UUID.randomUUID().toString())
					.filetype(mf.getContentType())
					.filesize(mf.getSize())
					.build());
		}
		for(int i=0; i<list.size(); i++) {
			MultipartFile mf = stray_file.get(i);
			StrayFileDto strayfileDto = list.get(i);
			
			File target = new File(dir,strayfileDto.getSavename());
			mf.transferTo(target);
			strayfileDao.uploadstray(strayfileDto);
		}
	}

	@Override
	public StrayVO read(int stray_no) {
		return strayDao.read(stray_no);
	}

	@Override
	public List<StrayFileDto> strayImageList(int stray_no) {
		return strayfileDao.strayImageList(stray_no);
	}


	@Override
	public ResponseEntity<ByteArrayResource> fileview(int stray_file_no) throws IOException {
		StrayFileDto strayfileDto = strayfileDao.fileview(stray_file_no);
		byte[]data = strayfileDao.physicalStrayImage(strayfileDto.getSavename());
		ByteArrayResource resource = new ByteArrayResource(data);
		return ResponseEntity.ok()
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.contentLength(strayfileDto.getFilesize())
				.header(HttpHeaders.CONTENT_ENCODING,"UTF-8")
				.header("Content-Disposition",	"attachment; filename=\""
				+URLEncoder.encode(strayfileDto.getUploadname(),"UTF-8")
				+"\"")
				.body(resource);
	}

	@Override
	public void update(StrayVO strayVO) {
		strayDao.update(strayVO);
		 
	}

	@Override
	public void delete(int stray_no) {
		strayDao.delete(stray_no);
		
	}

}