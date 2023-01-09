package com.coding5.el.admin.mail.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.common.page.PageVo;
import com.coding5.el.email.vo.MailVo;
import com.coding5.el.emp.comm.vo.AttachVo;

public interface AdminMailDao {
	// 이메일 테이블에 내용 넣기 (어테치 x)
	public int insertEmailAndSelectPk(SqlSessionTemplate sst, MailVo vo);
	
	// 이메일 첨부파일 넣기
	public int insertEmailAttach(SqlSessionTemplate sst, List<AttachVo> voList);
	
	// 메일 내역 개수
	public int selectMailCount(SqlSessionTemplate sst, Map<String, String> mapSearch);
	
	// 메일 리스트
	public List<MailVo> selectMailList(SqlSessionTemplate sst, Map<String, String> mapSearch, PageVo pv);
	
	// 메일 보낸 내역 삭제
	public int deleteSendMail(SqlSessionTemplate sst, String[] arrNo);


	
}
