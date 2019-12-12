package com.bu.bumoim.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bu.bumoim.domain.Gallery;
import com.bu.bumoim.domain.Member;
import com.bu.bumoim.service.UserService;

@Controller
public class UserController {
	//
	private Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private UserService userService;
	
	@Resource(name = "useruploadPath") // bean�쓽 id媛� uploadPath�씤 �깭洹몃�� 李몄“
	String useruploadPath;
	
	@RequestMapping(value="/joinView.do", method=RequestMethod.GET)
	public String joinView(Model model) {
		//
		return "user/join";
	}
	
	// ID以묐났泥댄겕
	@ResponseBody
	@RequestMapping(value="/idDuplicationCheck.do", method=RequestMethod.POST)
	public int idDuplicationCheck(HttpServletRequest request, Model model) {
		//
		String member_id = request.getParameter("member_id");
		Member member = userService.idDuplicationCheck(member_id);
		
		if(member != null) {
			logger.info("�븘�씠�뵒 以묐났 �궗�슜遺덇�");
			return 0;
		} else {
			logger.info("�븘�씠�뵒 �궗�슜媛��뒫");
			return 1;
		}
	}
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String join(Member member,HttpServletRequest req, Model model) {
		//
		
		member = fileUpload(req,member);
		logger.info(member.toString());
		
		int joinResult = userService.join(member);
		if (joinResult == 1) {
			logger.info("Join Success !!!");
		} else {
			logger.info("Join Fail !!!");
		}
		
		return "user/joinSuccess";
	}
	
	@RequestMapping(value="/login.do")
	public String login() {
		
		return "user/login";
	}
	
	
	@RequestMapping(value = "/login.do" , method = RequestMethod.POST)
	public String login(HttpSession session, HttpServletRequest request, Model model) {
		Map<String, Object> requestMap = new HashMap<String, Object>();
		requestMap.put("member_id", request.getParameter("member_id"));
		requestMap.put("member_pw", request.getParameter("member_pw"));
		int result = userService.login_action(requestMap);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(result == 1) {
			resultMap = userService.login(requestMap);
			request.getSession().setAttribute("loginMap", resultMap);
			resultMap.put("result", "success");
		}else {
			resultMap.put("result", "fail");
		}
		
		return "redirect:/index.do";
	}
	
	@RequestMapping(value = "logout.do", method= {RequestMethod.POST,RequestMethod.GET})
	public String logout(HttpSession session, Member member) {
	      
		session.invalidate();
		 
	      return "redirect:/index.do";
	   }

	@RequestMapping(value = "mypage.do")
		public String mypage(HttpSession session) {
		
		return "user/mypage";
	}
	
	@RequestMapping(value="userDelete.do", method=RequestMethod.GET)
	public String board_delete(HttpSession session, String member_id) {
		
		int deleteResult = userService.deleteMember(member_id);
	
		if (deleteResult == -1) {
			logger.info("**************************");
			logger.info("Delete : " + member_id);
			logger.info("**************************");
		} else {
			logger.info("**************************");
			logger.info("Delete Fail!!");
			logger.info("**************************");
		}
		session.invalidate();
		
	return "redirect:/index.do";
	}
	//파일업로드 
	
	public Member fileUpload(HttpServletRequest req, Member member) {
		try {
			MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req;
			Iterator iter = mhsr.getFileNames();
			MultipartFile uploadFile = null;

			// create directory
			File dir = new File(useruploadPath);
			if (!dir.isDirectory()) {
				dir.mkdirs();
			}
			while (iter.hasNext()) {
				String fieldName = (String) iter.next(); // 내용을 가져와서
				uploadFile = mhsr.getFile(fieldName);
				String origName;
				origName = new String(uploadFile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); // 한글꺠짐 방지

				// 파일명이 없다면
				if ("".equals(origName)) {
					continue;
				}

				// 파일 명 변경(uuid로 암호화)
				String ext = origName.substring(origName.lastIndexOf('.')); // 확장자
				String saveFileName = getUuid() + ext;

				// 설정한 path에 파일저장
				File serverFile = new File(useruploadPath + File.separator + saveFileName);
				uploadFile.transferTo(serverFile);
				logger.info("path: " + uploadFile);
				logger.info("fileName: " + uploadFile.getOriginalFilename());

				member.setFileName(saveFileName);
				
			
			}

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}

		
			return member;
	}

	private static String getUuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	
}
