package com.kh.petmily.repository;

import com.kh.petmily.entity.CertDto;

public interface CertDao {
	void regist(CertDto certDto);
	boolean check(String email, String cert);
	void delete(String email);
}