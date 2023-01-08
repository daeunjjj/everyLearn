package com.coding5.el.admin.mail.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.common.page.PageVo;
import com.coding5.el.common.page.Pagination;
import com.coding5.el.email.vo.MailVo;
import com.coding5.el.emp.comm.vo.AttachVo;

import lombok.extern.slf4j.Slf4j;
@Repository
@Slf4j
public class AdminMailDaoImpl implements AdminMailDao{
	@Override
	public int insertEmailAndSelectPk(SqlSessionTemplate sst, MailVo vo) {
		// 메일 인서트하고 메일 넘버 가져오기
		return sst.insert("adminMapper.insertEmailAndSelectPk",vo);
	}

	@Override
	public int insertEmailAttach(SqlSessionTemplate sst, List<AttachVo> voList) {
		// 이메일 어테치 넣기
		return sst.insert("adminMapper.insertEmailAttach",voList);
	}

	@Override
	public int selectMailCount(SqlSessionTemplate sst, Map<String, String> mapSearch) {
		// 페이징을 위해 메일 개수 가져오기
		return sst.selectOne("adminMapper.selectMailCount",mapSearch);
	}

	@Override
	public List<MailVo> selectMailList(SqlSessionTemplate sst, Map<String, String> mapSearch, PageVo pvo) {
		// 메일 리스트 가져오기
		RowBounds rb = Pagination.getRowBounds(pvo);
		return sst.selectList("adminMapper.selectMailList",mapSearch,rb);
	}


}
