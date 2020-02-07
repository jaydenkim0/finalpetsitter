package com.kh.petmily.repository.petsitter;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.petmily.entity.IdCardFileDto;
import com.kh.petmily.entity.LicenseFileDto;

@Repository
public class IdCardFileDaoImpl implements IdCardFileDao {
	
	@Autowired
	SqlSession sqlSession;
	
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
		File target = new File(dir,UUID.randomUUID().toString());
		dir.mkdirs();//디렉터리 생성
		
		id_card_file.transferTo(target);//파일 저장
		
		sqlSession.insert("petsitter.registIdCard", idCardFileDto);
		
	}

}
