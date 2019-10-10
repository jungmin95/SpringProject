package com.bu.bumoim.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bu.bumoim.domain.Member;
import com.bu.bumoim.service.UserService;

@Controller
public class UserController {
	//
	private Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private UserService userService;
	//
	
	@RequestMapping(value="/joinView.do", method=RequestMethod.GET)
	public String joinView(Model model) {
		//
		return "user/join";
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String join(Member member, Model model) {
		//
		logger.info(member.toString());
		
		int joinResult = userService.join(member);
		if (joinResult == 1) {
			logger.info("Join Success !!!");
		} else {
			logger.info("Join Fail !!!");
		}
		
		return "user/joinSuccess";
	}
	
	@RequestMapping(value = "/login" , method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> login(HttpServletRequest request, Model model) {
		Map<String, Object> requestMap = new HashMap<String, Object>();
		requestMap.put("MEMBER_ID", request.getParameter("member_id"));
		requestMap.put("MEMBER_PW", request.getParameter("member_pw"));
		int result = userService.login_action(requestMap);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(result == 1) {
			resultMap = userService.login(requestMap);
			request.getSession().setAttribute("loginMap", resultMap);
			resultMap.put("result", "success");
		}else {
			logger.info("로그인실패");
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
}
