package com.company.api.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Common {
	
	//팝업 창 닫고 원래 페이지 새로 고침
	@RequestMapping("/throughCerti")
	public String throughCerti()
	{
		return "/users/throughCerti";
	}
	
	@RequestMapping("/throughSom")
	public String throughSom()
	{
		return "/users/throughSom";
	}
	
	
}
