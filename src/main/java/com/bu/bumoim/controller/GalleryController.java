package com.bu.bumoim.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class GalleryController {

	private Logger logger = Logger.getLogger(getClass());

	@RequestMapping(value = "/gallery.do")
	public String gallery() {
		return "gallery/gallery";
	}

	@RequestMapping(value = "/galleryDetail.do")
	public String galleryDetail() {
		return "gallery/galleryDetail";
	}

	@RequestMapping(value = "/upload.do")
	public String upload() {
		return "gallery/upload";
	}

	@RequestMapping(value = "/fileUpload", method = RequestMethod.GET) 
	 public Map fileUpload(HttpServletRequest req, HttpServletResponse rep) { 
		//������ ����� path ����
		String path = "uploadPath"; 
		Map returnObject = new HashMap();
		try { 
			// MultipartHttpServletRequest ���� 
			MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req; 
			Iterator iter = mhsr.getFileNames();
			
			MultipartFile mfile = null; 
			String fieldName = ""; 
			List resultList = new ArrayList(); 
			
			// ���丮�� ���ٸ� ���� 
			File dir = new File(path); 
			if (!dir.isDirectory()) {
				dir.mkdirs(); 
			} 
			// ���� ���ö����� 
			while (iter.hasNext()) { 
				fieldName = (String) iter.next(); // ������ �����ͼ� 
				mfile = mhsr.getFile(fieldName); 
				String origName; 
				origName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); //�ѱۃ��� ���� 
				
				// ���ϸ��� ���ٸ� 
				if ("".equals(origName)) { continue; } 
				
				// ���� �� ����(uuid�� ��ȣȭ) 
				String ext = origName.substring(origName.lastIndexOf('.')); // Ȯ���� 
				String saveFileName = getUuid() + ext; 
				
				// ������ path�� �������� 
				File serverFile = new File(path + File.separator + saveFileName); 
				mfile.transferTo(serverFile); 
				logger.info("path: " + path);
				
				Map file = new HashMap(); 
				file.put("origName", origName);
				file.put("sfile", serverFile);
				resultList.add(file); 
			}
			returnObject.put("files", resultList); 
			returnObject.put("params", mhsr.getParameterMap()); 
			} catch (UnsupportedEncodingException e ) { 
				// TODO Auto-generated catch block 
				e.printStackTrace(); 
				}catch (IllegalStateException e) { 
					// TODO	Auto-generated catch block
					e.printStackTrace(); 
					} catch (IOException e) { // TODO Auto-generated catch block
						e.printStackTrace(); 
						} return null; 
			}

	// uuid����
	public static String getUuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

}


