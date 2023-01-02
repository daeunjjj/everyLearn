package com.coding5.el.admin.report.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coding5.el.admin.report.dao.AdminReportDao;
import com.coding5.el.alert.vo.AlertVo;
import com.coding5.el.common.page.PageVo;
import com.coding5.el.report.vo.ReportVo;

import lombok.extern.slf4j.Slf4j;
@Service
@Slf4j
public class AdminReportServiceImpl implements AdminReportService{
	@Autowired
	public AdminReportServiceImpl(AdminReportDao adminReportDao) {
		this.adminReportDao = adminReportDao;
	}
	
	private final AdminReportDao adminReportDao;
	
	@Autowired
	private SqlSessionTemplate sst;
	
	Map<String, Object> map = new HashMap<String, Object>();
	// 신고 글 수 조회
	@Override
	public int selectReportCount(Map<String, String> mapSearch) {
		log.info("서비스 왔다");
		return adminReportDao.selectReportCount(sst, mapSearch);
	}
	// 신고 리스트 조회
	@Override
	public Map<String, Object> selectReportList(PageVo pv, Map<String, String> mapSearch) {
	 
		List<ReportVo> voList =	adminReportDao.selectReportList(sst, pv, mapSearch);
		
		int cnt = 0;
		if(voList != null) {
			cnt = adminReportDao.selectReportHandleN(sst);
		}
		
		map.put("voList", voList);
		map.put("cnt", cnt);
		
		return map;
	}
	// 신고 게시글 하나
	@Override
	public ReportVo selectReportOne(String no) {
		return adminReportDao.selectReportOneByNo(sst,no);
	}
	
	/*
	 * - 신고처리
	 * 신고테이블 업데이트
	 * 멤버테이블 업데이트
	 * 알림 인서트
	 */
	@Override
	@Transactional
	public int reportProcess(ReportVo reportVo, AlertVo alertVo) {
		// 신고처리
		int reportResult = adminReportDao.reportUpdate(sst,reportVo);
		
		// 멤버
		int memberResult = 0;
		if(reportResult == 1 && !"1".equals(reportVo.getMethod())) { 
			log.info("멤버 업댓인서트 통과~"+reportVo.getMethod());
			memberResult = adminReportDao.memberUpdate(sst,reportVo);
		}
		
		// 알림
		int alertResult = 0;
		if(reportResult + memberResult != 0 && alertVo != null) {
			log.info("알림인서트 통과~");
			alertResult = adminReportDao.insertAlert(sst,alertVo);
		} 
		
		return reportResult + reportResult + alertResult;
	}


}
