package com.coding5.el.corp.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.coding5.el.corp.vo.CorpVo;

@Repository
public class CorpMailDaoImpl implements CorpMailDao {

	@Override
	public int updateCertNum(SqlSessionTemplate sst, CorpVo vo) {
		return sst.update("corpMapper.updateCertNum", vo);
	}

}
