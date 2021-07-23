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
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/topHeader.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
	
<style>
div#optionVal {
    top: -44px;
}

</style>
<script >
	function submitBtn(){
		var insCon = confirm("문의를 등록하시겠습니까?");
		var str = document.getElementById('title');
		var str2 = document.getElementById('category_a');
		var str3 = document.getElementById('summernote');
		
		if(insCon == true){
			if(str.value == '' || str.value == null || str2.value == '' || str2.value == null || str3.value == null || str3.value == '' ){
				window.alert("내용을 입력해주세요.");
				return false;
		}else{
			document.getElementById('frm').submit();
		}
	}else if(insCon ==false){
		
	}
}		
</script>	
<body>
	<!-- property area -->
	<div class="content-area recent-property"
		style="background-color: #FFF;">
		<div class="container">
			<div class="row">
				<div
					class="col-md-12 pr-30 padding-top-40 properties-page user-properties"></div>
				<!--왼쪽 -->
				<jsp:include page="../Service_Center/new_sevice_left.jsp"></jsp:include>
				<!--왼쪽  -->
				<div class="col-md-1 pr-30 padding-top-40 properties-page user-properties">
				</div>
				<div id="optionVal"
					class="col-md-9 pr-30 padding-top-40 properties-page user-properties">

					<!--작성부분  -->

					<div align="center">
						<h2>문의 등록하기</h2>
					</div>
					<hr>
					<form id="frm" action="insertInquire" method="post"
						name="frm">
						<h3>글 작성</h3>

						<div class="col-sm-12">
							<div class="form-group">
								<label>제목</label> <input type="text" class="form-control"
									id="title" name="title" size=10 required="required">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>작성자</label> <input type="text" class="form-control"
									id="id" name="id" value="${id }" readonly="readonly">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>작성일자</label> <input type="date" class="form-control"
									id='currentDate' name="resume_email" readonly="readonly" >
							</div>
						</div>
						<input type="hidden" name="category_b" id="category_b"
							value="없음">
						<div class="col-sm-6">
							<div class="form-group">
								<select name="category_a" id="category_a" required="required">
									<option value="">카테고리</option>
									<option value="결제">결제</option>
									<option value="환불">환불</option>
									<option value="신청">신청</option>
									<option value="취소">취소</option>
									<option value="기타">기타</option>
								</select>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label>내용</label>
								<textarea id="summernote" name="content" required="required"></textarea>
								<script>
									$('#summernote').summernote({
										placeholder : 'Hello stand alone ui',
										tabsize : 2,
										height : 400
									});
								</script>
								<br>
							</div>
						</div>
						<br> <br> <br> <br> <br> <br> <br>
						<div class="col-sm-6 text-right">
							<button class="btn btn-primary" type="button" onclick="submitBtn()">
								<i class="fa fa-bars"></i> 등록하기
							</button>
						</div>
						<div class="col-sm-6 text-left">
							<a href="serviceCenterQna" onclick="return confirm('목록으로 돌아가시겠습니까?');">
							<button type="button"class="btn btn-primary" >
								<i class="fa fa-reply"></i>
								 FAQ
							</button>
							</a>
						</div>
						<br> <br> <br> <br> <br>
						<br>
						<br>
					</form>




					<!--작성부분  -->
				</div>
			</div>
		</div>
	</div>
		<script>
		document.getElementById('currentDate').value = new Date().toISOString()
				.substring(0, 10);

		$(document).ready(function() {
			//여기 아래 부분
			$('#summernote').summernote({
				height : 300, // 에디터 높이
				minHeight : null, // 최소 높이
				maxHeight : null, // 최대 높이
				focus : true, // 에디터 로딩후 포커스를 맞출지 여부
				lang : "ko-KR", // 한글 설정
				placeholder : '최대 2048자까지 쓸 수 있습니다' //placeholder 설정

			});
		});
	</script>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>