<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>GARO ESTATE | Home page</title>
        <meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>GARO ESTATE | Home page</title>
<meta name="description" content="GARO is a real-estate template">
<meta name="author" content="Kimarotec">
<meta name="keyword"
	content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800'
	rel='stylesheet' type='text/css'>

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">

        <link rel="stylesheet" href="resources/assets/css/normalize.css">
        <link rel="stylesheet" href="resources/assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="resources/assets/css/fontello.css">
        <link href="resources/assets/fonts/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet">
        <link href="resources/assets/fonts/icon-7-stroke/css/helper.css" rel="stylesheet">
        <link href="resources/assets/css/animate.css" rel="stylesheet" media="screen">
        <link rel="stylesheet" href="resources/assets/css/bootstrap-select.min.css"> 
        <link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/assets/css/icheck.min_all.css">
        <link rel="stylesheet" href="resources/assets/css/price-range.css">
        <link rel="stylesheet" href="resources/assets/css/owl.carousel.css">  
        <link rel="stylesheet" href="resources/assets/css/owl.theme.css">
        <link rel="stylesheet" href="resources/assets/css/owl.transitions.css">
        <link rel="stylesheet" href="resources/assets/css/style.css">
        <link rel="stylesheet" href="resources/assets/css/responsive.css">
  
    </head>
    <body>
<link rel="stylesheet" href="resources/assets/css/normalize.css">
<link rel="stylesheet" href="resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/assets/css/fontello.css">
<link
	href="resources/assets/fonts/icon-7-stroke/css/pe-icon-7-stroke.css"
	rel="stylesheet">
<link href="resources/assets/fonts/icon-7-stroke/css/helper.css"
	rel="stylesheet">
<link href="resources/assets/css/animate.css" rel="stylesheet"
	media="screen">
<link rel="stylesheet"
	href="resources/assets/css/bootstrap-select.min.css">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/assets/css/icheck.min_all.css">
<link rel="stylesheet" href="resources/assets/css/price-range.css">
<link rel="stylesheet" href="resources/assets/css/owl.carousel.css">
<link rel="stylesheet" href="resources/assets/css/owl.theme.css">
<link rel="stylesheet" href="resources/assets/css/owl.transitions.css">
<link rel="stylesheet" href="resources/assets/css/style.css">
<link rel="stylesheet" href="resources/assets/css/responsive.css">
<!--summernote  -->

<link rel="stylesheet" href="/css/summernote/summernote-lite.css">
<!--summernote  -->
<style>
.col-md-2.col-md-offset-5.col-sm-3.col-sm-offset-1.col-xs-12.topHeader {
    right: -409px;
}
li#li22 {
    width: 470px;
}
ul.list-inline.topHeader {
    height: 51px;
}
li#topHeaderLi {
    bottom: -18px;
}
div#btnNav {
    padding-top: 18px;
}
.proerty-th .proerty-item .item-entry h5 {
    text-transform: uppercase;
    font-weight: 600;
    color: #9B9B9B;
    letter-spacing: 2px;
    position: initial;
}
</style>
</head>
<body>

	<div id="preloader">
		<div id="status">&nbsp;</div>
	</div>
	<!-- Body content -->

	<div class="header-connect">
		<div class="container">
			<div class="row topHeader">
				<div
					class="col-md-2 col-md-offset-5  col-sm-3 col-sm-offset-1  col-xs-12 topHeader">
					<div class="header-half header-social">
						<ul class="list-inline topHeader">
							<c:choose>
								<c:when test="${users.auth eq 'ADMIN'}">
									<li  id="li22">
									<a href="#">${sessionScope.users.id} 관리자</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="userList">관리자 페이지</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="logout">로그아웃</a></li>
								</c:when>
								<c:when test="${users.auth eq 'USER'}">
									<li id="li22"><a href="#">${sessionScope.users.id}님
											환영합니다</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="logout">로그아웃</a></li><li></li>
								</c:when>
								<c:when test="${not empty userInfo}">
									<li id="li22"><a href="#">${sessionScope.userInfo.kakaoId}님
											환영합니다</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="logout">로그아웃</a></li>
								</c:when>
								<c:when test="${users.auth eq 'MENTOR'}">
									<li id="li22"><a href="#">${sessionScope.users.id}님
											환영합니다</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="logout">로그아웃</a></li>
								</c:when>
								<c:when test="${users.auth eq null}">
									<li id="li22"><a href="#">SeniorJob 사이트 방문을 환영합니다.</a></li>
								</c:when>
							</c:choose>
						</ul>


					</div>
				</div>
			</div>
		</div>
	</div>
	<!--End top header -->

	<nav class="navbar navbar-default ">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navigation">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="getMain"><img
					src="resources/assets/img/logo.png" width="200px" height="70px"
					alt="클릭 시 메인페이지로 이동"></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse yamm" id="navigation">


				<c:if test="${users.auth eq null and empty userInfo}">
					<div class="button navbar-right" id="btnNav">
						<button class="navbar-btn nav-button wow bounceInRight login"
							style="height: 50px; width: 130px"
							onclick="location.href='login'" data-wow-delay="0.45s">로그인</button>
						<button class="navbar-btn nav-button wow fadeInRight"
							style="height: 50px; width: 104px"
							onclick="location.href='insertUsers'" data-wow-delay="0.48s">회원가입</button>
					</div>
				</c:if>
				
				

				<ul class="main-nav nav navbar-nav navbar-right">
					<li id="topHeaderLi"class="wow fadeInDown" data-wow-delay="0.3s"
						style="width: 150px; height: 100px"><h4><a class=""
						href="getMentorList" style="text-align: center"><strong>멘토</strong></a></h4></li>
					<li id="topHeaderLi" class="wow fadeInDown" data-wow-delay="0.3s"
						style="width: 150px; height: 100px"><h4><a class=""
						href="getMentoringList" style="text-align: center"><strong>멘토링</strong></a></h4></li>
					<li  id="topHeaderLi"class="wow fadeInDown" data-wow-delay="0.3s"
						style="width: 150px; height: 100px"><h4><a class=""
						href="job?cd=11" style="text-align: center"><strong>정보공유</strong></a></h4></li>
					<li id="topHeaderLi" class="wow fadeInDown" data-wow-delay="0.3s"
						style="width: 150px; height: 100px"><h4><a class=""
						href="inquire" style="text-align: center"><strong>고객센터</strong></a></h4></li>
					<c:if test="${not empty users }">
						<li  id="topHeaderLi"class="wow fadeInDown" data-wow-delay="0.3s"
						style="width: 150px; height: 100px"><h4><a
							href="mypageHome"><strong>마이페이지</strong></a></h4></li>
					</c:if>
					<c:if test="${not empty userInfo }">
						<li  id="topHeaderLi"class="wow fadeInDown" data-wow-delay="0.3s"
						style="width: 150px; height: 100px"><h4><a
							href="mypageHome"><strong>마이페이지</strong></a></h4></li>
					</c:if>
					
					
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<!-- End of nav bar -->
</body>
</html>