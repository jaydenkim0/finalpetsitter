package com.kh.petmily.service.board;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.petmily.entity.CareDto;
import com.kh.petmily.entity.CareImageDto;
import com.kh.petmily.entity.CarePetsitterDto;
import com.kh.petmily.entity.CareReplyDto;
import com.kh.petmily.entity.CareReplyImageDto;
import com.kh.petmily.entity.MemberImageDto;
import com.kh.petmily.entity.PetsitterDto;
import com.kh.petmily.repository.CareDao;
import com.kh.petmily.repository.CarePetsitterDao;
import com.kh.petmily.repository.CareReplyImageDao;

@Service
public class CareServiceImpl implements CareService{

	@Autowired
	private CareDao careDao;
	
	@Autowired
	private CarePetsitterDao carePetsitterDao; 
	
	@Autowired
	private CareReplyImageDao careReplyImageDao;

	//게시글 목록
	@Override
	public List<CareDto> list() {
		return careDao.list();
	}

	//펫시터아이디로 펫시터번호 구하기
	@Override
	public int id_to_number(String care_sitter_id) {
		return careDao.id_to_number(care_sitter_id);
	}

	//돌봄방 생성
	@Override
	public void write(CareDto careDto) {
		careDao.write(careDto);
	}

	//돌봄방 정보 불러오기
	@Override
	public CareDto list(String care_board_no) {
		return careDao.list(care_board_no);
	}

	//펫시터번호로 펫시터아이디 구하기
	@Override
	public String number_to_id(int care_sitter_no) {
		return careDao.number_to_id(care_sitter_no);
	}

	//돌봄 방 제목 변경
	@Override
	public void content_edit(CareDto careDto) {
		careDao.content_edit(careDto);
	}

	//돌봄 방 삭제
	@Override
	public void delete(String care_board_no) {
		careDao.delete(care_board_no);
	}

	//돌봄 방 댓글 목록
	@Override
	public List<CareReplyDto> replylist(String care_board_no) {
		return careDao.replylist(care_board_no);
	}

	//돌봄 방 댓글 등록
	@Override
	public void reply_regist(CareReplyDto careReplyDto) {
		careDao.reply_regist(careReplyDto);
	}

	//돌봄 방 댓글 수정
	@Override
	public void reply_change(CareReplyDto careReplyDto) {
		careDao.reply_change(careReplyDto);
	}

	//돌봄 방 비밀번호 검사
	@Override
	public int care_board_password(CareDto careDto) {
		return careDao.care_board_password(careDto);
	}

	//돌봄 방 댓글 삭제
	@Override
	public void reply_delete(CareReplyDto careReplyDto) {
		careDao.reply_delete(careReplyDto);
	}

	//파일업로드를위한 댓글번호찾기
	@Override
	public int find_care_reply_no() {
		return careDao.find_care_reply_no();
	}

	//돌봄 이미지 등록
	@Override
	public void care_image_regist(int care_reply_no, MultipartFile care_image) throws IllegalStateException, IOException {
		CareImageDto careImageDto = CareImageDto.builder()
				.care_reply_no(care_reply_no)
				.savename(UUID.randomUUID().toString())
				.filetype(care_image.getContentType())
				.filesize(care_image.getSize())
				.uploadname(care_image.getOriginalFilename())
				.build();
		
		File dir = new File("D:/upload/kh2c/care_image");
		
		File target = new File(dir,careImageDto.getSavename());
		dir.mkdirs();
		
		care_image.transferTo(target);
		
		careDao.care_image_regist(careImageDto);
	}

	//돌봄댓글&이미지 목록
	@Override
	public List<CareReplyImageDto> replyimagelist(String care_board_no, int start, int finish) {
		return careReplyImageDao.replyimagelist(care_board_no,start,finish);
	}

	//돌봄이미지 가지고 오기(사진정보 1개씩 가지고 오기
	@Override
	public ResponseEntity<ByteArrayResource> image(int care_image_no) throws UnsupportedEncodingException, IOException {
		CareReplyImageDto careImage = careDao.getImage(care_image_no);
		byte[]data = careDao.physicalImage(careImage.getSavename());
		ByteArrayResource resource = new ByteArrayResource(data);
		return ResponseEntity.ok()
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.contentLength(careImage.getFilesize())
				.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
				.header("Content-Disposition", "attachment;filename=\""
						+URLEncoder.encode(careImage.getUploadname(), "UTF-8")
						+"\"")
				.body(resource);
	}

	//해당 돌봄방의 돌봄 댓글 개수 구하기
	@Override
	public int getCount(String care_board_no) {
		return careDao.getCount(care_board_no);
	}
	
	//게시글목록(펫시터아이디)
	@Override
	public List<CarePetsitterDto> pet_sitter_list(int start,int finish) {
		return carePetsitterDao.pet_sitter_list(start,finish);
	}

	//검색X돌봄방개수
	@Override
	public int getListCount() {
		return careDao.getListCount();
	}

	//care_board_no 검색목록
	@Override
	public List<CarePetsitterDto> pet_sitter_list_care_board_no(String keyword, int start, int finish) {
		return carePetsitterDao.pet_sitter_list_care_board_no(keyword,start,finish);
	}

	//care_board_no 검색개수
	@Override
	public int getListCount_care_board_no(String keyword) {
		return careDao.getListCount_care_board_no(keyword);
	}

	//care_member_id 검색목록
	@Override
	public List<CarePetsitterDto> pet_sitter_list_care_member_id(String keyword, int start, int finish) {
		return carePetsitterDao.pet_sitter_list_care_member_id(keyword,start,finish);
	}

	//care_member_id 검색개수
	@Override
	public int getListCount_care_member_id(String keyword) {
		return careDao.getListCount_care_member_id(keyword);
	}

	//sitter_id 검색목록
	@Override
	public List<CarePetsitterDto> pet_sitter_list_sitter_id(String keyword, int start, int finish) {
		return carePetsitterDao.pet_sitter_list_care_sitter_no(keyword,start,finish);
	}

	//sitter_id 검색개수
	@Override
	public int getListCount_sitter_id(String keyword) {
		return careDao.getListCount_care_sitter_no(keyword);
	}

	//care_board_content 검색목록
	@Override
	public List<CarePetsitterDto> pet_sitter_list_care_board_content(String keyword, int start, int finish) {
		return carePetsitterDao.pet_sitter_list_care_board_content(keyword,start,finish);
	}

	//care_board_content 검색개수
	@Override
	public int getListCount_care_board_content(String keyword) {
		return careDao.getListCount_care_board_content(keyword);
	}

	
	//회원이미지 가지고 오기(사진정보 1개씩 가지고 오기)
	@Override
	public ResponseEntity<ByteArrayResource> member_image(String member_image_member_id)
			throws UnsupportedEncodingException, IOException {
		MemberImageDto memberImage = careDao.getmember_image(member_image_member_id);
		byte[] data = careDao.physicalmember_image(memberImage.getSavename());
		ByteArrayResource resource = new ByteArrayResource(data);
		return ResponseEntity.ok()
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.contentLength(memberImage.getFilesize())
				.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
				.header("Content-Disposition", "attachment;filename=\""
						+URLEncoder.encode(memberImage.getUploadname(), "UTF-8")
						+"\"")						
				.body(resource);
	}
	
	//펫시터 아이디 존재 검사
	@Override
	public int userIdCheck(String user_id) {
		return careDao.userIdCheck(user_id);
	}

	//펫시터 아이디 제공
	@Override
	public List<String> offer_id() {
		return careDao.offer_id();
	}

	//작성자 아이디 갖고오기
	@Override
	public String get_writer(int care_board_no) {
		return careDao.get_writer(care_board_no);
	}

	//펫시터 아이디 갖고오기
	@Override
	public String get_petsitter(int care_board_no) {
		return careDao.get_petsitter(care_board_no);
	}

}
