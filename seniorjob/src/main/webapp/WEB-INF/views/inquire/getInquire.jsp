<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<jsp:include page="../topHeader.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
/* 	$(document).ready(function(){ 
		$('#btnUpd').click(function() { 
			var result = confirm('답변작성하시겠습니까?');
			if(result) { 
				//yes 
				location.replace('insertAnswerPorm?seq=${list.seq}'); 
				} else {
				//no 
				}
	});
}); */
	function deleteConfirm(){
		var delCon = confirm("질문 및 답변을 삭제하시겠습니까?");
		if(delCon == true){
			$(function(){
				var seqValue= $('#seqHidden').val();
				
				$.ajax({
					url:"deleteAdmin",
					type: "POST",
					data :{seq : seqValue},
					success: function(result){
						location.href="/getInquireList";
						window.alert("질문 및 답변이 삭제되었습니다.");
					}
				});
			});
		}else if(delCon == false){
		}
	}	
	function insertAnswer(){
		var insCon = confirm("답변을 등록하시겠습니까?");
		var str = document.getElementById('title1');
		var str2 = $('textarea#content1');
		
		if(insCon == true){
			
			if( str.value == null || str.value=="" || str2.val() == null ||  str2.val()==""){
				window.alert("내용을 입력해주세요.");
				return false;
			}else{
			$(function(){
				var titleValue =$('#title1').val();
				var contentValue = $("textarea#content1").val();
				var seqValue = $('#seqHidden').val();
				var idValue = $('#idHidden').val();
				
				$.ajax({
					url:"insertAnswer",
					type: "POST",
					data :{seq : seqValue, title : titleValue, content : contentValue, id: idValue },
					success: function(result){
						location.href="getInquireList";
						window.alert("답변이 등록되었습니다.");
					}
				});
				
			});
			}	
		}else if(insCon ==false){
			
		}
		
	}	
	
</script>
<style>
th {
    width: 96px;
}
td#content1 {
    height: 324px;
}
div#col1 {
    
}
button#btnUpd {
    margin-left: -1px;
}
div#col2 {
    top: 25px;
}
div#optionVal {
    top: -18px;
}
h4#modalTitle {
    text-align: center;
    margin-top: -26px;
}
button#answerBtn1 {
    margin-right: 98px;
}
button.btn.btn-default.answer {
    margin-right: 151px;
}
</style>
<body>

	<!-- property area -->
	<div class="content-area recent-property"
		style="background-color: #FFF;">
		<div class="container">
			<div class="row">
				<!--왼쪽 -->
				<jsp:include page="../Service_Center/new_sevice_left.jsp"></jsp:include>
				<!--왼쪽  -->
				<div class="col-md-1 pr-30 padding-top-40 properties-page user-properties">
				</div>
				<div id="optionVal"
					class="col-md-9 pr-30 padding-top-40 properties-page user-properties">

					<!--작성부분  -->
					<div class="col-md-12 single-property-content ">
						<div class="row">
							<br>
							<div class="col-sm-12" id="col2">
								<table class="table">
									<tr>
										<th colspan="1">제목</th>
										<td colspan="7">${list.title }</td>
									</tr>
									<tr>
										<td>작성일자</td>
										<td><fmt:formatDate value="${list.w_date }"
												pattern="yyyy-MM-dd" /></td>
									</tr>
									<tr>
										<td>분류</td>
										<td>${list.category_a }</td>

									</tr>
									<tr>
										<td>작성자</td>
										<td>${list.id }</td>
									</tr>
									<tr>
										<td rowspan="10" id="content1">내용</td>
										<td rowspan="10" id="content2">${list.content }</td>
									</tr>
									<input type="hidden" value="${list.seq }" id="seqHidden"> <!-- 글번호 -->
									<input type="hidden" value="${id }" id="idHidden"> <!-- 관리자 id -->
								</table>
							</div>

							<!-- .property-meta -->
							<br> <br>
							<!-- End description area  -->
							<input type="hidden" id="preId" value="${num.prev }"> <input
								type="hidden" id="preId2" value="${num.next }">
							<div
								class="post-footer single wow fadeInBottum animated animated"
								style="visibility: visible;">
								<!-- 수정/삭제-->
								<div class="button navbar-left">
								<button class="navbar-btn nav-button wow bounceInRight login animated" onclick="location.href='getInquireList?optionValue='" data-wow-delay="0.45s" style="visibility: visible; animation-delay: 0.45s; animation-name: bounceInRight;">목록</button>
								</div>
								<div class="button navbar-right">
								      
								   <c:if test="${list.status  ne '답변완료' }">
									<button class="navbar-btn nav-button wow bounceInRight login animated" data-wow-delay="0.45s"
										style="visibility: visible; animation-delay: 0.45s; animation-name: bounceInRight;"
										id="btnUpd" data-toggle="modal" data-target="#myModal">답변 등록</button>
									</c:if>	
									<button class="navbar-btn nav-button wow fadeInRight animated"
										onclick="deleteConfirm()"
										data-wow-delay="0.48s"
										style="visibility: visible; animation-delay: 0.48s; animation-name: fadeInRight;">삭제</button>
								</div>
								<br> <br> <br> <br> <br> <br>
								<!-- 수정/삭제-->
							</div>
							<br> <br>
							<hr>



							<!-- End video area  -->
						</div>
					</div>

					<!-- Modal -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel"></h4>
								</div>
								<div class="modal-body" id="table_body">
								<!--실제 내용 부분  -->
								<h4 id="modalTitle"><strong>답변 등록하기</strong></h4>
								<table class="table table-hover" id="modal-body">
												<tr>
														<td>제목</td>
														<td><input type="text" id="title1"></td>							
												</tr>
												<tr>
														<td>내용</td>
														<td><textarea id="content1"style="resize: none; width:500px; height:350px; "></textarea></td>							
												</tr>									
								</table>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default answer"  id="answerBtn1"name="answerButton"  onclick="insertAnswer()">작성완료</button>
									<button type="button" class="btn btn-default answer" name="answerButton" data-dismiss="modal">취소</button>
									
										
								</div>
								
								
							</div>
						</div>
					</div>



					<!--작성부분  -->
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
