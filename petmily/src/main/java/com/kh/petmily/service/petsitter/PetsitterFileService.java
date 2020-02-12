package com.kh.petmily.service.petsitter;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface PetsitterFileService {
	void uploadLicense(int no, MultipartFile license_file)throws IllegalStateException, IOException;
	void uploadId(int no, MultipartFile id_card_file)throws IllegalStateException, IOException;
	void uploadBank(int no, MultipartFile bank_image)throws IllegalStateException, IOException;
	void uploadInfo(int no, List<MultipartFile> info_image)throws IllegalStateException, IOException;
}
