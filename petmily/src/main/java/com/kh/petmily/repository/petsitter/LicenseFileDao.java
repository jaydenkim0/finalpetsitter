package com.kh.petmily.repository.petsitter;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;


public interface LicenseFileDao {
	void uploadLicense(int no, MultipartFile license_file)throws IllegalStateException, IOException;
}
