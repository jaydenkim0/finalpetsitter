package com.kh.petmily.repository.petsitter;

import com.kh.petmily.entity.LicenseFileDto;


public interface LicenseFileDao {
	void uploadLicense(LicenseFileDto licenseFileDto);
}
