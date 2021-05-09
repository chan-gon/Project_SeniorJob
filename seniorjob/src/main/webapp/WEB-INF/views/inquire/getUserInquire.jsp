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
$(function(){
	$("#btnUpd").on("click", function(){
		//location.href ="updateEmp?employee_id=${emp.employee_id}"
		location.assign("updateUserInquireForm?seq=${list.seq}");

	});
	
	
});

function deleteConfirm(){
	var delCon = confirm("삭제하시겠습니까?");
	if(delCon == true){
		location.href='deleteInquire?seq=${list.seq}';
	}else if(delCon == false){
		
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
    height: 18px;
}
button#btnUpd {
    margin-left: 610px;
}
div#col2 {
    top: 25px;
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
					class="col-md-9 properties-page user-properties">

					<!--작성부분  -->
					<div class="col-md-12 single-property-content ">
                        <div class="row">
                        <br>
                         <div class="col-sm-12" id="col1">
                       </div>
                       <div class="col-sm-12" id="col2">
                        <table class="table">
                        	<tr>
                        		<th colspan="1">제목</th>
                        		<td colspan="7">${list.title }</td>
                        	</tr>
                        	<tr>
								<td>작성일자</td>
								<td><fmt:formatDate value="${list.w_date }" pattern="yyyy-MM-dd"/></td>
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
                        </table>
                       </div>
                            <!-- End description area  -->
                            <input type="hidden" id="preId" value="${num.prev }">
                            <input type="hidden" id="preId2" value="${num.next }">                            
							<div class="post-footer single wow fadeInBottum animated animated" style="visibility: visible;">
                            <!-- 수정/삭제-->
                            <div class="button navbar-center">
								<button class="navbar-btn nav-button wow bounceInRight login animated" onclick="location.href='userInquireList'" data-wow-delay="0.45s" style="visibility: visible; animation-delay: 0.45s; animation-name: bounceInRight;">목록</button>                            
                        		<button class="navbar-btn nav-button wow bounceInRight login animated"  data-wow-delay="0.45s" style="visibility: visible; animation-delay: 0.45s; animation-name: bounceInRight;"id="btnUpd">수정</button>
                        		<button class="navbar-btn nav-button wow fadeInRight animated" onclick="deleteConfirm()" data-wow-delay="0.48s" style="visibility: visible; animation-delay: 0.48s; animation-name: fadeInRight;">삭제</button>
                    		</div>
                    		<br><br><br><br><br><br>
                              <!-- 수정/삭제-->
                            </div>
                            <br>
                              <br>



                            <!-- End video area  -->
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