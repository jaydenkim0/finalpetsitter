package com.kh.petmily.service.petsitter;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface PetsitterFileService {
	//자격증,신분증,통장사본,소개 이미지 등록
	void uploadLicense(int no, MultipartFile license_file)throws IllegalStateException, IOException;
	void uploadId(int no, MultipartFile id_card_file)throws IllegalStateException, IOException;
	void uploadBank(int no, MultipartFile bank_image)throws IllegalStateException, IOException;
	void uploadInfo(int no, List<MultipartFile> info_image)throws IllegalStateException, IOException;
	
	//통장 사본 이미지 삭제
	void deleteBankImage(int pet_sitter_no);
}
