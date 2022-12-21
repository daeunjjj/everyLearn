package com.coding5.el.notice.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coding5.el.notice.dao.NoticeDaoImpl;
import com.coding5.el.notice.vo.NoticeVo;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired private NoticeDaoImpl dao;
	@Autowired private SqlSessionTemplate sst;
	
	//공지사항 작성
	@Transactional
	@Override
	public int write(NoticeVo vo) {
		
		int result1 = dao.write(sst, vo);
		int result2 = dao.updateCnt(sst);
		
		return dao.write(sst, vo);
	}

	//공지사항 목록
	@Override
	public List<NoticeVo> selectList() {
		return dao.selectList(sst);
	}


	
	

}
