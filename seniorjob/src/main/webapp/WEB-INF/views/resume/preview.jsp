<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<%-- <jsp:include page="mypage.jsp" /> --%>
<html class="no-js"> <!--<![endif]-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	window.onload = function(){
		/* 이미지 미리보기 */
		var img = document.createElement("img");
		img.setAttribute("src", opener.document.getElementById('image_container').childNodes[1].src);
		document.querySelector("div#image_container").appendChild(img);
		/* 필수기입 항목 */
		document.getElementById('resume_name').value = opener.document.getElementById('resume_name').value;
		document.getElementById('resume_birth').value = opener.document.getElementById('resume_birth').value;
		document.getElementById('resume_phone').value = opener.document.getElementById('resume_phone').value;
		document.getElementById('resume_email').value = opener.document.getElementById('resume_email').value;
		document.getElementById('resume_address').value = opener.document.getElementById('resume_address').value;
		document.getElementById('resume_school').value = opener.document.getElementById('resume_school').value;
		document.getElementById('resume_area').value = opener.document.getElementById('resume_area').value;
		document.getElementById('resume_start').value = opener.document.getElementById('resume_start').value;
		document.getElementById('resume_end').value = opener.document.getElementById('resume_end').value;
		document.getElementById('resume_end').value = opener.document.getElementById('resume_end').value;
		document.getElementById('resume_title').value = opener.document.getElementById('resume_title').value;
		};
		

</script>
<!-- 이미지 미리보기 스타일 적용 -->
<style>
	.select_img img{width: 90px; height:90px; margin:20px 0;}
</style>
<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>GARO ESTATE | Home page</title>
        <meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

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

        <!-- property area -->
        <div class="content-area recent-property padding-top-40" style="background-color: #FFF;">
            <div class="container">  
                <div class="row" align="center">
                    <div class="row">
                    <div class="col-md-9 pr-30 padding-top-40 properties-page user-properties" align="center"> 
                        <div class="" id="contact1">                        
                            <!-- /.row -->
                            <div align="center"><h2>미리보기</h2></div>
                            <hr>
                            <form>
                                <div class="row" align="center">
                                	<div class="col-sm-12">
										<div class="form-group">
											<label>이력서 제목</label> 
											<input type="text" class="form-control" name="resume_title" id="resume_title">
										</div>
									</div>
                           		    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="firstname">사진</label>
                                            <div id="image_container" name="image_container" class="select_img"></div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="firstname">이름</label>
                                            <input type="text" class="form-control" id="resume_name" name="resume_name">
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="lastname">생년월일</label>
                                            <input type="text" class="form-control" id="resume_birth" name="resume_birth">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="email">Email</label>
                                            <input type="text" class="form-control" id="resume_email" name="resume_email">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="subject">휴대폰 번호</label>
                                            <input type="text" class="form-control" id="resume_phone" name="resume_phone">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="subject">주소</label>
                                            <input type="text" class="form-control" id="resume_address" name="resume_address">
                                        </div>
                                    </div>
									<br><br><br><br><br><br><br><br><br><br><br>
                                    <h3>학력사항</h3>

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="subject">학교명</label>
                                            <input type="text" class="form-control" id="resume_school" name="resume_school">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="subject">지역</label>
                                            <input type="text" class="form-control" id="resume_area" name="resume_area">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="subject">입학일</label>
                                            <input type="date" class="form-control" id="resume_start" name="resume_start">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="subject">졸업일</label>
                                            <input type="date" class="form-control" id="resume_end" name="resume_end">
                                        </div>
                                    </div>
                                </div>
                                <!-- /.row -->
                            </form>
                        </div>
                    </div>    
                </div>
            </div>
        </div>

        </div>
		<script src="resources/assets/js/modernizr-2.6.2.min.js"></script>
        <script src="resources/assets/js/jquery-1.10.2.min.js"></script> 
        <script src="resources/bootstrap/js/bootstrap.min.js"></script>
        <script src="resources/assets/js/bootstrap-select.min.js"></script>
        <script src="resources/assets/js/bootstrap-hover-dropdown.js"></script>
        <script src="resources/assets/js/easypiechart.min.js"></script>
        <script src="resources/assets/js/jquery.easypiechart.min.js"></script>
        <script src="resources/assets/js/owl.carousel.min.js"></script>
        <script src="resources/assets/js/wow.js"></script>
        <script src="resources/assets/js/icheck.min.js"></script>
        <script src="resources/assets/js/price-range.js"></script>
        <script src="resources/assets/js/main.js"></script>
    </body>
</html>
