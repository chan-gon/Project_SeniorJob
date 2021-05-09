package com.company.service_center.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {

	@RequestMapping(value = "/error")
	public String error404() {
		return  "error";
	}

}
