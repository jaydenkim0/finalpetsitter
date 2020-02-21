package com.kh.petmily.service;

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

import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.entity.MemberImageDto;
import com.kh.petmily.entity.PetDto;
import com.kh.petmily.entity.PetImageDto;
import com.kh.petmily.entity.PetImagePetDto;
import com.kh.petmily.entity.ReviewSitterDto;
import com.kh.petmily.repository.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	MemberDto memberDto;
	
	@Override
	public void regist(MemberDto memberDto) {
		memberDao.regist(memberDto);
	}

	@Override	
		public MemberDto login(MemberDto memberDto) {					 
			return memberDao.login(memberDto);	
  
		}
	
	//내정보조회
	@Override
	public MemberDto mylist(String id) {		
		return memberDao.mylist(id);
	}
	
	//반려동물조회
	@Override
	public List<PetImagePetDto> mylistpet(String id){
		return memberDao.mylistpet(id);
	}
	
	//로그인 시 최종로그인 업데이트
	@Override
	public void updatelastlogin(String id) {
		memberDao.updatelastlogin(id);
	}

	//아이디찾기
	@Override
	public String findid(MemberDto memberDto) {
		return memberDao.findid(memberDto);
	}
	
	// 비밀번호 변경
	@Override
	public void pwchange(MemberDto memberDto) {		
		memberDao.pwchange(memberDto);
	}

	//펫등록
	@Override
	public void pet_regist(PetDto petDto) {
		memberDao.pet_regist(petDto);
	}

	//회원정보 수정
	@Override
	public void mylistchange(MemberDto memberDto) {
		memberDao.mylistchange(memberDto);
	}

	//아이디중복검사
	@Override
	public int userIdCheck(String user_id) {
		return memberDao.userIdCheck(user_id);
	}

	//회원탈퇴처리
	@Override
	public void memberdelete(String id, String password) {
		memberDto.setId(id);
		memberDto.setPw(password);
		memberDao.memberdelete(memberDto);
	}

	//회원 탈퇴되었는지 검사
	@Override
	public int idExist(String id) {
		return memberDao.idExist(id);
	}


	//해당 회원의 회원 이미지 번호 구해오기
	@Override
	public Integer member_image_no(String id) {
		Integer member_image_no = memberDao.member_image_no(id);
		if(member_image_no==null) {
			return 0;
		}else {
			return memberDao.member_image_no(id);
		}
	}

	//회원이미지 가지고 오기(사진정보 1개씩 가지고 오기)
	@Override
	public ResponseEntity<ByteArrayResource> member_image(int member_image_no)
			throws UnsupportedEncodingException, IOException {
		MemberImageDto memberImage = memberDao.getmember_image(member_image_no);
		byte[]data = memberDao.physicalmember_image(memberImage.getSavename());
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

	//펫 번호로 펫 이미지 번호 구하기
	@Override
	public int pet_image_no(int pet_no) {
		return memberDao.pet_image_no(pet_no);
	}

	//펫이미지 가지고 오기(사진정보 1개씩 가지고 오기)
	@Override
	public ResponseEntity<ByteArrayResource> pet_image(int pet_image_no)
			throws UnsupportedEncodingException, IOException {
		PetImageDto petImage = memberDao.getpet_image(pet_image_no);
		byte[] data = memberDao.physicalpet_image(petImage.getSavename());
		ByteArrayResource resource = new ByteArrayResource(data);
		return ResponseEntity.ok()
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.contentLength(petImage.getFilesize())
				.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
				.header("Content-Disposition", "attachment;filename=\""
						+URLEncoder.encode(petImage.getUploadname(), "UTF-8")
						+"\"")				
				.body(resource);
	}

	//펫번호 가지고오기
	@Override
	public int pet_no(String pet_name,String pet_age,String pet_type) {
		return memberDao.pet_no(pet_name,pet_age,pet_type);
	}

	//펫정보 가지고오기
	@Override
	public PetImagePetDto getpet(String pet_no) {
		return memberDao.getpet(pet_no);
	}

	//펫정보수정
	@Override
	public void petchange(PetDto petDto) {
		memberDao.petchange(petDto);
	}
	
	//회원이미지정보
	@Override
	public MemberImageDto getImageInfo(int member_image_no) {
		return memberDao.getImageInfo(member_image_no);
	}

	//회원 이미지 등록
	@Override
	public void member_image_regist(String id, MultipartFile member_image) throws IllegalStateException, IOException {
		MemberImageDto memberImageDto = MemberImageDto.builder()
				.member_image_member_id(id)
				.savename(UUID.randomUUID().toString())
				.filetype(member_image.getContentType())
				.filesize(member_image.getSize())
				.uploadname(member_image.getOriginalFilename())
				.build();
		
		File dir = new File("C:/upload/member_image");
		
		File target = new File(dir,memberImageDto.getSavename());
		dir.mkdirs();
		
		member_image.transferTo(target);
		
		memberDao.member_image_regist(memberImageDto);
	}

	//회원이미지수정
	@Override
	public void member_image_change(MemberImageDto memberImageDto, MultipartFile member_image) throws IllegalStateException, IOException {
		MemberImageDto memberImage = MemberImageDto.builder()
				.member_image_no(memberImageDto.getMember_image_no())
				.member_image_member_id(memberImageDto.getMember_image_member_id())
				.savename(memberImageDto.getSavename())
				.filetype(member_image.getContentType())
				.filesize(member_image.getSize())
				.uploadname(member_image.getOriginalFilename())
				.build();
		
		File dir = new File("C:/upload/member_image");
		
		File target = new File(dir,memberImage.getSavename());
		dir.mkdirs();
		
		member_image.transferTo(target);
		
		memberDao.member_image_change(memberImage);
	}

	//펫이미지수정
	@Override
	public void pet_image_change(PetImageDto petImageDto, MultipartFile pet_image) throws IllegalStateException, IOException {
		PetImageDto petImage = PetImageDto.builder()
				.pet_image_no(petImageDto.getPet_image_no())
				.pet_image_pet_no(petImageDto.getPet_image_pet_no())
				.savename(petImageDto.getSavename())
				.filetype(pet_image.getContentType())
				.filesize(pet_image.getSize())
				.uploadname(pet_image.getOriginalFilename())
				.build();
		
		File dir = new File("C:/upload/pet_image");
		
		File target = new File(dir,petImage.getSavename());
		dir.mkdirs();
		
		pet_image.transferTo(target);
		
		memberDao.pet_image_change(petImage);
	}
	//펫이미지정보
	@Override
	public PetImageDto getPetImageInfo(int pet_image_pet_no) {
		return memberDao.getPetImageInfo(pet_image_pet_no);
	}
	
	//펫이미지 등록
	@Override
	public void pet_image_regist(int pet_no, MultipartFile pet_image) throws IllegalStateException, IOException {
		PetImageDto petImageDto = PetImageDto.builder()
				.pet_image_pet_no(pet_no)
				.savename(UUID.randomUUID().toString())
				.filetype(pet_image.getContentType())
				.filesize(pet_image.getSize())
				.uploadname(pet_image.getOriginalFilename())
				.build();
		
		File dir = new File("C:/upload/pet_image");
		
		File target = new File(dir,petImageDto.getSavename());
		dir.mkdirs();
		
		pet_image.transferTo(target);
		
		memberDao.pet_image_regist(petImageDto);
	}

	//펫삭제
	@Override
	public void pet_delete(int pet_no) {
		memberDao.pet_delete(pet_no);
	}

	//펫숫자세기
	@Override
	public int pet_exist(String id) {
		return memberDao.pet_exist(id);
	}

	//펫 존재여부에 따라 멤버의 반려동물여부 값 바꾸기
	@Override
	public void pet_Yes(String id) {
		memberDao.pet_Yes(id);
	}
	@Override
	public void pet_No(String id) {
		memberDao.pet_No(id);
	}

	//블랙리스트인지 검사
	@Override
	public int isBlack(String id) {
		return memberDao.isBlack(id);
	}

	//경고횟순
	@Override
	public int blackcount(String id) {
		return memberDao.blackcount(id);
	}

	//내가 쓴 리뷰
	@Override
	public List<ReviewSitterDto> myreview(String id) {
		return memberDao.myreview(id);
	}
	}

