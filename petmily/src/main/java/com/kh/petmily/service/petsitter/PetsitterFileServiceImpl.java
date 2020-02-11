package com.kh.petmily.service.petsitter;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.petmily.entity.IdCardFileDto;
import com.kh.petmily.entity.InfoImageDto;
import com.kh.petmily.entity.LicenseFileDto;
import com.kh.petmily.repository.petsitter.IdCardFileDao;
import com.kh.petmily.repository.petsitter.InfoImageDao;
import com.kh.petmily.repository.petsitter.LicenseFileDao;

@Service
public class PetsitterFileServiceImpl implements PetsitterFileService{
	
	//파일
	@Autowired
	private LicenseFileDao licenseFileDao;
	@Autowired
	private IdCardFileDao idCardFileDao;
	@Autowired
	private InfoImageDao infoImageDao;
	
	@Override
	public void uploadLicense(int no, MultipartFile license_file) throws IllegalStateException, IOException {
		LicenseFileDto licenseFileDto = LicenseFileDto.builder()
				.license_sitter_no(no)//파일 올린 시터 번호
				.uploadname(license_file.getOriginalFilename())//업로드한 이름
				.savename(UUID.randomUUID().toString())//저장된 이름
				.filetype(license_file.getContentType())//파일 유형
				.filesize(license_file.getSize())//파일 크기
				.build();
		

		//폴더 생성
		File dir = new File("D:/upload/license");
		
		//파일명 -> 시퀀스로 변경할 것!!
		File target = new File(dir,licenseFileDto.getSavename());
		dir.mkdirs();//디렉터리 생성
		
		license_file.transferTo(target);//파일 저장
		
		licenseFileDao.uploadLicense(licenseFileDto);//DB에 등록
	}

	@Override
	public void uploadId(int no, MultipartFile id_card_file) throws IllegalStateException, IOException {
		IdCardFileDto idCardFileDto = IdCardFileDto.builder()
				.id_card_sitter_no(no)
				.uploadname(id_card_file.getOriginalFilename())//업로드한 이름
				.savename(UUID.randomUUID().toString())//저장된 이름
				.filetype(id_card_file.getContentType())//파일 유형
				.filesize(id_card_file.getSize())//파일 크기
				.build();

		//폴더 생성
		File dir = new File("D:/upload/idCard");
		
				//파일명 -> 시퀀스로 변경할 것!!
		File target = new File(dir,idCardFileDto.getSavename());
		dir.mkdirs();//디렉터리 생성
		
		id_card_file.transferTo(target);//파일 저장
		
		idCardFileDao.uploadId(idCardFileDto);//DB에 등록
	}

	@Override
	public void uploadInfo(int no, List<MultipartFile> info_image) throws IllegalStateException, IOException {
		
		List<InfoImageDto> list =new ArrayList<>();
		
		//폴더 생성
		File dir = new File("D:/upload/info");
		dir.mkdirs();//디렉터리 생성
		
		for(MultipartFile mf : info_image) {			
			list.add(
					InfoImageDto.builder()
								.info_sitter_no(no)
								.uploadname(mf.getOriginalFilename())//업로드한 이름
								.savename(UUID.randomUUID().toString())//저장된 이름
								.filetype(mf.getContentType())//파일 유형
								.filesize(mf.getSize())//파일 크기
								.build());
		}
		
		for(int i=0; i< list.size(); i++) {
			MultipartFile mf = info_image.get(i);
			InfoImageDto infoImageDto = list.get(i);
					
			File target = new File(dir,infoImageDto.getSavename());
			mf.transferTo(target);//파일 저장
			infoImageDao.uploadInfo(infoImageDto);
		}				 
		
	}
	

}
