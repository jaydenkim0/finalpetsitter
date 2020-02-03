package com.kh.petmily.service.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petmily.entity.FaqDto;
import com.kh.petmily.repository.FaqDao;

@Service
public class FaqServiceImpl implements FaqService {
	@Autowired
	private FaqDao faqDao;
	
	@Override
	public void write(FaqDto faqDto) throws Exception {
		faqDao.write(faqDto);
	}

}
