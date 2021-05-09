<%@page import="org.springframework.web.servlet.mvc.condition.ProducesRequestCondition"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>멘토 상세 페이지</title>
<!-- fontawesome cdn -->
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
</head>
<style>
#mentorCareerTxt{
	width:220px;  white-space:normal;
}
</style>
<body>
<!-- topHeader -->
<jsp:include page="../topHeader.jsp" />
<!-- topHeader -->

        <div class="page-head"> 
            <div class="container">
                <div class="row">
                    <div class="page-head-content" style="color:black">
                        <h1 class="page-title">${mentor.usersVO.name}<b class="property-info-unit">멘토</b></h1>  
                    </div>
                </div>
            </div>
        </div>
        <!-- End page header -->

        <!-- property area -->
        <div class="content-area single-property" style="background-color: #FCFCFC;">
            <div class="container">

                <div class="clearfix padding-top-40">
                    <div class="col-md-8 single-property-content ">
                        <div class="single-property-wrapper">

                            <div class="property-meta entry-meta clearfix ">   

                                <div class="col-xs-3 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info-icon icon-tag">
                                   	 	<i class="fas fa-hands-helping fa-3x" style="color:#FFA500"></i>
                                    </span>
                                    <span class="property-info-entry" id="mentoringCnt">
                                        <span class="property-info-label">진행중인 멘토링</span>
                                    </span>
                                </div>

                                <div class="col-xs-3 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info icon-area">
                                        <i class="fas fa-thumbs-up fa-3x" style="color:#FFA500"></i>
                                    </span>
                                    <span class="property-info-entry" id="followCnt">
                                        <span class="property-info-label">팔로우 숫자</span>
                                        <%-- <span class="property-info-value">${mentoring.mentoring_limit }<b class="property-info-unit">명</b></span> --%>
                                    </span>
                                </div>
                                
                                <!-- <div class="col-xs-3 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info-icon icon-bed">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 48 48">
                                        <path class="meta-icon" fill="#FFA500" d="M21 48.001h-19c-1.104 0-2-.896-2-2v-31c0-1.104.896-2 2-2h19c1.106 0 2 .896 2 2v31c0 1.104-.895 2-2 2zm0-37.001h-19c-1.104 0-2-.895-2-1.999v-7.001c0-1.104.896-2 2-2h19c1.106 0 2 .896 2 2v7.001c0 1.104-.895 1.999-2 1.999zm25 37.001h-19c-1.104 0-2-.896-2-2v-31c0-1.104.896-2 2-2h19c1.104 0 2 .896 2 2v31c0 1.104-.896 2-2 2zm0-37.001h-19c-1.104 0-2-.895-2-1.999v-7.001c0-1.104.896-2 2-2h19c1.104 0 2 .896 2 2v7.001c0 1.104-.896 1.999-2 1.999z"></path>
                                        </svg>
                                    </span>
                                    <span class="property-info-entry">
                                        <span class="property-info-label">Bedrooms</span>
                                        <span class="property-info-value">3</span>
                                    </span>
                                </div>
                                <div class="col-xs-3 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info-icon icon-bath">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 48 48">
                                        <path class="meta-icon" fill="#FFA500" d="M37.003 48.016h-4v-3.002h-18v3.002h-4.001v-3.699c-4.66-1.65-8.002-6.083-8.002-11.305v-4.003h-3v-3h48.006v3h-3.001v4.003c0 5.223-3.343 9.655-8.002 11.305v3.699zm-30.002-24.008h-4.001v-17.005s0-7.003 8.001-7.003h1.004c.236 0 7.995.061 7.995 8.003l5.001 4h-14l5-4-.001.01.001-.009s.938-4.001-3.999-4.001h-1s-4 0-4 3v17.005000000000003h-.001z"></path>
                                        </svg>
                                    </span>
                                    <span class="property-info-entry">
                                        <span class="property-info-label">Bathrooms</span>
                                        <span class="property-info-value">3.5</span>
                                    </span>
                                </div>
                                <div class="col-xs-3 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info-icon icon-garage">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 48 48">
                                        <path class="meta-icon" fill="#FFA500" d="M44 0h-40c-2.21 0-4 1.791-4 4v44h6v-40c0-1.106.895-2 2-2h31.999c1.106 0 2.001.895 2.001 2v40h6v-44c0-2.209-1.792-4-4-4zm-36 8.001h31.999v2.999h-31.999zm0 18h6v5.999h-2c-1.104 0-2 .896-2 2.001v6.001c0 1.103.896 1.998 2 1.998h2v2.001c0 1.104.896 2 2 2s2-.896 2-2v-2.001h11.999v2.001c0 1.104.896 2 2.001 2 1.104 0 2-.896 2-2v-2.001h2c1.104 0 2-.895 2-1.998v-6.001c0-1.105-.896-2.001-2-2.001h-2v-5.999h5.999v-3h-31.999v3zm8 12.999c-1.104 0-2-.895-2-1.999s.896-2 2-2 2 .896 2 2-.896 1.999-2 1.999zm10.5 2h-5c-.276 0-.5-.225-.5-.5 0-.273.224-.498.5-.498h5c.275 0 .5.225.5.498 0 .275-.225.5-.5.5zm1-2h-7c-.275 0-.5-.225-.5-.5s.226-.499.5-.499h7c.275 0 .5.224.5.499s-.225.5-.5.5zm-6.5-2.499c0-.276.224-.5.5-.5h5c.275 0 .5.224.5.5s-.225.5-.5.5h-5c-.277 0-.5-.224-.5-.5zm11 2.499c-1.104 0-2.001-.895-2.001-1.999s.896-2 2.001-2c1.104 0 2 .896 2 2s-.896 1.999-2 1.999zm0-12.999v5.999h-16v-5.999h16zm-24-13.001h31.999v3h-31.999zm0 5h31.999v3h-31.999z"></path>
                                        </svg>
                                    </span>
                                    <span class="property-info-entry">
                                        <span class="property-info-label">Garages</span>
                                        <span class="property-info-value">2</span>
                                    </span>
                                </div> -->

                            </div>
                            <!-- .property-meta -->
                            <div class="section">
                                <h4 class="s-property-title">대표 멘토링 분야</h4>
                                <div class="s-property-content">
                                    <p>${mentor.mentoring_kind }</p>
                                </div>
                            </div>

                            <div class="section">
                                <h4 class="s-property-title">멘토링 소개</h4>
                                <div class="s-property-content">
                                    <p>${mentor.mentor_introduce }</p>
                                </div>
                            </div>
                            
                            <div class="section">
                                <h4 class="s-property-title">주요 경력</h4>
                                <div class="s-property-content">
                                    <p id="mentorCareerTxt">${mentor.mentor_career }</p>
                                </div>	
                            </div>


                            <!-- <div class="section property-video"> 
                                <h4 class="s-property-title">Property Video</h4> 
                                <div class="video-thumb">
                                    <a class="video-popup" href="yout" title="Virtual Tour">
                                        <img src="assets/img/property-video.jpg" class="img-responsive wp-post-image" alt="Exterior">            
                                    </a>
                                </div>
                            </div> -->
                            <!-- End video area  -->
                        </div>
                    </div>

                    <div class="col-md-4 p0">
                        <aside class="sidebar sidebar-property blog-asside-right">
                            <div class="dealer-widget">
                                <div class="dealer-content">
                                    <div class="inner-wrapper">

                                        <div class="clear">
                                            <div class="col-xs-4 col-sm-4 dealer-face">
                                                <a href="getMentor?mentor_id=${mentor.mentor_id }">
                                                    <img src="image/${mentor.mentor_photo }" class="img-circle">
                                                </a>
                                            </div>
                                        </div>

                                        <div class="clear">
                                            <ul class="dealer-contacts">     
                                                <li><i class="pe-7s-user strong"> </i><b class="property-info-unit">이름: </b>${mentor.usersVO.name }</li>
                                                <li><i class="pe-7s-home strong"> </i><b class="property-info-unit">회사: </b>${mentor.mentor_company_name }</li>
                                                <li><i class="pe-7s-notebook strong"> </i><b class="property-info-unit">직무: </b>${mentor.mentor_duty }</li>
                                            </ul>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            
                            <!-- 장바구니담기/결제하기  -->
                            <div class="panel panel-default sidebar-menu wow fadeInRight animated" >
                                <!-- <div class="panel-heading">
                                    <h3 class="panel-title"></h3>
                                </div> --> 
                                <div class="panel-body search-widget">
                                    <form action="" class=" form-inline"> 
                                    	<input type="hidden" id="mentor_id" name="mentor_id" value="${mentor.mentor_id }">
                                    	<input type="hidden" id="id" name="id" value="${users.id }">
                                        <fieldset >
                                            <div class="row">
                                                <div class="col-xs-12">
                                                <c:if test="${empty users }">
                                                	<input class="button btn largesearch-btn" value="멘토 팔로우" type="button" style="background:#FDC600; color:#fff" data-toggle="modal" data-target="#myModal">
                                                </c:if>  
                                                <c:if test="${not empty users }">
                                                    <input class="button btn largesearch-btn" value="멘토 팔로우" id="followBtn" type="button">
                                                </c:if>
                                                    <input class="button btn largesearch-btn" value="멘토 팔로우 취소" id="followCancelBtn" type="button">
                                                    <input class="button btn largesearch-btn" value="멘토에게 질문하기" onclick="insertQueSom('${mentor.mentor_id }')" type="button">
                                                </div>  
                                            </div>
                                        </fieldset>                                     
                                    </form>
                                </div>
                            </div>
							<!-- End of 장바구니담기/결제하기  -->

                        </aside>
                    </div>
                </div>

            </div>
        </div>
        
        <!-- 모달 팝업 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title" id="myModalLabel">Alert</h4>
			      </div>
			      <div class="modal-body">
					로그인 또는 회원가입이 필요한 항목입니다.
			      </div>
			      <div class="modal-footer">
			      	<button type="button" class="btn btn-primary" style="display:none">로그인</button> <!-- 레이아웃 정렬용 태그(사용X) -->
					<button type="button" class="btn btn-primary" onclick="location.href='login'">로그인</button>
					<button type="button" class="btn btn-primary" onclick="location.href='insertUsers'">회원가입</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
      	<!-- 모달 팝업 -->

<!-- Footer area-->
<jsp:include page="../footer.jsp" />
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
	$(function() {
		getFollow(); // 멘토팔로우
		deleteFollow(); // 멘토팔로우 취소
		getMentoringCnt(); // 진행중인 멘토링 개수
		getFollowCnt(); // 팔로우 숫자
	}); // end of function
	
		function getFollow(){ // 멘토 팔로우
			$('#followBtn').click(function(){
				$.ajax({
					url: "mentorFollowCheck",
					dataType: "json", 
					data: { "id" : $('#id').val(),"mentor_id":$('#mentor_id').val() },
					success:function(result){
						if(result == 0){
							alert("팔로우 완료");
							location.reload();
						}else{
							alert("이미 팔로우된 멘토입니다");
							 }
						}
					});
				});
		} // end of getFollow
		
		function deleteFollow(){ // 멘토 팔로우 취소
			$('#followCancelBtn').click(function(){
				$.ajax({
					url: "deleteMentorFollow",
					dataType: "json", 
					data: { "id" : $('#id').val(),"mentor_id":$('#mentor_id').val() },
					success:function(result){
						if(result == 0){
							alert("팔로우하지 않은 멘토입니다.");
						}else{
							alert("팔로우 취소 완료");
							location.reload();
						}
					}
				});
			});
		} // end of deleteFollow
		
		function getMentoringCnt(){ // 진행중인 멘토링 개수
			$.ajax({
				url: "getMentoringCnt",
				dataType: "json", 
				data: { "mentor_id": ${mentor.mentor_id} },
				success:function(result){
					var span = $('<span>').attr({ "id" : "mtCnt" , "class" : "property-info-value" });
					var a = $('<a>').attr({'href' : '#' , "onclick" : "window.open('mentoringListWindow?mentor_id=${mentor.mentor_id}','멘토링 리스트',  'width=680px, height=240px, resizable = no')"}).text(result);
					var b = $('<b>').attr("class", "property-info-unit").text('건');
					span.append(a, b);
					$('#mentoringCnt').append(span);
				}
			});
		}
		
		function getFollowCnt(){ // 팔로우 개수
			$.ajax({
				url: "getFollowCnt",
				dataType: "json", 
				data: { "mentor_id": ${mentor.mentor_id} },
				success:function(result){
					var span = $('<span>').attr("class", "property-info-value").text(result);
					var b = $('<b>').attr("class", "property-info-unit").text('명');
					
					span.append(b);
					$('#followCnt').append(span);
				}
			});
		}
	// 로그인 여부 확인
	function loginCheck(){
			if(confirm("로그인 또는 회원가입이 필요한 항목입니다.")){
				location.href = "login"; // 로그인 페이지로 이동
			}
	}
	// 멘토 팔로우
	function mentorFollow() {
		var msg = confirm("멘토를 팔로우 하시겠습니까?");
		if (msg == true) {
			var getMentorInfo = document.getMentorInfo;
			getMentorInfo.action = "MentorFollow";
			getMentorInfo.submit();
		} else if (msg == false) {
			alert("취소");
		}
	}
	
	// 멘토링 신청페이지 이동
	function mentoringPayForm(){ 
			if(confirm("멘토링을 신청하시겠습니까?")){
				location.href = "mentoringPayForm?mentor_id=${list.mentor_id}";
			}
		}
	//멘토에게 질문하기
	function insertQueSom(id) {
		var url="insertQuest?mentorid="+id;
		window.open(url,"","width=500,height=600");
	}
</script>

</body>
</html>