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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function loginCheck(){
		if(confirm("로그인 또는 회원가입이 필요한 항목입니다.")){
			location.href = "login"; // 로그인 페이지로 이동
		}
	}
	
    $(function(){
      $('#searchBtn').click(function() {
        self.location = "serviceCenterQna" + '?page=1&perPageNum=10' + "&searchType=" + "tc" + "&keyword=" + encodeURIComponent($('#keywordInput').val());
      });
    });   
</script>
<style>

.form-control {
    position: relative;
    z-index: 2;
    float: left;
    width: 100%;
    height: 44px;
}
.input-group {
    position: relative;
    display: table;
    border-collapse: separate;
    border: 0px solid grey;
    margin: 20px;
}
</style>
<body>

	<!-- property area -->
	<div class="properties-area recent-property"
		style="background-color: #FFF;">

		<div class="container">
			<div class="row">
				<br>
				<form>
					<div align="center">
						<h3><strong>무엇을 도와드릴까요?</strong></h3>
						<br><br>
					</div>
					<div class="input-group" align="center">
						<input class="form-control" name="keyword" id="keywordInput" value="${scri.keyword}"type="text" placeholder="궁금하신 사항을 입력해주세요" required="required">
						<span class="input-group-btn">
							<button class="btn btn-primary subscribe" id="searchBtn" type="button">검색</button>
						</span>
					</div>
					<br><br>
					<!-- /input-group -->
				</form>
						<div class="col-md-6 col-sm-6 col-xs-12">
					<div class="welcome_services wow fadeInRight" data-wow-delay="0.3s"
						data-wow-offset="100">
						
						<div class="row">
							<div class="col-xs-12 m-padding">
								<div class="welcome-estate">
									<div class="welcome-icon">
										<i class="pe-7s-home pe-4x"onclick="location.href='serviceCenter'"></i>
									</div>
									<h2><a href="serviceCenter">공지사항</a></h2>
								</div>
							</div>
							<br><br>
							<c:if test="${empty users }">
							<div class="welcome-estate">
							<br><br>
								<div class="welcome-icon">
									<i class="pe-7s-notebook pe-4x" onclick="loginCheck()"></i>
								</div>
								<h2 onclick="loginCheck()"><strong>문의하기</strong></h2>
								<h6>1:1 문의</h6>
							</div>
							</c:if>
							<c:if test="${not empty users }">
							<div class="welcome-estate">
							<br><br>
								<div class="welcome-icon">
									<i class="pe-7s-notebook pe-4x" onclick="location.href='insertInquireForm'"></i>
								</div>
								<h2 onclick="location.href='insertInquireForm'"><strong>문의하기</strong></h2>
								<h6>1:1 문의</h6>
							</div>
							</c:if>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-sm-6 col-xs-12">
				<div class="welcome_services wow fadeInRight" data-wow-delay="0.3s"
						data-wow-offset="100">
						
						<div class="row">
							<div class="col-xs-12 m-padding">
								<div class="welcome-estate">
									<div class="welcome-icon">
										<i class="pe-7s-home pe-4x" onclick="location.href='serviceCenterQna'"></i>
									</div>
									<h2><a href="serviceCenterQna">FAQ</a></h2>
									<h6></h6>
								</div>
							</div>
							<c:if test="${empty users }">
							<div class="welcome-estate">
								<div class="welcome-icon">
										<i class="pe-7s-help2 pe-4x" onclick="loginCheck()"></i>
									</div>
								<h2 onclick="loginCheck()">내문의목록</h2>
								<h6></h6>
							</div>
							</c:if>
							<c:if test="${not empty users }">
							<div class="welcome-estate">
								<div class="welcome-icon" >
										<i class="pe-7s-help2 pe-4x" onclick="location.href='userInquireList'"></i>
									</div>
								<h2 onclick="location.href='userInquireList'"><strong>내문의목록</strong></h2>
								<h6></h6>
							</div>
							</c:if>
							
						</div>
				</div>
		</div>
		<div class="col-md-12 col-sm-6 col-xs-12">
		<br><br><br><br><br><br><br><br><br>
		</div>
						
						
	</div>
	</div>
	</div>
  <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>