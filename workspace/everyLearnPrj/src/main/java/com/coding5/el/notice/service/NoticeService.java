package com.coding5.el.notice.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coding5.el.notice.dao.NoticeDao;
import com.coding5.el.notice.vo.NoticeVo;

@Service
public class NoticeService {
	
	@Autowired private NoticeDao dao;
	@Autowired private SqlSessionTemplate sst;
	
	//공지사항 작성
	@Transactional
	public int write(NoticeVo vo) {
		
		int result1 = dao.write(sst, vo);
		int result2 = dao.updateCnt(sst);
		
		return dao.write(sst, vo);
	}
	

}
