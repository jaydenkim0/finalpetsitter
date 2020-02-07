package com.kh.petmily.repository.petsitter;

import java.util.List;

import com.kh.petmily.entity.LicenseFileDto;

public interface LicenseFileDao {
	void upload(List<LicenseFileDto>license_file);
}
