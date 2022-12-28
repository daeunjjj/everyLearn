package com.coding5.el.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.coding5.el.notice.vo.NoticeVo;
import com.coding5.el.notice.vo.PageVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class NoticeDaoImpl implements NoticeDao {

	

	@Override
	public int write(SqlSessionTemplate sst, NoticeVo vo) throws Exception {
		//공지 작성
		return sst.insert("noticeMapper.insertNotice", vo);
	}

	@Override
	public List<NoticeVo> getNoticeList(SqlSessionTemplate sst, PageVo pageVo) throws Exception {
		//공지 리스트
		return sst.selectList("noticeMapper.getNoticeList", pageVo);
	}

	@Override
	public int deleteNotice(SqlSessionTemplate sst, String[] delArr) throws Exception {
		//공지 삭제
		return sst.update("noticeMapper.deleteNotice", delArr);
	}

	@Override
	public int getNoticeCnt(SqlSessionTemplate sst) throws Exception {
		//공지 갯수
		return sst.selectOne("noticeMapper.getNoticeCnt");
	}

	@Override
	public int editNotice(SqlSessionTemplate sst, NoticeVo vo) throws Exception {
		//공지 수정
		return sst.update("noticeMapper.editNotice", vo);
	}

	@Override
	public NoticeVo selectDetail(SqlSessionTemplate sst, String no) throws Exception {
		// 공지 상세 조회
		//log.info(no);
		return sst.selectOne("noticeMapper.selectDetail", no);
	}

	@Override
	public int increaseHit(SqlSessionTemplate sst, String no) throws Exception {
		//조회수 +
		return sst.update("noticeMapper.increaseHit", no);
	}

	

	
	
	
}
