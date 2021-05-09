<%@ page language="java" contentType="text/html; charset=UTF-8"
 	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>businessPlanInsert.jsp</title>
<meta name="description" content="company is a real-estate template">
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
<style>
element.style {
    transform: translateX(406px);
}
#nudge_wrap {
    width: 260px;
    position: fixed;
    top: 96px;
    left: 50%;
    margin-left: 370px;
}
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, input, textarea, p, blockquote, button {
    margin: 0;
    padding: 0;
    font-family: "Malgun Gothic",dotum,gulim,sans-serif;
}
user agent stylesheet
div {
    display: block;
}
html, body {
    width: 100%;
    height: 100%;
    -webkit-text-size-adjust: none;
}
html {
    color: #000;
    background: #fff;
}

element.style {
}
.box_change_order .list_change li .link_change .btn_check {
    display: inline-block;
    position: absolute;
    right: 0;
    padding: 0 0 0 12px;
    width: 62px;
    height: 30px;
    border: 1px solid #dfdfdf;
    border-radius: 15px;
    box-sizing: border-box;
    color: #222;
    font-size: 13px;
    font-weight: normal;
    letter-spacing: -1px;
    background-color: #fff;
}
.box_change_order .list_change li .link_change {
    display: block;
    position: relative;
    max-width: 240px;
    color: #222;
    line-height: 26px;
}
.box_change_order .list_change li a {
    color: #444;
}
a {
    color: #444;
    text-decoration: none;
}
user agent stylesheet
a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
}
.box_change_order .list_change li {
    padding: 7px 10px 0;
    color: #888;
    font-size: 16px;
    line-height: 26px;
}
ol, ul, li {
    list-style: none;
}
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, input, textarea, p, blockquote, button {
    margin: 0;
    padding: 0;
    font-family: "Malgun Gothic",dotum,gulim,sans-serif;
}
user agent stylesheet
li {
    text-align: -webkit-match-parent;
}
user agent stylesheet
ul {
    list-style-type: disc;
}
html, body {
    width: 100%;
    height: 100%;
    -webkit-text-size-adjust: none;
}
html {
    color: #000;
    background: #fff;
}
.box_change_order .list_change li .link_change .btn_check:after {
    display: inline-block;
    position: absolute;
    top: 9px;
    right: 11px;
    width: 9px;
    height: 9px;
    background: url(//www.saraminimage.co.kr/sri/person/resume/ico_check.png) no-repeat -7px -7px;
    content: "";
}
<!-- 이미지 미리보기 스타일 적용 -->
.select_img img{width: 90px; height:90px; margin:20px 0;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 저장하기(필수항목 기입) -->
<script>
	$(function(){
		$('#addForm').click(function(){
			var yn = true;
			$("#frm").find("input[name^=resume_]").each(function(index, item){
				if($(this).val().trim() == ''){
					alert($(this).attr("data-name") + "항목을 입력하세요.");
					$(this).focus();
					yn = false;
					return false;
				}
			});
			//필수항목 기입 후 insert
			if(yn){
				frm.action = "resumeInsert";
				frm.submit();
				return true;
				
				 
			}
		})
		
	})
</script>
<!-- 글자수세기 -->
<script>
	/* var total = 2000;
	function counter() {
		var check = document.frm.self_content.value.length;
		var cnt = 2000 - check;
		document.frm.cnt.value = cnt;
	} */
	
	$(document).ready(function(){
		$("textarea").keyup(function(){
			var inputLength = $(this).val().length;
			if(inputLength > 2000) {
				alert("입력 가능한 글자수를 초과 했습니다.");
			}
			var remain = 2000 - inputLength;
			$("h5").html(remain + "자까지 입력 가능합니다.");
		})
	})
</script>

<script>
	/* 이미지 미리보기 */
	function setImage(event) {
		var reader = new FileReader();
		reader.onload = function(event){
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container").append(img);
			/* 사진을 바꾸면 기존 이미지 삭제 후, 다시 append */
			if(img.src != img){
	 			$('#image_container').find('img').remove();
	 			document.querySelector("div#image_container").append(img);			
			}
		}
			reader.readAsDataURL(event.target.files[0]);
	}
</script>
<!-- 미리보기(preview) -->
<script>
	$(document).on("click", "#preview", function(){
		window.name = "resumeInsertForm";
		var openWin = window.open("preview",
                "미리보기", "width=900, height=900, resizable = no, scrollbars = no");
	})
	
	//자격증 불러오기
	 $(document).on("click", "#certiSearchSom", function(){
		window.name="parentForm"; //부모창 이름
		window.open("popCertiSeeResume",
                "자격증", "width=900, height=900, resizable = no, scrollbars = no"); 
	 })
</script>
<!-- 자기소개서 항목 추가 -->
<script>
	var self_number = 1;
	$(document).on("click", "#selfAdd" ,function addSelf(){
			var array = "<div class='col-sm-6'>"
				  + "<div class='form-group'>" 
				  + "<label>제목</label>"
				  + "<input type='text' class='form-control' id='self_name' name='slist["+ self_number +"].self_name' placeholder='자기소개서 제목'>"
				  + "</div>"
				  + "</div>"
				  + "<div class='col-sm-12'>" 
				  + "<div class='form-group'>" 
				  + "<label>내용</label>"
				  + "<textarea id='self_content' name='slist[" + self_number + "].self_content' class='form-control' placeholder='내용을 입력하세요.'></textarea>"
				  + "<h5>2000자까지 입력 가능합니다.</h5>"
				  + "</div>"
				  + "</div>"
				  + "<br><br><br><br><br><br>";
				  
				    $("div[id=step3]").append(array);
			    	self_number++;
	})	 
				 
<!-- 자격증 항목 추가+ -->
	var certi_number = 1;
	$(document).on("click", "#certiAdd", function(){
		var certi = "<div class='col-sm-12 som_certi_group'>"
				  + "<div class='form-group'>"
				  + "<label>항목&nbsp;</label>"
				  + "<input type='hidden' name='clist["+certi_number+"].certi_kind'>"
				  + "<select id='certi_kinds' name='clist["+certi_number+"].certi_kinds'>"
				  + "<option value='IT'>IT</option>"
				  + "<option value='세무/회계'>세무/회계</option>"
				  + "<option value='건축'>건축</option>"
				  + "<option value='농업'>농업</option>"
				  + "<option value='디자인'>디자인</option>"
				  + "<option value='보건/의료'>보건/의료</option>"
				  + "<option value='기계제작'>기계제작</option>"
				  + "<option value='전기'>전기</option>"
				  + "<option value='기타'>기타</option>"
				  + "</select>"
				  + "<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				  + "합격구분</label>"
				  + "<select name='clist["+certi_number+"].accept' id='accept>'"
				  + "<option value='1차합격'>1차합격</option>"
				  + "<option value='2차합격'>2차합격</option>"
				  + "<option value='필기합격'>필기합격</option>"
				  + "<option value='실기합격'>실기합격</option>"
				  + "<option value='최종합격'>최종합격</option>"
				  + "</select>"
				  + "</div>"
				  + "</div>"
				  + "<div class='col-sm-4'>"
				  + "<div class='form-group'>"
				  + "<label>취득일</label>"
				  + "<input type='date' class='form-control' id='certi_date' name='clist["+certi_number+"].certi_date'>"
				  + "</div>"
				  + "</div>"
				  + "<div class='col-sm-4'>"
				  + "<div class='form-group'>"
				  + "<label>자격증명</label>"
				  + "<input type='text' class='form-control' id='certi_name' name='clist["+certi_number+"].certi_name'>"
				  + "</div>"
				  + "</div>"
				  + "<div class='col-sm-4'>"
				  + "<div class='form-group'>"
				  + "<label>발행처/기관</label>"
				  + "<input type='text' class='form-control' id='certi_place' name='clist["+certi_number+"].certi_place'>"
				  + "</div>"
				  + "</div>";
				  
				  $("div[id=step1]").append(certi);
				  certi_number++;
	})
	
	
	/* 송다희 추가 */
	/* 내 정보 불러오기 */
	$(document).on("click", "#resume_in", function(){
		$("#resume_name").val('${user.name}');
		$("#resume_birth").val('${user.birth}')
		$("#resume_email").val('${user.email}')
		$("#resume_phone").val('${user.phonenum}')
		$("#resume_address").val('${user.address}')
	})
	/* 송다희 추가 */
	
</script>


</head>	
<body>
<div id="preloader">
		<div id="status">&nbsp;</div>
	</div>
	<form action="resumeInsert" method="post" id="frm" name="frm" encType="multipart/form-data" target="openWin">
	<div class="content-area recent-property padding-top-40" style="background-color: #FFF;">
		<div class="container">
			<div class="row">
				<input type="hidden" value=${ResumeVO.resume_no } id="resume_no" name="resume_no">
				<div class="col-md-8 col-md-offset-2" id="#">
					
					<div class="row" id="#">
					<hr>
					<h2>기본정보</h2>
					<br>
					<!-- 송다희 추가 -->
							<div align="right"><button type="button" class="btn btn-primary" id="resume_in" name="resume_in">내 정보 불러오기</button></div>
							<!-- 송다희 추가 -->
					
							<div class="col-sm-12">
								<div class="form-group">
									<label>이력서 제목</label>
									<input type="text" class="form-control" name="resume_title" id="resume_title" data-name="이력서 제목">
								</div>
							</div>
							
							
							<div class="col-sm-6">
								<div class="form-group">
									<label>사진</label>
									<input type="file" class="form-control" name="uploadFile" multiple="multiple" onchange="setImage(event)">
									<br />
									<div id="image_container" name="image_container" class="select_img">
									</div>
								</div>
							</div>
					
							
							<div class="col-sm-6">
								<div class="form-group">
									<label>이름</label> 
									<input type="text" class="form-control" id="resume_name" name="resume_name" data-name="이름">
								</div>
							</div>
							<div class="col-sm-6">
							</div>
							
							
							<div class="col-sm-6">
								<div class="form-group">
									<label>생년월일</label> 
									<input type="text" class="form-control" id="resume_birth" name="resume_birth" placeholder="생년월일 6자리를 기입하여 주세요." data-name="생일">
								</div>
							</div>
							
							<div class="col-sm-6">
							</div>
							
							<div class="col-sm-6">
								<div class="form-group">
									<label>Email</label> 
									<input type="email" class="form-control" id="resume_email" name="resume_email" data-name="이메일">
								</div>
							</div>
							
							<div class="col-sm-6">
							</div>
							
							<div class="col-sm-6">
								<div class="form-group">
									<label>휴대폰 번호</label> 
									<input type="text" class="form-control" id="resume_phone" name="resume_phone" data-name="핸드폰번호">
								</div>
							</div>
							
							<div class="col-sm-6">
							</div>
					
							
							<div class="col-sm-6">
								<div class="form-group">
									<label>주소</label> 
									<input type="text" class="form-control" id="resume_address" name="resume_address" data-name="주소">
								</div>
							</div>
					</div>		
							
							
					<div class="row" id="#">
					<br/>
					<hr />
					<h2>학력사항</h2>
					<br>	
					
					
					<div class="col-sm-6">
								<div class="form-group">
									<label>학교명</label> 
									<input type="text" class="form-control" id="resume_school" name="resume_school" data-name="학교">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label>전공</label> 
									<input type="text" class="form-control" id="resume_major" name="resume_major" data-name="전공">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label>지역</label> 
									<input type="text" class="form-control" id="resume_area" name="resume_area" data-name="지역">
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label>입학일</label> 
									<input type="date" class="form-control" id="resume_start" name="resume_start" data-name="입학일">
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label>졸업일</label> 
									<input type="date" class="form-control" id="resume_end" name="resume_end" data-name="졸업일">
								</div>
							</div>
							
					</div>
					
					<div class="row" id="#">
					<br/>
					<hr />
					
					
					<div class="tab-content som_certi_search">
								<div class="tab-pane" id="step1">
									<div class="col-sm-6" >
									<h2>자격증</h2>
									</div>
									<div class="col-sm-6" align="right">
                                        <a href="#step4" data-toggle="tab">
                                        <button type="button" class="btn btn-primary" id="certiAdd" name="clist[0].certiAdd">자격증 항목 추가+</button></a>
                                        <button type="button" class="btn btn-primary" id="certiSearchSom" name="certiSearchSom">자격증 불러오기</button></a>
                                    </div>
                                    <br/>
                                    <br/>
                                    <br/>
									<div class="col-sm-12 som_certi_group">
										<div class="form-group">
											<label for="firstname">항목&nbsp;</label>
											<select id = "certi_kinds" name = "clist[0].certi_kinds">
												<option value="IT">IT</option>
												<option value="세무/회계">세무/회계</option>
												<option value="건축">건축</option>
												<option value="농업">농업</option>
												<option value="디자인">디자인</option>
												<option value="보건/의료">보건/의료</option>
												<option value="기계제작">기계제작</option>
												<option value="전기">전기</option>
												<option value="기타">기타</option>
											</select>
											<label for="subject">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											합격구분</label>
											<select name="clist[0].accept" id="accept">
												<option value="1차합격">1차합격&nbsp;</option>
												<option value="2차합격">2차합격&nbsp;</option>
												<option value="필기합격">필기합격&nbsp;</option>
												<option value="실기합격">실기합격&nbsp;</option>
												<option value="최종합격">최종합격&nbsp;</option>
											</select>
										</div>
									</div>
									
									
									
									
									<div class="col-sm-4 ">
										<div class="form-group">
											<label for="subject">취득일</label> 
											<input type="date" class="form-control" id="certi_date" name="clist[0].certi_date">
										</div>
									</div>
									
									<div class="col-sm-4">
										<div class="form-group">
											<label for="lastname">자격증명</label> 
											<input type="text" class="form-control" id="certi_name" name="clist[0].certi_name">
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label for="email">발행처/기관</label> 
											<input type="text" class="form-control" id="certi_place" name="clist[0].certi_place">
										</div>
									</div>

									
									
								</div>
							</div>
					</div>
					
					<div class="row" id="#">
					
					
					
					<div class="tab-content">
					<br/>
					<hr />
								<div class="tab-pane" id="step2">
									<h3>포트폴리오</h3>
									<div class="col-sm-6">
										<div class="form-group">
										<br>
										<br>
											<input type="file" class="form-control" name="portFile" multiple="multiple">
										</div>
									</div>
								</div>
							</div>
					
					</div>
					
					
					<div class="row" id="#">
					<br/>
					<hr />
					<div class="tab-content">
									<div class="tab-pane" id="step3" name="step3">
										<h3>자기소개서</h3>
										<div class="col-sm-12" align="right">
	                                        <a href="#step4" data-toggle="tab">
	                                        <button type="button" class="btn btn-primary" id="selfAdd" name="selfAdd">자기소개서 항목 추가+</button></a>
	                                    </div>
										<div class="col-sm-6">
											<div class="form-group">
												<br />
												<label for="subject">제목</label> 
												<input type="text" class="form-control" id="self_name" name="slist[0].self_name" placeholder="자기소개서 제목">
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<label for="message">내용</label>
												<textarea id="self_content" name="slist[0].self_content" class="form-control" placeholder="내용을 입력하세요." cols="80"></textarea>  <!-- onkeyup="counter()" -->
												<h5>2000자까지 입력 가능합니다.</h5>
											</div>
										</div>
	                                    
										</div>
									</div> 
									<br><br><br><br><br><br>
								</div>
					
					
					</div>
					</div>
					</div>
					</div>
					
	<!-- 우측 사이드 -->
	<div id="nudge_wrap" style="transform: translateX(42px);">
		<div class="inner">
			<div id="order_list" class="box_change_order">
				<h4 class="title_tip">이력서 항목</h4>
				<ul class="list_change">
					<li><a href="#step1" data-toggle="tab" class="link_change">자격증
						<span class="btn_check">추가</span></a></li>
					<li><a href="#step2" data-toggle="tab" class="link_change">포트폴리오
						<span class="btn_check">추가</span>
					</a></li>
					<li><a href="#step3" data-toggle="tab" class="link_change">자기소개서
					<span class="btn_check">추가</span>
					</a></li>
					

				</ul>
			</div>
			<br />
			
			<div class="area_btn col-sm-12 text-center">
				<button type="button" class="btn btn-primary" name="preview" id="preview">미리보기</button>
			</div>
			<div class="area_btn col-sm-12 text-center">
				<button type="button" class="btn btn-primary" name="addForm" id="addForm">작성완료</button>
			</div>
			

		</div>
	</div>
					
	</form>
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

	<script
		src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=false"></script>
	<script src="resources/assets/js/gmaps.js"></script>
	<script src="resources/assets/js/gmaps.init.js"></script>

	<script src="resources/assets/js/main.js"></script>

</body>
</html>