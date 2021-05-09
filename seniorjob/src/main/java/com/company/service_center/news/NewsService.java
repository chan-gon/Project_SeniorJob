package com.company.service_center.news;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

@Service
public class NewsService {
	 
	private static String clientID = "bf2C9lI_yasP9ruFQpN4";
	private static String clientSecret = "_8hDu9wHnj";
	
	
	public List<NewsVO> searchNews(String keyword, int display, int start){
		List<NewsVO> list= null;
		NewsVO b= null;
		URL url= null;
		
		try {
			url = new URL("https://openapi.naver.com/v1/search/news.xml?query="
					+ URLEncoder.encode(keyword, "UTF-8")
					+ (display != 0 ? "&display=" + display : "")
					+ (start != 0 ? "&start=" + start : ""));
			URLConnection urlConn = url.openConnection();
			urlConn.setRequestProperty("X-Naver-Client-Id", clientID);
			urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);
						
			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			XmlPullParser parser = factory.newPullParser();
						
			BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));
			String data = "";
			String msg = null;
						
			while ((msg = br.readLine()) != null)
				data += msg;
			parser.setInput(new StringReader(data));
			int eventType = parser.getEventType();
					

			while (eventType != XmlPullParser.END_DOCUMENT) {
							
			switch (eventType) {

				case XmlPullParser.START_DOCUMENT:
				list = new ArrayList<NewsVO>();
				break;
								
				case XmlPullParser.END_TAG:{
				String tag = parser.getName();

				if (tag.equals("item")) {
					list.add(b);
					b = null;
				}
				break;					
			}
				case XmlPullParser.START_TAG: {
					String tag = parser.getName();

					switch (tag) {
					
				    case "item":
				        b = new NewsVO();
					    break;

					case "title":
					    if (b != null)
					     	b.setTitle(parser.nextText());
						break;
										
					case "originallink":
						if (b != null)
							b.setOriginallink(parser.nextText());
						break;

					case "link":
					    if (b != null)
							b.setLink(parser.nextText());
						break;
										
					case "description":
						if (b != null)
							b.setDescription(parser.nextText());
						break;

					case "pubDate":
						if (b != null)
							b.setPubDate(parser.nextText());
						break;
					}

					break;

				}

				}
				eventType = parser.next();
				}
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (XmlPullParserException e) {
			e.printStackTrace();
		}
		
		return list;
		
	}

}
