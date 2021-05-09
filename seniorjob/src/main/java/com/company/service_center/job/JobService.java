package com.company.service_center.job;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;
@Service
public class JobService {
	public List<JobVO> crawling(String cd) throws Exception{
		List<JobVO> list = null;
		String url = null;
		try {
			url = "https://job.incruit.com/jobdb_list/searchjob.asp?ct=3&ty=2&cd="
					+cd;
			Document doc = null;
			doc = Jsoup.connect(url).get();
			
			Elements element = doc.select("tbody tr");
			list = new ArrayList<JobVO>(); 
			int maxPage = 0;
			for(Element element1 : element) {
				JobVO vo = new JobVO();
				
				vo.setCompanyName(element1.select("a.strong").attr("title"));
				vo.setCompanyUrl(element1.select("div.subjects span.accent > a").attr("href"));
				vo.setIncruit(element1.select("span.accent a").attr("title"));
				try {
					vo.setIncruit2nd(element1.getElementsByClass("subjects").first().select("p").text());
				} catch (Exception e) {			}
				try {
					vo.setIncruit3nd(element1.getElementsByClass("subjects").last().select("p").text());
				} catch (Exception e) {	}
				try {
					vo.setIncruitDday(element1.select("div.ddays p:last-child").text());
				} catch (Exception e) {			}
				System.out.println("기업명 : "+vo.getCompanyName() );
				System.out.println("url : "+vo.getCompanyUrl());
				System.out.println("채용제목 : "+vo.getIncruit() );
				System.out.println("채용소제목 : "+vo.getIncruit2nd());
				System.out.println("근무조건 : "+vo.getIncruit3nd());
				System.out.println("마감일 : "+vo.getIncruitDday());
				if(maxPage == 50)
					break;
				
				list.add(vo);
				maxPage ++;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	return list;
	}
}
