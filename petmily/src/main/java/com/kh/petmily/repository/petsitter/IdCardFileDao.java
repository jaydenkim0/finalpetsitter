package com.kh.petmily.repository.petsitter;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface IdCardFileDao {
	void uploadId(int no, MultipartFile id_card_file)throws IllegalStateException, IOException;
}
