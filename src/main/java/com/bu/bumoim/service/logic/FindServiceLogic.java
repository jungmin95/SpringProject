package com.bu.bumoim.service.logic;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bu.bumoim.dao.FindDao;
import com.bu.bumoim.service.FindService;

@Service
public class FindServiceLogic implements FindService{

	private Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private FindDao findDao;
	

}
