package com.coding5.el.admin.mail.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coding5.el.admin.mail.dao.AdminMailDao;
import com.coding5.el.common.page.PageVo;
import com.coding5.el.common.vo.AttachVo;
import com.coding5.el.email.vo.MailVo;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class AdminMailServiceImpl implements AdminMailService{
	@Autowired
	public AdminMailServiceImpl(AdminMailDao adminMailDao) {
		this.adminMailDao = adminMailDao;
	}	

	private final AdminMailDao adminMailDao;
	
	@Autowired
	private SqlSessionTemplate sst;
	
	Map<String, Object> map = new HashMap<>();

	/**
	 * 전송 메일 디비에 넣기
	 * 1. 메일 내용 성공하면
	 * 2. 첨부파일
	 */
	@Override
	@Transactional
	public int insertMail(MailVo vo, List<AttachVo> voList) {

		// 메일 내용 저장
		int emailResult = adminMailDao.insertEmailAndSelectPk(sst,vo);
		
		log.info("[메일 내용 인서트 피케이 받아오기] dao > 서비스 pk:::"+vo.getNo());
		
		
		int attachResult = 0;
		// 메일 저장 성공 & voList 널 아니면 어테치 디비에 넣어주기
		if(emailResult == 1 && voList != null) {
			// 어테치 넣어주려면 이메일 테이블 pk넘버 필요!
			for(int i = 0; i < voList.size(); i++) {
				log.info("서비스에서 테스트:::" + voList.get(i).getFileName());
				voList.get(i).setEmailNo(vo.getNo());
			}
	
			attachResult = adminMailDao.insertEmailAttach(sst,voList);
			log.info("어테치 넣기 성공? ::" + attachResult);
		}
		
		return emailResult + attachResult;
	}
	/**
	 * 메일
	 */
	@Override
	public int selectMailCount(Map<String, String> mapSearch) {
		return adminMailDao.selectMailCount(sst,mapSearch);
	}
	//메일 리스트들 찐
	@Override
	public List<MailVo> selectMailList(PageVo pv, Map<String, String> mapSearch) {
		return adminMailDao.selectMailList(sst,mapSearch,pv);
	}
	
	//메일 보낸내역 삭제
	@Override
	public int deleteSendMail(String[] arrNo) {
		return adminMailDao.deleteSendMail(sst, arrNo);
	}
	@Override
	public Map<String, Object> mailDetail(String no) {
		
		MailVo mailVo = adminMailDao.selectOneMail(sst,no);
		
		log.info("메일 상세 조회 서비스 - mailVo ::: "+mailVo);
		log.info("메일 상세 조회 서비스 - no ::: "+ no);
		List<AttachVo> attachList = null;
		//메일 어테치 있으면 가져오기
		if("Y".equals(mailVo.getFileYn())) {
			attachList = adminMailDao.selectAttachList(sst,no);
		}
		
		log.info("메일 상세 조회 서비스 - attachList ::: "+attachList);
		
		map.put("mailVo", mailVo);
		map.put("attachList", attachList);
		return map; 
	}
	
	// 전체 메일 발송
	@Override
	public int insertAllSendMail(MailVo mailVo, String fileName) {
		
		// 전체 메일 어떤 회원 유형인지 체크해 select해서 메일들 받아오기 
		List<MailVo> mailList = null;
		switch(mailVo.getToAddress()) {
		case "1" :
			mailList = adminMailDao.selectStudentMailList(sst);	 
		break;
		
		case "2" :
			mailList = adminMailDao.selectTeacherMailList(sst);
		break;
		
		case "3" :
			mailList = adminMailDao.selectCorpMailList(sst);
		break;
		
		}
		
		// 셀렉트 해온 메일리스트들 안에 컨트롤러에서 받아온 content, title넣어주기
		for(int i = 0; i < mailList.size(); i++) {
			mailList.get(i).setTitle(mailVo.getTitle());
			mailList.get(i).setContent(mailVo.getContent());
			mailList.get(i).setFileYn(mailVo.getFileYn());
			mailList.get(i).setFromAddress(mailVo.getFromAddress());
			mailList.get(i).setAdminNo(mailVo.getAdminNo());
		}
		log.info("메일들 셀렉트 해왔따~ ::: " + mailList);
		
		// 메일 리스트들 디비에 저장해주기
		int resultMail = adminMailDao.insertMailList(sst, mailList);
		
		int attachResult = 0;
		// 파일 있으면 실행
		if(mailVo.getFileYn().equals("Y")) {
			// 위에서 인서트한 메일리스트들 키 값 가져오기
			List<AttachVo> attachList = adminMailDao.selectMailPk(sst, mailVo);

			// attachList에 파일 이름 넣어주기
			int idx = 0;
			for(int i = 0; i < attachList.size(); i++) {
				attachList.get(i).setFileName(fileName);
			}
			
			attachResult = adminMailDao.insertEmailAttach(sst,attachList);
			log.info("어테치 넣기 성공? ::" + attachResult);
		}
		

		
		
		
		return resultMail + attachResult;
	}
	
	
}
