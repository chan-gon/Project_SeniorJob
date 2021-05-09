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

				<div class="col-md-3 p0 padding-top-40">
					<div class="blog-asside-right pr0">
						<div class="panel panel-default sidebar-menu wow fadeInRight animated">
							<div class="panel-heading">
								<h3 class="panel-title">고객센터</h3>
							</div>
						</div>
						<hr>
						<div class="panel panel-default sidebar-menu wow fadeInRight animated">
							<div class="panel-heading">
								<h3 class="panel-title">결제/환불</h3>
							</div>
						</div>
						<div class="panel panel-default sidebar-menu wow fadeInRight animated">
							<div class="panel-heading">
								<h3 class="panel-title">신청/취소</h3>
							</div>
						</div>
						<div class="panel panel-default sidebar-menu wow fadeInRight animated">
							<div class="panel-heading">
								<h3 class="panel-title">화상면접 사용법</h3>
							</div>
						</div>
						<div class="panel panel-default sidebar-menu wow fadeInRight animated">
							<div class="panel-heading" onclick="location.href='inquireInsert'">
								<h3 class="panel-title">문의하기</h3>
							</div>
						</div>
						<div class="panel panel-default sidebar-menu wow fadeInRight animated">
							<div class="panel-heading">
								<h3 class="panel-title">문의목록</h3>
							</div>
						</div>
					</div>
				</div>
					
				<div class="section additional-details">

					<h4 class="s-property-title">문의사항</h4>
					

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
					<hr>
					<div class="col-sm-3" align="right">
						<select>
							<option value="">공지</option>
							<option value="">이벤트</option>
						</select>
						<button type="button">검색하기</button>
                        <input type="text" class="form-control" id="find" placeholder="검색할 내용을 입력하세요.">
                    </div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>