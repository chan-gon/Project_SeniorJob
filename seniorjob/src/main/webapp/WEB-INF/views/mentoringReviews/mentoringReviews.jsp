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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
#mainCopy{
	font-size: 40px;
	padding:30px; 
	font-family:'Spoqa Han Sans'; 
	font-weight: 300;
}
h1{text-align:center}
#reviewTitle{
	margin-left:40px;
	border: 1px solid black;
	border-radius: 8px;
	padding: 10px;
}
.text-muted{
  -moz-transition: background, 0.5s;
  -o-transition: background, 0.5s;
  -webkit-transition: background, 0.5s;
  transition: background, 0.5s;
}
.text-muted:hover {
  background: #FDC600;
  cursor:pointer;
}
#reviewContent{
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  width: 160px;
  height: 20px;
}
</style>
<body>
<h1 class="display-4" id="mainCopy">멘토링 후기</h1>
<footer class="blockquote-footer" style="text-align:center">수강생들의 생생한 후기를 살펴보세요!</footer>
       <!-- 멘토링 후기 인기순위 -->
            <div class="container">  
                <div class="row">
                    <div class="col-md-8 col-md-offset-2"> 
                        <div class="" id="contact1">   
                        <h4 class="s-property-title">많이본 후기</h4>
					<div class="row" id="popArticles">
					</div>
				</div>
                    </div>    
                </div>
            </div>
       <!-- End of 멘토링 후기 인기순위 -->
       
	<!-- 메인 콘텐츠 -->
	<div class="properties-area recent-property" style="background-color: #FFF;">
		<div class="container">
			<div class="row">

			<jsp:include page="../Service_Center/sevice_left.jsp"></jsp:include>
				<div class="col-md-9 pr-30 padding-top-40 properties-page user-properties">
				<div class="section additional-details">
					<h4 class="s-property-title">전체 멘토링 후기</h4>
					<ul>
						<li>
							<span class="col-xs-6 col-sm-4 col-md-4 add-d-title">직무</span>
							<span class="col-xs-6 col-sm-4 col-md-2 add-d-title">제목</span>
							<span class="col-xs-6 col-sm-4 col-md-2 add-d-title">작성자</span>
							<span class="col-xs-6 col-sm-4 col-md-2 add-d-title">작성일자</span>
							<span class="col-xs-6 col-sm-4 col-md-2 add-d-title">조회수</span>
						</li>
						<c:forEach items= "${list }" var="rev">
							<span onclick="location.href='getSearchMenReview?seq=${rev.seq }'" class="col-xs-6 col-sm-4 col-md-4 add-d-entry">${rev.category_a }</span>
							<span onclick="location.href='getSearchMenReview?seq=${rev.seq }'" class="col-xs-6 col-sm-4 col-md-2 add-d-entry">${rev.title }</span>
							<span onclick="location.href='getSearchMenReview?seq=${rev.seq }'" class="col-xs-6 col-sm-4 col-md-2 add-d-entry">${rev.id }</span>
							<span onclick="location.href='getSearchMenReview?seq=${rev.seq }'" class="col-xs-6 col-sm-4 col-md-2 add-d-entry"><fmt:formatDate value="${rev.w_date }" pattern="yyyy-MM-dd"/></span>
							<span onclick="location.href='getSearchMenReview?seq=${rev.seq }'" class="col-xs-6 col-sm-4 col-md-2 add-d-entry">${rev.click }</span>
						</c:forEach>	
					</ul>
			</div>
			
			<div class="col-md-9 pr-50 padding-top-40 properties-page user-properties">		
			<div class="pagination">	
		 			<ul>
    					<c:if test="${pagingMaker.prev}">
    					<li><a href="mentoringReviews${pagingMaker.makeSearch(pagingMaker.startPage - 1)}">이전</a></li>
    					</c:if> 

    					<c:forEach begin="${pagingMaker.startPage}" end="${pagingMaker.endPage}" var="idx">
    					<li><a href="mentoringReviews${pagingMaker.makeSearch(idx)}">${idx}</a></li>
    					</c:forEach>
			
    					<c:if test="${pagingMaker.next && pagingMaker.endPage > 0}">
    					<li><a href="mentoringReviews${pagingMaker.makeSearch(pagingMaker.endPage + 1)}">다음</a></li>
    					</c:if> 
					  </ul>
			</div>
			</div>	
			
			<div class="col-md-12 pr-30 padding-top-40 properties-page user-properties">		
				<form role="form" method="get">
				<div class="search">			
					<br>
						</div>
					<div class="col-xs-2">
                         <div class="btn-group bootstrap-select show-tick form-control">
                         	 <div class="dropdown-menu open" style="max-height: 640.781px; overflow: hidden; min-height: 109px;"><ul class="dropdown-menu inner" role="menu" style="max-height: 629.781px; overflow-y: auto; min-height: 98px;"><li data-original-index="0" class=""><a tabindex="0" class="" style="" data-tokens="null"><span class="text"> -Status- </span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="1" class=""><a tabindex="0" class="" style="" data-tokens="null"><span class="text">Rent </span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="2" class="selected"><a tabindex="0" class="" style="" data-tokens="null"><span class="text">Boy</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="3"><a tabindex="0" class="" style="" data-tokens="null"><span class="text">used</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li></ul></div>
                         	 <select id="basic" name="searchType" class="selectpicker show-tick form-control" tabindex="-98">
                             <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>------</option>
						      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
						      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
						      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
						      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
                        </select></div>
                    </div>
                    <div class="col-xs-7">
					<div class="input-group">
                             <input class="form-control"  name="keyword" id="keywordInput" value="${scri.keyword}" style="text-align:center;  height:45px;" type="text" placeholder="내용 입력 ">
                             <span class="input-group-btn">
                    <button class="btn btn-primary subscribe" id="searchBtn" type="button"><i class="pe-7s-paper-plane pe-2x"></i></button>
                    <button class="btn btn-primary subscribe" id="searchBtn" type="button" onclick="location.href='insertMenReviews'" >등록</button>
                    <script>
			      $(function(){
			        $('#searchBtn').click(function() {
			          self.location = "mentoringReviews" + '${pagingMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
			        });
			      });   
			    </script>
                           </span>
                   </div>
                   </div>
                </form>
                </div>
                </div>
		</div>
		</div>
</div>
<!-- End of 메인 콘텐츠 -->	

<jsp:include page="../footer.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
	$(function(){
		getPopularArticleList();
	});
	
	function getPopularArticleList(){
		$.ajax({
			url: "getPopularArticleList",
			dataType: "json", 
			success:function(result){
				for(i=0; i<result.length; i++){
					var div = $('<div>').attr({'class':'col-sm-4', 'id':'mainDiv'}).text("#" + (i+1));
					var p1 = $('<p>').attr( {'class' : 'text-muted', 'id' : 'reviewTitle'} ).text("제목: " + result[i].title);
					var p2 = $('<p>').attr( 'class' , 'text-muted' ).text("조회수: " + result[i].click);
					var p3 = $('<p>').attr( {'class':'text-muted', 'id':'reviewContent' }).text((result[i].content));
					var input = $('<input>').attr({ 'type':'hidden', 'name':'seq', 'id':'seq', 'value':result[i].seq});
					p1.append(p2,p3, input);
					div.append(p1);
					$('#popArticles').append(div);
				}
			}
		});
		// 해당 글 클릭 시 상세 페이지 이동 이벤트
		$(document).on('click','#reviewTitle',function(){
			var param = $(this).find('#seq').val(); // 선택 객체 하위 요소 검색
			location.href = "getSearchMenReview?seq="+param;
		});
	}
	
</script>
</body>
</html>