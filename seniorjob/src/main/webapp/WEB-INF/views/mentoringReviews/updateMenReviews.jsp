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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<body>
	<!-- property area -->
	<div class="content-area recent-property padding-top-40"
		style="background-color: #FFF;">
		<div class="container">
			<div class="row">
		<div
					class="col-md-9 pr-30 padding-top-40 properties-page user-properties">
					<!--                      <div class="" id="contact1">                         -->
					<!-- /.row -->
					<div align="center">
						<h2>후기 수정</h2>
						<input type="hidden" value="${review.seq }">
					</div>
					<hr>
					<form id="frm"  method="post" name="frm" >
							<h3>글 작성</h3>
							<%-- <div class="col-sm-12">
								<div class="form-group">
									<label>제목</label> 
									<input type="text" class="form-control" id="title" name="title" size=10 value="${review.title }">
								</div>
							</div> --%>
							<div class="col-sm-6">
								<div class="form-group">
									<label>작성자</label> 
									<input type="text" class="form-control" id="id" name="id" value="${review.id }" readonly="readonly">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label>작성일자</label> 
									<input type="text" class="form-control" name="" readonly="readonly" value="<fmt:formatDate value="${review.w_date }" pattern="YYYY-MM-dd"/>">
								</div>
							</div>
							<%-- <div class="col-sm-6">
								<div class="form-group">
									<select name="category_b" id="category_b">
										<option value="">${menslist.category_b }</option>
										<option value="신청">신청</option>
										<option value="취소">취소</option>
										<option value="기타">기타</option>
									</select>
								</div>
							</div> --%>
							<div class="col-sm-12">
								<div class="form-group">
									<label>내용</label> <br>
									<textarea id="content" name="content" rows="10" cols="90" style="resize: none;">${review.content }</textarea>
								</div>
							</div>
							<br> <br> <br> <br> <br> <br> <br>
							<div class="col-sm-6 text-right">
                                    <a onclick="updateR('${review.seq}')"> 등록하기</a>
                            </div>
                            <div class="col-sm-6 text-left">
                                   <button class="btn btn-primary" onclick="return confirm('목록으로 돌아가시겠습니까?');"><i class="fa fa-reply"></i>
                               
                                   		<!-- <a href="mentoringReviews">
                                   			목록으로
                                   		</a> -->
                                   </button>
                            </div>
							<br> <br> <br> <br>
								<br><br><br>
					</form>
				</div>
				
				<!-- /.row -->
			</div>
		</div>
	</div>
<script>
// 수정 action
function updateR(str){
	var yn = confirm("수정하시겠습니까?");
	if(yn){
		frm.action = "updateReviews?seq="+ str;
		frm.submit();
		alert("수정 완료!")
		// 부모창 새로고침
		opener.parent.location.reload();
	}
}
</script>
	<!--         </div> -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>