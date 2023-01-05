package com.coding5.el.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.coding5.el.class_comm.vo.ClassCommVo;
import com.coding5.el.member.vo.ClassListVo;
import com.coding5.el.member.vo.MemberVo;


public interface MemberDao {

	public int insertMember(SqlSessionTemplate sst, MemberVo vo);
	
	public MemberVo selectMemberOne(SqlSessionTemplate sst, MemberVo vo);
	
	public String selectIdDup(SqlSessionTemplate sst, String memberId);

	public String selectNickDup(SqlSessionTemplate sst, String memberNick);

	public String idFindAjax(SqlSessionTemplate sst, MemberVo findVo);

	public int updateMember(SqlSessionTemplate sst, MemberVo vo);

	public List<ClassCommVo> selectCommWriteList(SqlSessionTemplate sst, String memberNo);

	public List<ClassListVo> selectClassReviewList(SqlSessionTemplate sst, String mNo);

}
