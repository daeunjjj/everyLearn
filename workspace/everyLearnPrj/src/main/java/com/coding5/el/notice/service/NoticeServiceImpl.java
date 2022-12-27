package com.coding5.el.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding5.el.notice.dao.NoticeDao;
import com.coding5.el.notice.vo.NoticeVo;
import com.coding5.el.notice.vo.PageVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired private NoticeDao noticeDao;
	
	//글쓰기
	@Override
	public int write(NoticeVo vo) throws Exception {
		return noticeDao.write(vo);
	}

	//공지 리스트
	@Override
	public List<NoticeVo> getNoticeList(PageVo pageVo) throws Exception {
		return noticeDao.getNoticeList(pageVo);
	}

	//공지 삭제
	@Override
	public int deleteNotice(String str) throws Exception {
		String[] delArr = str.split(",");
		return noticeDao.deleteNotice(delArr);
	}
	
	//공지 수정
	@Override
	public int editNotice(NoticeVo vo) throws Exception {
		return noticeDao.editNotice(vo);
	}

	//공지 갯수
	@Override
	public int getNoticeCnt() throws Exception {
		return noticeDao.getNoticeCnt();
	}

	//공지 상세 조회
	@Override
	public NoticeVo selectDetail(String no) throws Exception {
		//log.info(no);
		return noticeDao.selectDetail(no);
	}


	

}
