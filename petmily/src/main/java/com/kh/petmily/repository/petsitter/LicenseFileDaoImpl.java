package com.kh.petmily.repository.petsitter;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.petmily.entity.LicenseFileDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class LicenseFileDaoImpl implements LicenseFileDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void uploadLicense(int no, MultipartFile license_file) throws IllegalStateException, IOException {
		LicenseFileDto licenseFileDto = LicenseFileDto.builder()
										.license_sitter_no(no)//파일 올린 시터 번호
										.uploadname(license_file.getOriginalFilename())//업로드한 이름
										.savename(UUID.randomUUID().toString())//저장된 이름
										.filetype(license_file.getContentType())//파일 유형
										.filesize(license_file.getSize())//파일 크기
										.build();
		
		log.info("파일 내용={}",licenseFileDto.toString());
		
		//폴더 생성
		File dir = new File("D:/upload/license");
		
									//파일명 -> 시퀀스로 변경할 것!!
		File target = new File(dir,UUID.randomUUID().toString());
		dir.mkdirs();//디렉터리 생성
		
		license_file.transferTo(target);//파일 저장
		
		sqlSession.insert("petsitter.registLicense", licenseFileDto);
	}

}
