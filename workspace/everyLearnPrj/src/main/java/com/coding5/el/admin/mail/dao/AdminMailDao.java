package com.coding5.el.admin.mail.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.common.page.PageVo;
import com.coding5.el.email.vo.MailVo;
import com.coding5.el.common.vo.AttachVo;

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
	
	// 메일 상세
	public MailVo selectOneMail(SqlSessionTemplate sst, String no);
	
	// 메일 어테치
	public List<AttachVo> selectAttachList(SqlSessionTemplate sst, String no);
	
	// 학생회원 메일 리스트 가져오기
	public List<MailVo> selectStudentMailList(SqlSessionTemplate sst);
	
	// 강사회원 메일 리스트 가져오기
	public List<MailVo> selectTeacherMailList(SqlSessionTemplate sst);
	
	// 기업회원 메일 리스트 가져오기
	public List<MailVo> selectCorpMailList(SqlSessionTemplate sst);
	
	// 메일 리스트들 인서트
	public int insertMailList(SqlSessionTemplate sst, List<MailVo> mailList);
	
	// 메일 pk 가져오기
	public List<AttachVo> selectMailPk(SqlSessionTemplate sst, MailVo mailVo);


	
}
