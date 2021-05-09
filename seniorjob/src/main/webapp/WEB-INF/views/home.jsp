<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시니어잡</title>
<link href="https://fonts.googleapis.com/css?family=Lato:400,600,700" rel="stylesheet" />
<link href="resources/css/main.css" rel="stylesheet" />
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

<!-- Icons font CSS-->
    <link href="resources/mainSearchBar/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="resources/mainSearchBar/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- Vendor CSS-->
    <link href="resources/mainSearchBar/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="resources/mainSearchBar/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">
    <!-- Main CSS-->
    <link href="resources/mainSearchBar/css/main.css" rel="stylesheet" media="all">



<!-- #slidemenu는 영상통화 구현. 절대 지우지 마세요 . 양소민-->
<style>

#slidemenu{
position: absolute;
    top: 5px;
    right: 79px;;
}
button#hideBtn {
    width: 157px;
}
.slider-content{position:absolute}

#mentorSearchBtn{cursor:pointer}
#searchKeywordTitle{
	position: relative;
    right: 60px;
}
#chkBoxTitle{
	position:relative;
	right: 115px;
    top: 110px;
}

#dateChkTitle{
	position:relative;
	right: 930px;
    top: 125px;
}
#mtStartDate{
	position:relative;
	left: 50px;
}
#mtEndDate{
	position:relative;
	right:110px;
}
#mentorSearchBtn{
	cursor:pointer;
}
#mentorSearchChkBoxBtn{
	cursor:pointer;
	position:relative;
	top: 100px;
	right: 50px;
	z-index:1; /* 배치 순서 결정 https://aboooks.tistory.com/83 */
}
#mentoringDateBtn{
	cursor:pointer;
	position:relative;
	top: 300px;
	right: 100px;
	z-index:1; /* 배치 순서 결정 https://aboooks.tistory.com/83 */
}
div#homeDiv2 {
    top: -106px;
    width: 1150px;
    right: -42px;
    height: 560px;
}
input#searchKeyword {
    margin-top: -163px;
    width: 1000px;
    top: ;
}
p#ptag1 {
    margin-bottom: 83px;
}
div#homeDiv3 {
}
i#mentorSearchBtn {
   margin-top: 40px;
   margin-left: 92px;
    
}
hr#homeHr1 {
    margin-top: -54px;
}
div#homeDiv4 {
    width: 600px;
}
div#chkBox{
       margin-top: -103px;
       width: 900px;
}
div#chkBox1{
       width: 900px;
}
label#labelList1 {
    margin-right: 92px;
}
label#labelList2 {
    margin-right: 75px;
}
label#labelList2_1 {
    margin-right: 92px;
}
label#labelList2_2 {
    margin-right: 94px;
}
label#labelList2_3 {
    margin-right: 90px;
}
label#labelList2_4 {
    margin-right: 107px;
}
label#labelList3 {
    margin-right: 75px;
}
label#labelList3_1 {
    margin-right: 93px;
}
label#labelList3_2 {
    margin-right: 80px;
}
label#labelList3_3 {
    margin-right: 76px;
}
label#labelList3_4 {
    margin-right: 106px;
}
i#mentorSearchChkBoxBtn {
    right: -44px;
    top: 88px;
}
div#hr1Keyword {
    margin-top: -51px;
}
form#searchDateFrm {
    height: 550px;
}
div#mtStartDate {
    top:-37px;
    left: -12px;
}
div#mtEndDate {
    top: 37px;
    right: -7px;
}
i#mentoringDateBtn {
    top: 91px;
    right: -56px;
}
a#aTag1 {
    margin-left: 48px;
}
a#aTag2 {
    margin-left: 43px;
}
a#aTag3 {
    margin-left: 62px;
}
</style>
<!-- 영상통화 구현. 절대 지우지 마세요 . 양소민-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$.ajax({
		url:'videoCallButton',
		success : function(result) {
			
			//if(result != "false") {
				$("#numSom").attr('value',result);
				var auth = $('#authSom').val();
				var div = $('<div />').attr('id','slidemenu');
				
				var btn111 = $('<button />').attr('class','btn  btn-primary  dropdown-toggle')
											.attr('data-toggle', 'dropdown')
											.attr('id', 'hideBtn').html('멘토링 기능');
				var div2 = $('<div />').attr('class','dropdown-menu')
									   .attr('id', 'hideBtnSub');
				
				var hr1 = $('<hr />');
				var hr2 = $('<hr />');
				var hr3 = $('<hr />');
				
				
				
				
				var a = $('<a />').attr('id','aTag1').attr('onclick','video()').attr('class','dropdown-item').html('영상면접');
				var a2 = $('<a />').attr('id','aTag2').attr('onclick','resum()').attr('class','dropdown-item').html('이력서보기'); //나중에 영상면접 화면에 붙일 것.
				var a3 = $('<a />').attr('id','aTag3').attr('onclick','chatt()').attr('class','dropdown-item').html('채팅'); //나중에 영상면접 화면에 붙일 것.
				$(div).append(btn111, div2);
				$(div2).append(a,hr1);
				if(auth == "MENTOR") {
					$(div2).append(a2, hr2);
					} else {
						console.log("USER");
					}
				
				$(div2).append(a3);
				$("#slidemenu").append(div);
				
			//} else {
			//	console.log("else");
			//}
		},
		error : function() {
			console.log("error");
		}
	});
	 var currentPosition = parseInt($("#slidemenu").css("top"));
    $(window).scroll(function() {
        var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
        $("#slidemenu").stop().animate({"top":position+currentPosition+"px"},1000);
    });
});
function video(){
	window.open("https://192.168.0.56:85",
            "영상", "width=900, height=900, resizable = no, scrollbars = no");
}
function resum(){
	var num=$("#numSom").val();
	//console.log(num)
	window.open("popResumeGetForm?resume_no="+num,
            "이력서", "width=900, height=900, resizable = no, scrollbars = no");
}
function chatt() {
	window.open("chat",
            "채팅", "width=500, height=600, resizable = no, scrollbars = no");
}
</script>
</head>
<body>
	<!-- topHeader -->
	<jsp:include page="topHeader.jsp" />
	<!-- 영상통화 구현. 절대 지우지 마세요 . 양소민-->
	<div class="dropdown" id="slidemenu" ></div>
	
	
	
	
	
	<input type="hidden" id="numSom">
	<input type="hidden" id="authSom" value="${users.auth }">
	<!-- 검색 -->
        <div class="slider-area">
            <div class="slider">
                <div id="bg-slider" class="owl-carousel owl-theme">
                    <div class="item"><img src="resources/assets/img/slide1/slider-image-1.jpg" alt="Mirror Edge"></div> 
                    <div class="item"><img src="resources/assets/img/slide1/slider-image-2.jpg" alt="The Last of us"></div> 
                    <div class="item"><img src="resources/assets/img/slide1/slider-image-4.jpg" alt="GTA V"></div>   
                </div>
            </div>
            
            <div class="container slider-content"> <!--이미지 움직이는 div -->
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2 col-md-12 col-md-offset-1 col-sm-12" id="homeDiv1"> <!-- 키워드 체크박스 검색 전체 div -->
                        <div class="search-form wow pulse" data-wow-delay="0.8s" id="homeDiv2">
                            <form class=" form-inline" name="searchFrm">
                        
                        <div class="col-md-10">
                        	<p id="ptag1" style="text-align: left"><strong>키워드 검색</strong></p>
                        	<div id="homeDiv3">
                            <input id="searchKeyword" name="searchKeyword" class="form-control" type="text" placeholder="멘토링 검색: 원하는 직무, 지역 또는 연령을 입력하세요.">
                            </div>
                        </div>
                        <div class="col-md-2">
                        	<i class="fas fa-search fa-2x" style="color:#FFA500" id="mentorSearchBtn"></i>
                        </div>
                        <div class="col-md-12" id="hr1Keyword">
                        
                         	<hr>
                         </div>
                         
                        <div class="col-md-10">
                        	<p id="ptag1" style="text-align: left"><strong>직무 검색</strong></p>
                        	<div id="homeDiv4">
                        	<!--줄바꿈  -->   
                        	<div class="search-row" id="chkBox" name="chkBox" align="left">  
                                            <div class="checkbox">
                                                <label id="labelList1">
                                                    <input type="checkbox" name="mentor_dutyArr" value="IT"> IT
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label id="labelList1">
                                                    <input type="checkbox" name="mentor_dutyArr" value="영업"> 영업
                                                </label>
                                            </div>
                                        	<div class="checkbox">
                                                <label id="labelList1">
                                                    <input type="checkbox" name="mentor_dutyArr" value="인사"> 인사
                                                </label>
                                            </div>
                                        	<div class="checkbox">
                                                <label id="labelList1">
                                                    <input type="checkbox" name="mentor_dutyArr" value="총무"> 총무
                                                </label>
                                            </div>
                                        	<div class="checkbox">
                                                <label id="labelList1">
                                                    <input type="checkbox" name="mentor_dutyArr" value="마케팅"> 마케팅
                                                </label>
                                            </div>
                                        	<div class="checkbox">
                                                <label id="labelList1">
                                                    <input type="checkbox" name="mentor_dutyArr" value="광고"> 광고
                                                </label>
                                            </div>
                                      </div>
                             <div class="search-row" id="chkBox1" name="chkBox" align="left">
                             	 			<div class="checkbox">
                                                <label id="labelList2">
                                                    <input type="checkbox" name="mentor_dutyArr" value="회계"> 회계
                                                </label>
                                            </div>
                                       		 <div class="checkbox">
                                                <label id="labelList2_1">
                                                    <input type="checkbox" name="mentor_dutyArr" value="재무"> 재무
                                                </label>
                                            </div>
                                        	<div class="checkbox">
                                                <label id="labelList2_2">
                                                    <input type="checkbox" name="mentor_dutyArr" value="해외"> 해외
                                                </label>
                                            </div>
                                        	<div class="checkbox">
                                                <label id="labelList2_3">
                                                    <input type="checkbox" name="mentor_dutyArr" value="유통"> 유통
                                                </label>
                                            </div>
                               				<div class="checkbox">
                                                <label id="labelList2_4">
                                                    <input type="checkbox" name="mentor_dutyArr" value="무역"> 무역
                                                </label>
                                            </div>
                                        	<div class="checkbox">
                                                <label id="labelList2_5">
                                                    <input type="checkbox" name="mentor_dutyArr" value="전략"> 전략
                                                </label>
                                            </div>
                             </div>         
 							<!--줄바꿈  -->                                     
                        	<div class="search-row" id="chkBox1" name="chkBox" align="left">
                                        	<div class="checkbox">
                                                <label id="labelList3">
                                                    <input type="checkbox" name="mentor_dutyArr" value="기획"> 기획
                                                </label>
                                            </div>
                                        	<div class="checkbox">
                                                <label id="labelList3_1">
                                                    <input type="checkbox" name="mentor_dutyArr" value="생산"> 생산
                                                </label>
                                            </div>
                                        	<div class="checkbox">
                                                <label id="labelList3_2">
                                                    <input type="checkbox" name="mentor_dutyArr" value="공기업"> 공기업
                                                </label>
                                            </div>
                                        	<div class="checkbox">
                                                <label id="labelList3_3">
                                                    <input type="checkbox" name="mentor_dutyArr" value="디자인"> 디자인
                                                </label>
                                            </div>
                                        	<div class="checkbox">
                                                <label id="labelList3_4">
                                                    <input type="checkbox" name="mentor_dutyArr" value="교육"> 교육
                                                </label>
                                            </div>
                                        	<div class="checkbox">
                                                <label id="labelList3_5">
                                                    <input type="checkbox" name="mentor_dutyArr" value="컨설팅"> 컨설팅
                                                </label>
                                            </div>
                                    </div>
                            </div>
                        </div>
                         <div class="col-md-2">
                         	<i class="fas fa-search fa-2x" style="color:#FFA500" id="mentorSearchChkBoxBtn"></i>
                         	
                         </div>
                         <div class="col-md-12">
                         	<hr>
                         </div>
                         </form>
						<form method="POST" action="getMentoringList" id="searchDateFrm">
                        <div class="col-md-12" id="mentorBoxDiv">    
                         
                        <div class="col-md-5" id="mentorDateBox1">
                        <p id="ptag2" style="text-align: left"><strong>멘토링 날짜 검색</strong></p>
                        	<div class="input-group" id="mtStartDate">
								<label class="label">멘토링 시작일</label> <input class="input--style-1" type="date" name="mentoring_begin_date" placeholder="mm/dd/yyyy" id="mentoring_begin_date" required>
							</div>
                        	
                        </div>		
						<div class="col-md-5" id="mentorDateBox2">
							<div class="input-group" id="mtEndDate">
								<label class="label">멘토링 종료일</label> <input class="input--style-1" type="date" name="mentoring_end_date" placeholder="mm/dd/yyyy" id="mentoring_end_date" required>
							</div>
						</div>	
						<div class="col-md-2">
                        	
                        	<i class="fas fa-search fa-2x" style="color:#FFA500" id="mentoringDateBtn"></i>
                        </div>	
						</div>
						</form>
                        </div>
				</div>
                </div>
            </div>
        </div>
      <!-- End of 검색 -->
      
      <!-- 모달 팝업 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title" id="myModalLabel">Alert</h4>
			      </div>
			      <div class="modal-body">
					검색 키워드를 입력하세요.
			      </div>
			      <div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
      	<!-- 모달 팝업 -->

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
	
	$('#mentorSearchBtn').click(function(){
		// 멘토 상세검색 값 체크 및 검색 구현
			var keywordChk = $("[name='searchKeyword']").val();
			if(keywordChk==""){
				$('#myModal').modal().show();
				return false;
			}else if(keywordChk.indexOf('서울') >= 0 || keywordChk.indexOf('부산') >= 0|| keywordChk.indexOf('대구') >= 0 || keywordChk.indexOf('인천') >= 0 || keywordChk.indexOf('광주') >= 0 || keywordChk.indexOf('대전') >= 0 || keywordChk.indexOf('울산') >= 0 || keywordChk.indexOf('세종') >= 0){
				alert(keywordChk + " 지역 멘토를 검색합니다.");
				searchFrm.action = "getKeywordSearch";
				searchFrm.submit();
			}else if(keywordChk.indexOf('40') >= 0 || keywordChk.indexOf('50') >= 0 || keywordChk.indexOf('60') >= 0){
				alert(keywordChk + "대 멘토링 멘토를 검색합니다.");
				searchFrm.action = "getKeywordSearch";
				searchFrm.submit();
			}else{
				alert(keywordChk + " 직무 멘토를 검색합니다.");
				searchFrm.action = "getKeywordSearch";
				searchFrm.submit();
			}
	});
	
	// 직무 검색
	$('#mentorSearchChkBoxBtn').click(function(){
		var chkDutyArr = new Array();
		$("input:checkbox[name='mentor_dutyArr']:checked").each(function(){
			chkDutyArr.push(this.value);
		});
		if(chkDutyArr.length < 1){
			alert("직무를 하나 이상 선택하세요.");
		}else{
			searchFrm.action = "getSearchMentorDuty";
			searchFrm.submit();
		}
	});
	
	// 멘토링 날짜 검색
	$('#mentoringDateBtn').click(function(){
		
		var s_date = $('#mentoring_begin_date').val();
		var e_date = $('#mentoring_end_date').val();
		
		var s_dateArr = s_date.split("-");
		var e_dateArr = e_date.split("-");
		var startDate = new Date(s_dateArr[0], s_dateArr[1], s_dateArr[2]);
		var endDate = new Date(e_dateArr[0], e_dateArr[1], e_dateArr[2]);
		
		if(s_date==""){
			alert("시작일을 선택해주세요.");
			return false;
		}else if(e_date==""){
			alert("종료일을 선택해주세요.");
			return false;
			
		}else if(startDate > endDate){
			alert("날짜 설정이 잘못되었습니다");
			return false;
		}else{
			searchDateFrm.action = "getMentoringList";
			searchDateFrm.submit();
		}
	});
	
</script>
	 <!-- Jquery JS-->
    <script src="resources/mainSearchBar/vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="resources/mainSearchBar/vendor/select2/select2.min.js"></script>
    <script src="resources/mainSearchBar/vendor/jquery-validate/jquery.validate.min.js"></script>
    <script src="resources/mainSearchBar/vendor/bootstrap-wizard/bootstrap.min.js"></script>
    <script src="resources/mainSearchBar/vendor/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
    <script src="resources/mainSearchBar/vendor/datepicker/moment.min.js"></script>
    <script src="resources/mainSearchBar/vendor/datepicker/daterangepicker.js"></script>
    <!-- Main JS-->
    <script src="resources/mainSearchBar/js/global.js"></script>

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
	
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>	
</html>
