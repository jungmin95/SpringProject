package com.bu.bumoim.dao;

import java.util.HashMap;
import java.util.Map;

public interface FindDao {
	
	
//	public HashMap<String, String> findEmail(){
//		return null;
//	}
//	
//	//select Id
//	//selectOne(mybatis namespace.id , 담을 곳)
//	public Map<String, Object> findId(Map<String, Object> requestMap){
//		return sqlSession.selectOne("findid.selectFindId", requestMap);
//	}
	public HashMap<String, String> findEmail();
	
	public Map<String, Object> findId(Map<String, Object> requestMap);
}
