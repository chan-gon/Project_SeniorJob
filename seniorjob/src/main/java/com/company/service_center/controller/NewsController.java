package com.company.service_center.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.company.service_center.news.NewsService;

@Controller
public class NewsController {
	
	@Autowired
	NewsService newsService;
	
	@RequestMapping("seniorTimes")
	public ModelAndView newsList(@RequestParam(required = false)String keyword) {
		
		
		ModelAndView mav = new ModelAndView();
		if(keyword != null)
			mav.addObject("seniorTimes", newsService.searchNews(keyword, 10, 1));
		
		mav.setViewName("seniorTimes");
		return mav;
	}
	

}
