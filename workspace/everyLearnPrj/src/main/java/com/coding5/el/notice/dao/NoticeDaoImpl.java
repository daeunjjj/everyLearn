package com.coding5.el.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.coding5.el.notice.vo.NoticeVo;
import com.coding5.el.notice.vo.PageVo;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired private SqlSessionTemplate sst;

	@Override
	public int write(NoticeVo vo) throws Exception {
		//공지 작성
		return sst.insert("noticeMapper.insertNotice", vo);
	}

	@Override
	public List<NoticeVo> getNoticeList(PageVo pageVo) throws Exception {
		//공지 리스트
		return sst.selectList("noticeMapper.getNoticeList", pageVo);
	}

	@Override
	public int deleteNotice(String[] delArr) throws Exception {
		//공지 삭제
		return sst.update("noticeMapper.deleteNotice", delArr);
	}

	@Override
	public int getNoticeCnt() throws Exception {
		//공지 갯수
		return sst.selectOne("noticeMapper.getNoticeCnt");
	}

	@Override
	public int editNotice(NoticeVo vo) throws Exception {
		//공지 수정
		return sst.update("noticeMapper.editNotice", vo);
	}

	@Override
	public NoticeVo selectDetail(int no) throws Exception {
		// 공지 상세 조회
		return sst.selectOne("noticeMapper.selectDetail", no);
	}

	
	
	
}
