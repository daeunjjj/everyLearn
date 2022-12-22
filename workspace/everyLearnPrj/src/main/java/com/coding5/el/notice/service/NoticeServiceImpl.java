package com.coding5.el.notice.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coding5.el.common.page.PageVo;
import com.coding5.el.notice.dao.NoticeDao;
import com.coding5.el.notice.vo.NoticeVo;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired private NoticeDao noticeDao;
	@Autowired private SqlSessionTemplate sst;
	
	//공지사항 작성
	@Override
	public int write(NoticeVo vo) {
		return noticeDao.write(sst, vo);
	}

	//공지사항 목록
	@Override
	public List<NoticeVo> selectList(PageVo pv) {
		return noticeDao.selectList(sst, pv);
	}
	
	//공지사항 페이지 카운트
	@Override
	public int selectListCount() {
		return noticeDao.selectListCount(sst);
	}

	//공지사항 디테일
	@Override
	public NoticeVo detail(int noticeNo) {
		return noticeDao.detail(sst, noticeNo);
	}


	
	

}
