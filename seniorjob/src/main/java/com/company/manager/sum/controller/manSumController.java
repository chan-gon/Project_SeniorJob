package com.company.manager.sum.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.manager.sum.DateVO;

import com.company.manager.sum.service.impl.manSumMapper;



@Controller
public class manSumController {
	
	@Autowired manSumMapper mansummapper;
	
	
	//쇼핑 전체 조회
		@RequestMapping("/sumList")
		public String sumList(Model model, HttpServletRequest req, DateVO vo){
		SimpleDateFormat format = new SimpleDateFormat("yyyyMM"); //java date를 활용한 현재 날짜 구함

			if(vo.getSDate() != null) {
				System.out.println("not null");
				
			}else {
				
				//현재 년월
				Date time = new Date();		
				String jtime = format.format(time);
				
				//한달 후 날짜
				Calendar cal = Calendar.getInstance();
				cal.add(Calendar.MONTH, 1);		
				Date currentTime = cal.getTime();
				String releasetime = format.format(currentTime);
				
				vo.setSDate(jtime);
				vo.setEDate(releasetime);
			}
			
			model.addAttribute("sumList", mansummapper.sumList(vo));
			model.addAttribute("monsum", mansummapper.monsum(vo)); 
	
			return "/manager/sum";
		}
	

	//월별 매출 조회
	/*
	 * @RequestMapping("/monsum") public String monsum(Model model,
	 * HttpServletRequest req){
	 * 
	 * DateVO vo = new DateVO(); vo.setSDate(req.getParameter("sDate"));
	 * vo.setEDate(req.getParameter("eDate"));
	 * 
	 * if(req.getParameter("sDate") != null) { System.out.println("mon not null");
	 * }else { System.out.println("mon error"); }
	 * 
	 * model.addAttribute("monsum", mansummapper.monsum(vo));
	 * System.out.println("asdf:" + model.getAttribute("monsum")); return
	 * "/manager/sum"; }
	 */
	
	//월 포함 총 합계(chart)
	@RequestMapping("/summonth")
	@ResponseBody
	public List<Map<String, Object>> summonth(){
		
		return  mansummapper.summonth();
		
	}
	
		
		
	

}
