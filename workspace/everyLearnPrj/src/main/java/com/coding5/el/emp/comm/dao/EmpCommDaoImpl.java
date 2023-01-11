package com.coding5.el.emp.comm.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.common.page.Pagination;
import com.coding5.el.emp.comm.vo.EmpCommVo;
import com.coding5.el.emp.comm.vo.LikeVo;
import com.coding5.el.notice.vo.PageVo;

@Repository
public class EmpCommDaoImpl implements EmpCommDao {

	//커뮤 글쓰기
	@Override
	public int insertWrite(SqlSessionTemplate sst, EmpCommVo vo) throws Exception {
		return sst.insert("empCommMapper.insertWrite", vo);
	}

	//커뮤 글 갯수
	@Override
	public int getEmpCommCnt(SqlSessionTemplate sst) throws Exception {
		return sst.selectOne("empCommMapper.getEmpCommCnt");
	}

	//커뮤 리스트
	@Override
	public List<EmpCommVo> getEmpCommList(SqlSessionTemplate sst, PageVo pageVo) throws Exception {
		return sst.selectList("empCommMapper.getEmpCommList", pageVo);
	}

	//조회수+
	@Override
	public int increaseHit(SqlSessionTemplate sst, String no) throws Exception {
		return sst.update("empCommMapper.increaseHit", no);
	}

	//상세조회
	@Override
	public EmpCommVo selectDetail(SqlSessionTemplate sst, String no) throws Exception {
		return sst.selectOne("empCommMapper.selectDetail", no);
	}

	//글 수정하기
	@Override
	public int editEmpComm(SqlSessionTemplate sst, EmpCommVo vo) throws Exception {
		return sst.update("empCommMapper.editEmpComm", vo);
	}

	//글 삭제하기
	@Override
	public int deleteEmpComm(SqlSessionTemplate sst, String no) throws Exception {
		return sst.update("empCommMapper.deleteEmpComm", no);
	}

	@Override
	public LikeVo findHeart(SqlSessionTemplate sst, Map<String, String> number) throws Exception {
		System.out.println("dao ::: " + number);
		return sst.selectOne("empCommMapper.findHeart", number);
	}

	//좋아요가 DB에 있는지 확인
	@Override
	public LikeVo findHeart(SqlSessionTemplate sst, LikeVo heart) throws Exception {
		return sst.selectOne("empCommMapper.findHeart", heart);
	}

	//좋아요 정보(empCommLike에 게시글 번호, 회원 번호) 저장
	@Override
	public int insertHeart(SqlSessionTemplate sst, LikeVo heart) throws Exception {
		return sst.insert("empCommMapper.insertHeart", heart);
	}

	//좋아요 삭제
	@Override
	public void deleteHeart(SqlSessionTemplate sst, LikeVo heart) throws Exception {
		sst.delete("empCommMapper.deleteHeart", heart);
	}





}
