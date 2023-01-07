package com.coding5.el.email.service;

import org.springframework.stereotype.Service;

import com.coding5.el.email.vo.MailVo;

public interface EmailService {
	// vo만들기
	public MailVo createMail(String email,String tempPwd);
	
	// 이메일 전송
	public boolean mailSender(MailVo vo);
}
