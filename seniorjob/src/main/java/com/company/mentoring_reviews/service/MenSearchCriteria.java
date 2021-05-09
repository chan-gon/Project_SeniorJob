package com.company.mentoring_reviews.service;

public class MenSearchCriteria extends MenCriteria{

	private String searchType = "";
	private String keyword = "";
	 
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "MenSearchCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
}