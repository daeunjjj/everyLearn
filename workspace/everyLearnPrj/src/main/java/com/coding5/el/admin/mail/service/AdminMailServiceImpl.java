package com.coding5.el.admin.mail.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coding5.el.admin.mail.dao.AdminMailDao;
import com.coding5.el.common.page.PageVo;
import com.coding5.el.email.vo.MailVo;
import com.coding5.el.emp.comm.vo.AttachVo;

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
				voList.get(i).setNo(vo.getNo());
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
	
	
}
