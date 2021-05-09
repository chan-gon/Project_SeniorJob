<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시니어잡/멘토링상세</title>
<!-- fontawesome cdn -->
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
</head>
<body>
<!-- topHeader -->
<jsp:include page="../topHeader.jsp" />
<!-- topHeader -->

<style>

element.style {
}
.edu-detail--summary[data-v-0d9114a3] {
    position: relative;
    padding: 32px 0 48px;
    overflow: visible; 
}
article, aside, body, div, footer, header, section {
    -webkit-user-select: text;
    -moz-user-select: text;
    -ms-user-select: text;
    user-select: text;
}

.h1, .h2, .h3, .h4, .h5, .h6, a, abbr, acronym, address, applet, article, aside, audio, b, big, blockquote, body, canvas, caption, center, cite, code, dd, del, details, dfn, div, dl, dt, em, embed, fieldset, figcaption, figure, footer, form, h1, h2, h3, h4, h5, h6, header, hgroup, html, i, iframe, img, ins, kbd, label, legend, li, mark, menu, nav, object, ol, output, p, pre, q, ruby, s, samp, section, small, span, strike, strong, sub, summary, sup, table, tbody, td, tfoot, th, thead, time, tr, tt, u, ul, var, video {
    margin: 0;
    padding: 0;
    border: 0;
}
article, aside, footer, header, nav, section {
    display: block;
}

user agent stylesheet
section {
    display: block;
}
body {
    line-height: 1;
}

html {
    line-height: 1.15;
    -ms-text-size-adjust: 100%;
    -webkit-text-size-adjust: 100%;
}
*, :after, :before {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    outline: none;
}
*, :after, :before {
    box-sizing: border-box;
}
*, :after, :before {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    outline: none;
}
*, :after, :before {
    box-sizing: border-box;
}
body ::selection {
    color: inherit;
    background-color: #e6e6e6;
    background-color: fade(#000,10);
    cursor: text;
}
img.edu-detail--summary-define-img {
    width: 387px;
    margin-left: 162px;
}
h3.c-application.c-typography.edu-detail--summary-title.c_headline5 {
    margin: 70px;
    font-size: 17px;
}
h4.c-application.c-typography.edu-detail--summary-define-title.c_headline6 {
    margin: 35px;
}
p.c-application.c-typography.edu-detail--summary-define-text.c_body1 {
    margin: 25px;
}    

.c-application.c-box.edu-detail--content {
    border: 2px solid darkgrey;
}

#imggg{
	width: 200px;
}
</style>

<form id="submitFrm" name="submitFrm" method="post">
	<input type="hidden" id="id" name="id" value="${mentor.mentor_id }">
	<input type="hidden" id="mentor_id" name="mentor_id" value="${mentoring.mentor_id }">
	<input type="hidden" id="men_start" name="men_start" value="${mentoring.mentoring_begin_date }">
	<input type="hidden" id="met_end" name="met_end" value="${mentoring.mentoring_end_date }">
	<input type="hidden" id="mentoring_number" name="mentoring_number" value="${mentoring.mentoring_number }">
	<input type="hidden" id="mentoring_name" name="mentoring_name" value="${mentoring.mentoring_name }">
	<input type="hidden" id="cart_start" name="cart_start" value="${mentoring.s_date }">
	<input type="hidden" id="cart_end" name="cart_end" value="${mentoring.e_date }">
	<input type="hidden" id="cart_price" name="cart_price" value="${mentoring.mentoring_price }">
        <div class="page-head"> 
            <div class="container">
                <div class="row">
                    <div class="page-head-content" style="color:black">
                        <h1 class="page-title">${mentor.usersVO.name}<b class="property-info-unit">멘토의 멘토링</b></h1>  
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
                        <div class="row">
                            <div class="light-slide-item">            
                                <div class="clearfix">
                                    <div class="favorite-and-print">
                                        <a class="printer-icon " href="javascript:window.print()">
                                            <i class="fa fa-print"></i> 
                                        </a>
                                    </div> 
                                   <img src="image/${mentoring.mentoring_photo }" id="imggg" />
                                </div>
                            </div>
                        </div>
                        <div class="single-property-wrapper">
                            <div class="single-property-header">                                          
                                <h1 class="property-title pull-left"><b>${mentoring.mentoring_name }</b></h1>
                            </div>

                            <div class="property-meta entry-meta clearfix "> 
                            
                            	<div class="col-xs-3 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info-icon icon-tag">
                                   	 	<i class="fal fa-file-search fa-3x" style="color:#FFA500"></i>
                                    </span>
                                    <span class="property-info-entry">
                                        <span class="property-info-label">멘토링 분야</span>
                                        <span class="property-info-value">${mentoring.mentoring_kind }</span>
                                    </span>
                                </div>  

                                <div class="col-xs-3 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info-icon icon-tag">
                                   	 	<i class="fas fa-user-friends fa-3x" style="color:#FFA500"></i>
                                    </span>
                                    <span class="property-info-entry">
                                        <span class="property-info-label">최대 인원</span>
                                        <span class="property-info-value">${mentoring.mentoring_limit }<b class="property-info-unit">명</b></span>
                                    </span>
                                </div>

                                <div class="col-xs-3 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info icon-area">
                                        <i class="far fa-calendar-alt fa-3x" style="color:#FFA500"></i>
                                    </span>
                                    <span class="property-info-entry">
                                        <span class="property-info-label">멘토링 기간</span>
                                        <span class="property-info-value"><b class="property-info-unit">시작일: </b>${mentoring.s_date }</span>
                                        <span class="property-info-value"><b class="property-info-unit">종료일: </b>${mentoring.e_date }</span>
                                    </span>
                                </div>
                                
                                <div class="col-xs-3 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info icon-area">
                                        <i class="fas fa-won-sign fa-3x" style="color:#FFA500"></i>
                                    </span>
                                    <span class="property-info-entry">
                                        <span class="property-info-label">멘토링 가격</span>
                                        <span class="property-info-value">${mentoring.mentoring_price }<b class="property-info-unit">원</b></span>
                                    </span>
                                </div>
                                
                               <hr>
                               <br>
                               <!-- 크롤링 -->
                               <div>
	                            	${biz }
	                            	<img src="image/코멘토.JPG">
                                </div>
                                <br>
                                
                                
                                

                                
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
                                <h4 class="s-property-title">멘토링 소개</h4>
                                <div class="c-application c-box edu-detail--content" style="background-color:#FFFFFF;padding:48px 40px 48px 40px;" data-v-5e54bd97="" data-v-6e8598a8="" data-v-1430fc45="">
                                <p data-v-dbf069b8="" data-v-1430fc45="" class="c-application c-typography edu-detail--introduce-content-msg c_headline6" data-v-5e54bd97="" style="color: rgb(33, 40, 47);">
                                <strong>${mentoring.mentoring_introduce}</strong><br></div>
                            </div>
                            <!-- End description area  -->

                            <div class="section">
                                <h4 class="s-property-title">멘토링 내용</h4>
                                <div class="c-application c-box edu-detail--content" style="background-color:#FFFFFF;padding:48px 40px 48px 40px;" data-v-5e54bd97="" data-v-6e8598a8="" data-v-1430fc45="">
                                <p data-v-dbf069b8="" data-v-1430fc45="" class="c-application c-typography edu-detail--introduce-content-msg c_headline6" data-v-5e54bd97="" style="color: rgb(33, 40, 47);">
                                <strong>${mentoring.mentoring_content}</strong><br></div>
                            </div>
                            <!-- End description area  -->
                            <!-- End additional-details area  -->
                            
                             <!-- <div class="section property-video"> 
                                <h4 class="s-property-title"></h4> 
                                <div class="video-thumb">
                                    <a class="video-popup" href="yout" title="Virtual Tour">
                                        <img src="assets/img/property-video.jpg" class="img-responsive wp-post-image" alt="Exterior">            
                                    </a>
                                </div>
                            </div> -->
                            <!-- End video area  -->
                            <!-- =================================멘토링 후기=================================================== -->
                            <div class="section property-features" id="reviewsList">    
                                <h4 class="s-property-title">멘토링 후기</h4> 
                                <div id="reviewss" style="display:none">
                                <div class="score_reple" >
                                <span id="seq"></span>
									<p>
										<span class="ico_viewer">(구매자)</span>
									</p>
									<p>	
										<span id="review_content"></span>
									</p>
									<dl>
										<dt>
											<em>
												<a href="#">
													<span id="review_id"></span>
												</a>
											</em>
											<em id="reviews_wDate"></em>
										</dt>
									</dl>
									
									<div align="right">
									<a id="delR">삭제</a>
									<a id="upR" onclick="upR()">수정</a>
									</div>
								</div>
								<hr>
								</div>
							</div>
							<!-- =======================================멘토링 후기=============================================== -->
<%-- 							<button type="button" id="paging" name="paging">${paging }</button> --%>
                            <!-- End features area  -->
		                    <div class="input_request">
		                    <h3>구매평 등록</h3>
		                    <br>
								<textarea id="content" row="8" cols="100" rows="8" class="input_textarea" placeholder="후기를 작성하세요." style="resize: none"></textarea>
								<p class="text_length"><h6 id="ment_cnt">0</h6> / 1000</p>
							</div>
							<div align="right"><button type="button" id="submitReview" name="submitReview">등록</button></div>	
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
                                            <div class="col-xs-8 col-sm-8 ">
                                                <h3 class="dealer-name">
                                                    <span>${mentor.usersVO.name }<b class="property-info-unit">멘토</b></span>        
                                                </h3>
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
                                    	<input type="hidden" id="id" name="id" value="${mentor.id }">
                                        <fieldset >
                                            <div class="row">
                                                <div class="col-xs-12">  
                                                    <input class="button btn largesearch-btn" value="장바구니 담기" id="BasketBtn" type="button" onclick="insertC()">
                                                    <input class="button btn largesearch-btn" value="바로구매" onclick="mentoringPayForm()" type="button" id="pushB">
                                                </div>  
                                            </div>
                                        </fieldset>                                     
                                </div>
                            </div>
							<!-- End of 장바구니담기/결제하기  -->

                            <%-- <div class="panel panel-default sidebar-menu similar-property-wdg wow fadeInRight animated">
                                <div class="panel-heading">
                                    <h3 class="panel-title">유사한 멘토링</h3>
                                </div>
                                <div class="panel-body recent-property-widget">
                                    <ul>
                                    <c:forEach var="rtMentoring" items="${relatedMentoring }">
                                        <li>
                                            <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                                <a href="getSearchMentoringChanGon?mentor_id=${rtMentoring.mentor_id }&mentoring_number=${rtMentoring.mentoring_number }&mentoring_kind=${rtMentoring.mentoring_kind}">
                                                <img src="image/${rtMentoring.mentoring_photo }"></a>
                                            </div>
                                            <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                                <h6> <a href="getSearchMentoringChanGon?mentor_id=${rtMentoring.mentor_id }&mentoring_number=${rtMentoring.mentoring_number }&mentoring_kind=${rtMentoring.mentoring_kind}">
                                                ${rtMentoring.mentoring_name } </a></h6>
                                            </div>
s                                        </li>
s                                     </c:forEach>  
                                    </ul>
                                </div>
                            </div> --%>

                        </aside>
                    </div>
                </div>

            </div>
        </div>
</form>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>

//장바구니 담기
function insertC(){
	var yn = confirm("장바구니에 담으시겠습니까?");
	var Frm = document.submitFrm;
	if(yn){
		Frm.action = "insertCart";
		Frm.submit();
	}
}

//멘토링 신청페이지 이동
function mentoringPayForm(){ 
		var Frm = document.submitFrm;
		if(confirm("멘토링을 신청하시겠습니까?")){
			Frm.action = "mentoringPayForm";
			Frm.submit();
		}
	}
	
/* 글자수 제한(구매평) */	
$(document).ready(function(){
	$("textarea").keyup(function(){
		var inputLength = $(this).val().length;
		if(inputLength > 1000) {
			alert("입력 가능한 글자수를 초과 했습니다.");
		}
		var remain = inputLength;
		$("h6").html(remain);
	})
})	



/* 댓글 조회 */
$.ajax({
	url: "getReviewsList",
	data : { mentoring_number : ${mentoring.mentoring_number }},
	dataType: "json",
	success: function(response){
		for(i=0; i < response.length; i++){
			var list = $($("#reviewss").html());
			if(response[i].id != '${users.id}'){
				list.find("#delR").remove();
				list.find("#upR").remove();
			}
			list.find("#seq").html(response[i].seq);
			list.find("#review_content").html(response[i].content);
			list.find("#review_id").html(response[i].id);
			list.find("#reviews_wDate").html(response[i].w_date);
			$("#reviewsList").append(list);
			
			
			//paging버튼
            /* $("#paging").empty();
            var totalRecord = response.paging.totalRecord;
            var lastPage = response.paging.lastPage;
            var page = response.paging.page;
            var pageSize = response.paging.pageSize;
            var endPage = response.paging.endPage;
            var startPage = response.paging.startPage;
            if (startPage > 1) {
               $("#paging").append(
                     "<a href='#' onclick='getReviewsList("
                           + (startPage - 1) + ")'>" + "&laquo;"
                           + "</a>");
            }
            for (i = startPage; i <= endPage; i++) {
               $("#paging").append(
                     "<a href='#' onclick='getReviewsList(" + (i)
                           + ")'>" + i + "</a>");
            }
            if (lastPage > endPage) {
               $("#paging").append(
                     "<a href='#' onclick='getReviewsList("
                           + (endPage + 1) + ")'>" + "&raquo;"
                           + "</a>");
            } */

		}
	}
})

// 댓글 등록(구매 안 하면 alert)
$("#submitReview").on("click", function(){
	$.ajax({
		url: "searchShopping",
		data: { mentoring_number : ${mentoring.mentoring_number }, content:$("#content").val()},
		dataType: "json",
		success: function(result){
			console.log(result);
			if(result == 1){
				var list = $($("#reviewss").html());
				list.find("#review_content").html(result.content);
				list.find("#review_id").html(result.id);
				list.find("#reviews_wDate").html(result.w_date);
				$("#reviewsList").append(list);
				location.reload();
			}else{
				alert("구매하신 상품이 아닙니다.");
			}
		}
	})
})

// 삭제
$(document).on("click", "#delR", function(){
	var yn = confirm("삭제 하시겠습니까?");
	var seq = $(this).parent().parent().children().closest('#seq').html();
	$.ajax({
		url: "deleteReviews",
		data:{ "seq" : seq },
		dataType: "json",
		success: function(response){
			location.reload();
		}
	})
})

//수정 페이지 window로 열기
function upR(){
	$(document).on("click", "#upR", function(){
		var seq = $(this).parent().parent().children().closest("#seq").html();
		console.log(seq)
		window.open("getReviewsUp?seq=" + seq,
	                "수정", "width=500, height=500, resizable = no");
	})
}

/* 후기글 한 번 이상 작성하지 못하게 하는 거 */
$(document).on("click", "#content", function(){
	$.ajax({
		url: "getReviewOne",
		data : { mentoring_number : ${mentoring.mentoring_number }},
		dataType: "json",
		success: function(result){
			if(result >= 1){
				alert("이미 작성하신 후기글이 존재합니다.")
			}
		}
	})
})
</script>
<!-- Footer area-->
<jsp:include page="../footer.jsp" />
<!-- Footer area-->
</body>
</html>