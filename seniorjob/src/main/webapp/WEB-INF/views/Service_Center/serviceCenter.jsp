<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<jsp:include page="../topHeader.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
 th {
    text-align: left;
    height: 40px;
    padding: 7px 5px;
    background: #f7f7f7;
    font-weight: 700;
}
.board-list-search {
    margin-top: 85px;
    padding: 60px;
    padding-bottom: 101px;
    border: 1px solid #e0e0e0;
    background-color: #fafafa;
}
select#items_per_page {
    width: 111px;
    /* padding-bottom: 5px; */
    margin-bottom: 16px;
    /* size: a3; */
    height: 40px;
    /* text-align: center; */
    text-align-last: center;
}
button.btn.dropdown-toggle.btn-default {
    width: 144px;
    /* margin-right: -5px; */
    padding-right: -1px;
    top: 0px;
    right: 43px;
    height: 47px;
    text-align-last: center;
    color: #000000;
}
input#keywordInput {
    width: 522px;
    height: 48px;
    text-align: center;
}
button#searchBtn {
    width: 89px;
    height: 48px;
}
div#img1 {
    bottom: 10px;
}
.input-group {
    position: relative;
    display: table;
    border-collapse: separate;
    border: 0px solid grey;
    margin: 20px;
        top: -19px;
    left: -18px;
}
</style>

<body>
	<!-- property area -->
	<div class="content-area recent-property" style="background-color: #FFF;">
		<div class="container">
			<div class="row">
			
				<jsp:include page="new_sevice_left.jsp"></jsp:include>
				
				<div
					class="col-md-1 pr-30 padding-top-40 properties-page user-properties">
				</div>
				<div id="optionVal"
					class="col-md-9 pr-30 padding-top-40 properties-page user-properties">
					<div class="col-md-3 pr-30" id="img1">
					<p><img src = "resources/assets/img/hojeong/123.png"/></p>
					</div>
					<h4><strong>시니어잡의 새로운 소식을 알려드립니다.</strong></h4>
					<div class="section additional-details board-list-search">
					<form role="form" method="get">
					<div class="col-xs-2">
							<div class="btn-group bootstrap-select show-tick form-control">
								
								<select id="basic" name="searchType"
									class="selectpicker show-tick form-control" tabindex="-98">
									<option value="t"
										<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
									<option value="c"
										<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
									<option value="w"
										<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
									<option value="tc"
										<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
								</select>
							</div>
					</div>
					<div class="col-xs-7">
							<div class="input-group">
								<input class="form-control" name="keyword" id="keywordInput"
									value="${scri.keyword}"
									
									type="text" placeholder="내용 입력 "> <span
									class="input-group-btn">
									<button class="btn btn-primary subscribe" id="searchBtn"
										type="button">
										<i class="pe-7s-paper-plane pe-2x"></i>
									</button>
									<script>
									$(function(){
										  $('#searchBtn').click(function() {
											  var seLocation = "serviceCenter" + '${pageMaker.makeQuery(1)}' 
										    				+ "&searchType=" + $("#basic option:selected").val() 
										    				+ "&keyword=" + encodeURIComponent($('#keywordInput').val())
										    				+ "&optionValue=" + getURLParams(location.search).optionValue;
											  console.log(seLocation);
											  self.location = seLocation;
										  });
										});   
									</script>
									
								</span>
							</div>
						</div>
						</form>	
					
					</div>
					
					<div class="section additional-details">

						<div class="items-per-page">
							<label for="items_per_page"></label>
							<div class="sel" style="float: right;">
								<select id="items_per_page" name="per_page"
									onchange="optionSelect(this)">
									<option value="">선택</option>
									<option value="최신순" id="select1">최신순</option>
									<option value="인기순" id="select2">조회수순</option>
								</select> <input type="hidden" id="sebubtn">
								
							</div>
							<br>
							<!--/ .sel-->
						</div>


						<table class="table">
							<tr>
								<th>유형</th>
								<th>제목</th>
								<th>등록일</th>
								<th>조회</th>
							</tr>
							<c:if test="${not empty list}">
							<c:forEach items="${list }" var="gongji">
								<tr>
									<td onclick="location.href='getService_Center?seq=${gongji.seq }'">${gongji.category_b }</td>
									<td onclick="location.href='getService_Center?seq=${gongji.seq }'">${gongji.title }</td>
									<td onclick="location.href='getService_Center?seq=${gongji.seq }'">
										<fmt:formatDate value="${gongji.w_date }" pattern="yyyy-MM-dd" /></td>
									<td onclick="location.href='getService_Center?seq=${gongji.seq }'">${gongji.click }</td>
								</tr>
							</c:forEach>
							</c:if>
						</table>
							<c:if test="${empty list}">
							<h3 style="text-align: center;"><strong>검색한 키워드에 맞는 게시글이 존재하지 않습니다.</strong></h3>
							</c:if>
					</div>
					


				<!--검색기능  -->
				<div
					class="col-md-10  properties-page user-properties">
				</div>
				<!--등록버튼  -->
				<div class="col-md-2  properties-page user-properties">
				</div>
				
				<div
						class="col-md-3  properties-page user-properties">
						</div>
					<!--페이징  -->
					<div
						class="col-md-6   properties-page user-properties">
						<div class="pagination" style="float: center">
							<ul>
								<c:if test="${pageMaker.prev}">
									<li><a
										href="serviceCenter${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}" var="idx">
									<li><a href="serviceCenter${pageMaker.makeSearch(idx)}">${idx}</a></li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="serviceCenter${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
								</c:if>
							</ul>
						</div>
					</div>

				<!--등록버튼  -->					
				<div class="col-md-3  properties-page user-properties">
				
				</div>	
					
					
				</div>


			</div>
		</div>
	</div>
<script>
//세부검색(최신순, 조회수순)
function optionSelect(obj){
	var param = 'optionValue='+$('#items_per_page').val();
	location.href='serviceCenter?'+(obj==""?"":param);
	
}
function getURLParams(url) {
    var result = {};
    url.replace(/[?&]{1}([^=&#]+)=([^&#]*)/g, function(s, k, v) { result[k] = decodeURIComponent(v); });
    return result;
}

 $(function(){
	if(getURLParams(location.search).optionValue == '최신순'){
		$('#select1').attr('selected','selected')
	}else if(getURLParams(location.search).optionValue == '인기순'){
		$('#select2').attr('selected','selected')
	}
}); 



</script>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>