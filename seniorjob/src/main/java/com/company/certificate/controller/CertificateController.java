package com.company.certificate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CertificateController {

	@RequestMapping("/certi")
	public String certi() {
		return "resume/certi";	   		  // 자격증 
	}
}
