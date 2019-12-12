package com.bu.bumoim.dao.logic;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bu.bumoim.dao.FindDao;

@Repository
public class FindDaoLogic implements FindDao{

	@Autowired
	private SqlSession sqlSession;
	
	//select email
	public HashMap<String, String> findEmail(){
		return null;
	}
	
	//select Id
	//selectOne(mybatis namespace.id , 담을 곳)
	public Map<String, Object> findId(Map<String, Object> requestMap){
		return sqlSession.selectOne("findid.selectFindId", requestMap);
	}
}
