<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<jsp:include page="../topHeader.jsp"></jsp:include>



<!-- property area -->
<div class="content-area recent-property"
	style="background-color: #FFF;">
	<div class="container">
		<div class="row">

			<jsp:include page="../mypage.jsp" />
			<div class="col-md-9 pr-30 padding-top-40 properties-page user-properties  profiel-container">
			

				<form action="updateMentoring" method="post">
					<input type="hidden" id="mentoring_number", name="mentoring_number" value="${menDetail.mentoring_number}">
					<div class="profiel-header">
						<h3>
							<b>멘토링</b> 수정 <br> 
							<small></small>
						</h3>
						<hr>
					</div>

					<div class="clear">

						<div class="col-sm-10 col-sm-offset-1">
							<div class="form-group">
								<label>멘토링 코스 이름 </label> <input
									name="mentoring_name" type="text" value="${menDetail.mentoring_name }" class="form-control" >
							</div>
							<div class="form-group">
								<label>멘토링 코스 정원</label> <input name="mentoring_limit" type="number" value="${menDetail.mentoring_limit }" class="form-control">
							</div>
							<div class="form-group">
								<label>멘토링 코스 내용</label> <input name="mentoring_content" type="text" value="${menDetail.mentoring_content }" class="form-control">
							</div>
							<%-- <div class="form-group">
								<label>멘토링 코스 이미지</label> <input name="mentoring_photo" type="text" value="${menDetail.mentoring_photo }" class="form-control">
							</div> --%>
							<div class="form-group">
								<label>멘토링 코스 금액</label> <input name="mentoring_price" type="number" value="${menDetail.mentoring_price }" class="form-control">
							</div>
							
							
							<%-- <div class="form-group">
								<label>멘토링 코스 시작일</label> <input name="mentoring_begin_date" type="date" value="${menDetail.mentoring_begin_date }" class="form-control">
							</div>
							<div class="form-group">
								<label>멘토링 코스 종료일</label> <input name="mentoring_end_date" type="date" value="${menDetail.mentoring_end_date }" class="form-control">
							</div> --%>
						</div>
						<div class="col-sm-10 col-sm-offset-1">
							<button type="submit" class="btn btn-primary">수정</button>
						</div>

					</div>




				</form>

			</div>

		</div>
		<!-- end row -->

	</div>
</div>

<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>