<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<jsp:include page="topHeader.jsp"></jsp:include>
<body>

	<!-- property area -->
	<div class="properties-area recent-property"
		style="background-color: #FFF;">
		<div class="container">
			<div class="row">

				<div class="section additional-details">
					<div align="left"><img src="resources/assets/image/arrows-small.png"></div>
					<h4 class="s-property-title">내 글 목록</h4>
					<a href="#step1" data-toggle="tab">게시글 보기</a>|<a href="#step2" data-toggle="tab">문의사항 보기</a>
						<div class="tab-content">
                           <div class="tab-pane" id="step1">
                              <ul>
								<li><span class="col-xs-6 col-sm-4 col-md-1 add-d-title">글번호</span>
									<span class="col-xs-6 col-sm-4 col-md-4 add-d-title">제목</span>
									<span class="col-xs-6 col-sm-4 col-md-1 add-d-title">작성자</span>
									<span class="col-xs-6 col-sm-4 col-md-1 add-d-title">작성일자</span>
									<span class="col-xs-6 col-sm-4 col-md-1 add-d-title">조회수</span>
								</li>
									<span class="col-xs-6 col-sm-8 col-md-1 add-d-entry">1</span>
									<span class="col-xs-6 col-sm-8 col-md-4 add-d-entry">ㅇㅇㅇ 멘토를 만나고 인생이 바뀌었습니다.</span>
									<span class="col-xs-6 col-sm-8 col-md-1 add-d-entry">kildong</span>
									<span class="col-xs-6 col-sm-8 col-md-1 add-d-entry">2021/03/03</span>
									<span class="col-xs-6 col-sm-8 col-md-1 add-d-entry">102</span>
								</ul>
                               </div>
                               
                             <div class="tab-pane" id="step2">
                              <ul>
									<li><span class="col-xs-6 col-sm-4 col-md-1 add-d-title">글번호</span>
										<span class="col-xs-6 col-sm-4 col-md-1 add-d-title">카테고리</span>
										<span class="col-xs-6 col-sm-4 col-md-3 add-d-title">제목</span>
										<span class="col-xs-6 col-sm-4 col-md-1 add-d-title">작성자</span>
										<span class="col-xs-6 col-sm-4 col-md-2 add-d-title">작성일자</span>
										<span class="col-xs-6 col-sm-4 col-md-1 add-d-title">조회수</span>
									</li>
										<span class="col-xs-6 col-sm-8 col-md-1 add-d-entry">1</span>
										<span class="col-xs-6 col-sm-8 col-md-1 add-d-entry">환불</span>
										<span class="col-xs-6 col-sm-8 col-md-3 add-d-entry">환불 신청했는데 입금 언제 되나요?</span>
										<span class="col-xs-6 col-sm-8 col-md-1 add-d-entry">홍길동</span>
										<span class="col-xs-6 col-sm-8 col-md-2 add-d-entry">2021/01/10</span>
										<span class="col-xs-6 col-sm-8 col-md-1 add-d-entry">2</span>
								</ul>
                              </div>
                            </div>
						
					
					
					

					<hr>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>