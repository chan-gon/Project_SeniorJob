package com.company.service_center;

public class SearchCriteria extends Criteria{

	private String searchType = "";
	private String keyword = "";
	private String optionValue;
	private String optionValue2;
	
	public String getOptionValue() {		//최신순 , 조회수순을 하기 위한 것
		return optionValue;
	}
	public void setOptionValue(String optionValue) {
		this.optionValue =optionValue;
	}
	public String getOptionValue2() {		//최신순 , 조회수순을 하기 위한 것
		return optionValue2;
	}
	public void setOptionValue2(String optionValue2) {
		this.optionValue2 =optionValue2;
	}
	  
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
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + ", optionValue=" + optionValue + ", optionValue2=" + optionValue2 + " ]";
	}
	
}