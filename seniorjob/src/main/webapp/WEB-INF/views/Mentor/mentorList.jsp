<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시니어잡/멘토</title>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

</head>
<style>
	h3{text-align:left}
	#clickMentor{cursor:pointer}
	h1{text-align:center}
	
#sidebar { 
	right: 0;
	padding-top: 110px;
}
#sidebar ul { 
	padding: 10px; 
}
#mainCopy{
	font-size: 40px;
	padding:30px; 
	font-family:'Spoqa Han Sans'; 
	font-weight: 300;
}
/* 
이미지 사이즈 손쉽게 맞추기
참고: https://nykim.work/86 */
#myPhoto{ 
  width: 263px;
  height: 265px;
  object-fit: cover;
}
#mentor_id{
  width: 285px;
}

#mainContents{
	padding-left:10px;
}
#mentoring_kind{
	width:70px; padding:0 5px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;
}

</style>
<body>

<!-- topHeader -->
<jsp:include page="../topHeader.jsp" />
<c:if test="${not empty list }">
	<h1 class="display-4" id="mainCopy">나에게 꼭 맞는 멘토를 찾아보세요!</h1>
	<footer class="blockquote-footer" style="text-align:center">아래 원하는 멘토 프로필 카드를 클릭하면 멘토의 상세 프로필 정보 확인이 가능합니다.</footer>
</c:if>
<c:if test="${empty list }">
	<h1 class="display-4" id="mainCopy">찾으시는 멘토 정보가 없습니다.</h1>
	<button class="btn btn-primary" onclick="history.back(-1)" style="margin:auto; display:block;">뒤로가기</button>
</c:if>
<!-- topHeader -->
<div id="listResult"></div>
          <!-- property area -->
          
        <div class="properties-area recent-property" style="background-color: #FFF;">
            <div class="container">   
                <div class="row">
                    
<!-- 멘토 세부검색(최신순/인기순)_값(list)이 있을 때만 출력 ----------------------------------------------------------------------------------------------------->
				<div class="col-md-9 padding-top-40 properties-page" id="optionVal">
					<div class="section clear">
						<div class="col-xs-10 page-subheader sorting pl0">
							<div class="items-per-page">
							<c:if test="${not empty list }">
								<label for="items_per_page"><b>세부검색 :</b></label>
								<div class="sel">
									<select id="items_per_page" name="per_page" onchange="optionSelect(this)">
										<option value="">선택</option>
										<option value="최신순">최신순</option>
										<option value="인기순">인기순</option>
									</select>
								</div>
							 </c:if>	
							</div>
							<!--/ .items-per-page-->
						</div>
					</div>
					<!-- End of 멘토 세부검색(최신순/인기순) -->
				
					<!-- 멘토 리스트 출력 -->
					<div class="section clear" id="mtList">
						<div id="list-type" class="proerty-th">
						<c:if test="${not empty list }">
							<c:forEach var="mentor" items="${list }">
							<form name="mentorListFrm">
								<%-- <div class="col-sm-6 col-md-4 p0" id="mentor_id" name="mentor_id" onclick="location.href='getMentor?mentor_id=${mentor.mentor_id}'" > --%>
								<div class="col-sm-6 col-md-4 p0" id="mentor_id" name="mentor_id" onclick="location.href='getMentor?mentor_id=${mentor.mentor_id}'" style="cursor:pointer" >
									<div class="box-two proerty-item">
										<div class="item-thumb">
										<c:if test="${not empty mentor.mentor_photo }">
											<img src="image/${mentor.mentor_photo }" id="myPhoto">
										</c:if>
										<c:if test="${empty mentor.mentor_photo }">
											<img src="resources/assets/img/mentor/photoDefault.jpg">
										</c:if>
										</div>	

										<div class="item-entry overflow" id="mainContents">
											<h5 id="name" >${mentor.usersVO.name }<b class="property-info-unit">멘토</b></h5>
											<h5 id="mentor_duty" >${mentor.mentor_duty }<b class="property-info-unit">직무</b></h5>
											<div class="dot-hr"></div>
											<span class="pull-left"><b id="mentoring_kind" ><b class="property-info-unit" >멘토링 종류:</b> ${mentor.mentoring_kind }</b></span>
										</div>
										<div class="item-entry overflow">
											<span class="pull-left"><b id="mentoring_location" ><b class="property-info-unit">멘토링 지역:</b> ${mentor.mentoring_location }</b></span>
										</div>
										<div class="item-entry overflow">
											<span class="pull-left"><b id="mentoring_age" ><b class="property-info-unit">멘토링 연령:</b> ${mentor.mentoring_age }</b></span>
										</div>
									</div>
								</div>
							</form>	
							</c:forEach>
						</c:if>	
						</div>
					</div>
				</div>
<!-- End of 멘토 리스트 출력 ----------------------------------------------------------------------------------------------------->

<!-- 플로팅 배너_값(list)이 있을 때만 출력-->
					<c:if test="${not empty list }">
                    <div class="col-md-3 p0 padding-top-40" id="sidebar">
					<div class="blog-asside-right">
						<div class="panel panel-default sidebar-menu wow fadeInRight animated">
							<div class="panel-heading">
								<h3 class="panel-title">멘토 등록</h3>
							</div>
							<form name="mentorRegisterForm" class="form-inline">
							<div class="panel-body search-widget">
								<input type="hidden" name="id" id="id" value="${users.id }">
								<div class="panel-body search-widget">
								
									<div class="row">
										<div class="col-xs-12">
												<c:if test="${empty users }">
                                                    <input class="button btn largesearch-btn" value="멘토 등록하기" type="button" style="background:#FDC600; color:#fff" data-toggle="modal" data-target="#myModal">
                                                </c:if>
                                                <c:if test="${not empty users }">
                                                    <input class="button btn largesearch-btn" value="멘토 등록하기" type="button" onclick="MentorRegister()" style="background:#FDC600; color:#fff">
                                                </c:if>
										</div>
									</div>
								
								</div>
								</div>
							</form>
						</div>
					</div>
				</div>
                </c:if>
<!-- End of 플로팅 배너 ----------------------------------------------------------------------------------------------------->
                </div>           
            </div>
        </div>
        
<!-- TOP버튼 / https://seo6285.tistory.com/189 ----------------------------------------------------------------------------------------------------->
      	<a style="display:scroll;position:fixed;bottom:20px;right:20px;" href="#" title=”맨 위로">맨 위로<i class="fas fa-arrow-up"></i></a> 
<!-- End of TOP버튼 ----------------------------------------------------------------------------------------------------->
      	
<!-- 모달 팝업 ----------------------------------------------------------------------------------------------------->
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
<!-- End of 모달 팝업 ----------------------------------------------------------------------------------------------------->

<!-- Footer area-->
<jsp:include page="../footer.jsp" />
<!-- Footer area-->
	
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>


	// 멘토 등록
	function MentorRegister(){
		var param = $('#id').val();
		var mentorRegisterForm = document.mentorRegisterForm;
		mentorRegisterForm.action = "mentorRegisterCheck?id="+param;
		mentorRegisterForm.submit();
	}
	
	// 멘토링 등록
		function MentoringRegister(){
			var param = $('#id').val();
			var mentorRegisterForm = document.mentorRegisterForm;
			mentorRegisterForm.action = "MentoringRegister?id="+param;
			mentorRegisterForm.submit();
		}
	
	// 세부검색(최신순, 인기순)
	function optionSelect(obj){
		var param = $('#items_per_page').val();
		$.ajax({
			url: "optionValueChk",
			data: {"optionValue": param},
			dataType: "json",
			success:function(result){
				$('#mtList').empty(); // 태그 내부 내용 삭제
				var response = result.list;
				$.each(response, function(i){
				var div2 = $("<div>").attr({ 'id':"list-type",'class':"proerty-th" });
				var div3 = $("<div>").attr({ 'class':"col-sm-6 col-md-4 p0",id:"mentor_id"}).data('id',response[i].mentor_id);
				var div4 = $("<div>").attr("class", "box-two proerty-item");
				var div5 = $("<div>").attr("class","item-thumb").append($("<img>").attr("src","image/"+response[i].mentor_photo));
				
				var div6 = $("<div>").attr("class","item-entry overflow");
				
					var h5_1 = $("<h5>").attr("id","name").text(response[i].usersVO.name);
						var bh_1 = $('<b>').attr('class','property-info-unit').text("멘토");
					
					var h5_2 = $("<h5>").attr("id","mentor_duty").text(response[i].mentor_duty);
						var bh_2 = $('<b>').attr('class','property-info-unit').text("직무");
					
					var div7 = $("<div>").attr("class","dot-hr");
					
					var span_1 = $("<span>").attr("class","pull-left");
						var sb_1 = $("<b>").attr("id","mentoring_kind").text(response[i].mentoring_kind);
							var sb_11 = $("<b>").attr('class','property-info-unit').text("멘토링 종류:");			
					
					var span_2 = $("<span>").attr("class","pull-left");
						var sb_2 = $("<b>").attr("id","mentoring_location").text(response[i].mentoring_location);
							var sb_12 = $('<b>').attr('class','property-info-unit').text("멘토링 지역:");				
					
					var span_3 = $("<span>").attr("class","pull-left");
						var sb_3 = $("<b>").attr("id","mentoring_age").text(response[i].mentoring_age);
							var sb_13 = $("<b>").attr('class','property-info-unit').text("멘토링 연령:");
				
							
				h5_1.append(bh_1);
				h5_2.append(bh_2);
				
				span_1.append(sb_11, sb_1);
				span_2.append(sb_12, sb_2);
				span_3.append(sb_13, sb_3);
						
				div6.append(h5_1, h5_2, div7, span_1, span_2, span_3);
				div4.append(div5, div6);
				div3.append(div4);
				div2.append(div3);
				$('#mtList').append(div2);
				});
			} // end of success
		}); // end of ajax
		
		$('#mtList').on('click','#mentor_id',function(){
		var param = $(event.target).closest('#mentor_id').data('id');
		location.href='getMentor?mentor_id='+param;
	});
		
}
	
	/* 플로팅 배너 */
	$(function() {
		var offset = $("#sidebar").offset(); // 선택요소 좌표 가져오기
		var topPadding = 300; 
		$(window).scroll(function() {
			if ($(window).scrollTop() > offset.top) { // 윈도우 스크롤바가 sidebar 보다 높이 위치한다면
				$("#sidebar").stop().animate({ // 더이상 따라오지 않고 멈추기
					marginTop: $(window).scrollTop() - offset.top + topPadding
				});
			} else{ // 윈도우 스크롤바가 sidebar 보다 낮게 위치한다면
				$("#sidebar").stop().animate({
					marginTop: 0
				});
			}; 
		});
	});
	
</script>