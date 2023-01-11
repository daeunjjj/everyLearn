package com.coding5.el.corp.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.coding5.el.common.randomNum.RandomNumber;
import com.coding5.el.corp.dao.CorpMailDao;
import com.coding5.el.corp.vo.CorpVo;
import com.coding5.el.email.service.EmailServiceImpl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Service
@Slf4j
public class CorpMailServiceImpl implements CorpMailService {

	@Autowired
	private final JavaMailSender javaMailSender;

	@Autowired
	private CorpMailDao dao;

	@Autowired
	private SqlSessionTemplate sst;

	@Autowired
	private BCryptPasswordEncoder enc;

	// 비밀번호 변경
	@Override
	public int mailService(CorpVo vo) {

		MimeMessage mimeMessage = javaMailSender.createMimeMessage();

		String num = RandomNumber.randomNumber();
		String encNum = enc.encode(num);
		String url = "127.0.0.1:8888/el/corp/authentication?num=" + encNum;

		try {
			// 첨부파일 true
			MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, false, "UTF-8");

			mimeMessageHelper.setSubject("[비밀번호 재설정] 에브리런입니다.");
			mimeMessageHelper.setText("안녕하세요 비밀번호 재설정 링크는" + url + "입니다.");
			mimeMessageHelper.setTo(vo.getId());
			mimeMessageHelper.setFrom("everylearn352@gmail.com");

			vo.setAuthentication(encNum);
			int result = dao.updateCertNum(sst, vo);
			
			if(result == 1) {
				javaMailSender.send(mimeMessage);
				log.info("메일 전송 완료");
				
				return 1;
			}else {
				return 0;
			}

		} catch (MessagingException e) {
			e.printStackTrace();
			log.info("메일 전송 실패");
			return 0;
		}

	}

}
