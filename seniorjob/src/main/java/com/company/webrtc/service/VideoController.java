package com.company.webrtc.service;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class VideoController {

	@RequestMapping("/video")
	public String video() {
		return "webrtc/video";
	}
}
