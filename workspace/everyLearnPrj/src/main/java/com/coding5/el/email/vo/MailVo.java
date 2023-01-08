package com.coding5.el.email.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MailVo {
	private String no;
	private String adminNo;
	private String toAddress;
	private String fromAddress;
	private String tempPwd;
	private String title;
	private String content;
	private String name;
	private String enrollDate;
	private String fileYn;
	
	private List<MultipartFile> multipartFile;
	
	
}
