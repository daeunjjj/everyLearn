package com.coding5.el.admin.vo;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AdminVo {
	private String no;
	private String permission;
	private String position;
	private String id;
	private String pwd;
	private String nick;
	private String name;
	private String phone;
	private String enrollDate;
	private String modifyDate;
	private String quitYn;
	private String profileName;
	private MultipartFile profile;
	private String rawPwd;
	
	// 암호화
	public void encode(BCryptPasswordEncoder pwdEnc) {
		this.pwd = pwdEnc.encode(this.pwd);
	}
	
	// 탈퇴 -> 한글로
	public void quit(String quitYn) {
		
		if("N".equals(quitYn)) {
			this.quitYn = "유지";
		} else {
			this.quitYn = "탈퇴";
		}
		

	}
	
}
