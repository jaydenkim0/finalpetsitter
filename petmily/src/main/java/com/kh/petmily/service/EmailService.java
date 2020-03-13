package com.kh.petmily.service;

import javax.mail.MessagingException;

public interface EmailService {
	void sendChangePasswordMail(String email, String id) throws MessagingException;
	String sendCertMessage(String email, String cert);
	//
	String sendWriteMessage(String email);

}