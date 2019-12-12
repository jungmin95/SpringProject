package com.bu.bumoim.dao.logic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bu.bumoim.dao.UserDao;
import com.bu.bumoim.domain.Member;


@Repository
public class UserDaoLogic implements UserDao {
	//
	@Autowired
	private SqlSession sqlSession;

	public int login_action(Map<String, Object> requestMap) {
		//
		return sqlSession.selectOne("login.loginActionCount", requestMap);
	}

	@Override
	public int join(Member member) {
		//		
		return sqlSession.insert("login.insertMember", member);
	}
	
	public Map<String, Object> login(Map<String, Object> requestMap) {
		return sqlSession.selectOne("login.loginAction", requestMap);
	}

	@Override
	public Member idDuplicationCheck(String member_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("idDuplicationCheck", member_id);
	}
	
	@Override 
	public int deleteMember(String member_id) {
		return sqlSession.delete("login.deleteMember", member_id);
	}

	@Override
	public List<Member> getMemberList(String member_id) {
		List<Member> member = sqlSession.selectList("getMemberList", member_id);
		return member;
	}
	
}
