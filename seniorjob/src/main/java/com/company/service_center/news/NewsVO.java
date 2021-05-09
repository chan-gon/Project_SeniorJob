package com.company.service_center.news;

import lombok.Data;

@Data
public class NewsVO {
	private String title;
	private String originallink;
	private String link;
	private String description;
	private String pubDate;
}
