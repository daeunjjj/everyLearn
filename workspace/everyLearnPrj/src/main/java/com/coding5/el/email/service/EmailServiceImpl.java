package com.coding5.el.email.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartFile;

import com.coding5.el.email.vo.MailVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Service
@Slf4j
public class EmailServiceImpl implements EmailService{
	
	@Autowired
	private final JavaMailSender javaMailSender;
	
	private final String title = "[에브리런]임시 비밀번호 안내 이메일입니다.";
	private final String message = "안녕하세요. 에브리런 임시 비빌번호 안내 메일입니다."
									+"\n"+"회원님의 임시 비밀번호는 아래와 같습니다. 로그인 후 반드시 비밀번호를 변경해주세요."+"\n";
	
	private final String fromAddress = "everlearn352@gmail.com";
	
	// 메일 생성
	@Override
	public MailVo createMail(String email, String tempPwd) {
        
		MailVo mailVo = MailVo.builder()
                .toAddress(email)
                .title(title)
                .content(message + tempPwd)
                .fromAddress(fromAddress)
                .build();

        log.info("메일 생성 완료");
        return mailVo;
	}
	
	// 이메일 전송
	@Override
	public boolean mailSender(MailVo vo) {
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		try {	
																				// 첨부파일 true
			MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8"); 
			
			mimeMessageHelper.setSubject(vo.getTitle());
			mimeMessageHelper.setText(vo.getContent());
			mimeMessageHelper.setTo(vo.getToAddress());
			mimeMessageHelper.setFrom(vo.getFromAddress());
            
			// 첨부파일 확인
			if(!CollectionUtils.isEmpty(vo.getMultipartFile())) {
                for(MultipartFile multipartFile: vo.getMultipartFile()) {
                    mimeMessageHelper.addAttachment(multipartFile.getOriginalFilename(), multipartFile);
                }
            }

            javaMailSender.send(mimeMessage);
            log.info("메일 전송 완료");
            return true;
		
		} catch (MessagingException e) {
			e.printStackTrace();
			log.info("메일 전송 실패");
			return false;
		}

		
	}

}
