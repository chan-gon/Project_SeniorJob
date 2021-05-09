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
<script>
/*이전 글, 다음 글 기능  */
function pagePre() {
	var sel = document.getElementById('preId').value;
	if(sel == 0){
		window.alert("이전 글이 없습니다");
	}else{
	location.href="getService_Center?seq=${num.prev }";
	}
	}
function pageNext() {
	var sel = document.getElementById('preId2').value;
	if(sel == 0){
		window.alert("다음 글이 없습니다");
	}else{
	location.href="getService_Center?seq=${num.next }";
	}
	}
function deleteConfirm(){
	var delCon = confirm("삭제하시겠습니까?");
	if(delCon == true){
		location.href='deleteService_Center?seq=${gongji.seq}';
	}else if(delCon == false){
		
	}
	
}	
	
$(function(){
	$("#btnUpd").on("click", function(){
		//location.href ="updateEmp?employee_id=${emp.employee_id}"
		location.assign("updateService_CenterForm?seq=${gongji.seq}");

	});
	
	
});
	
/*이전 글, 다음 글 기능  */
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
div#btn2 {
    margin-top: 15px;
}
</style>
<body>
<div class="content-area recent-property"
		style="background-color: #FFF;">
            <div class="container">
                <div class="row">
                    <jsp:include page="new_sevice_left.jsp"></jsp:include>
 
                    <div class="col-md-1 padding-top-40 properties-page user-properties">
                    </div>
                    <div class="col-md-9  properties-page user-properties">
                        <div class="row">
                        
                        
                        <br>
                        <br>
                        <div class="col-sm-12" id="col1">
                       </div>
                       <div class="col-sm-12">
                        <table class="table">
                        	<tr>
                        		<th colspan="1">제목</th>
                        		<td colspan="7">${gongji.title }</td>
                        	</tr>
                        	<tr>
								<td>작성일자</td>
								<td><fmt:formatDate value="${gongji.w_date }" pattern="yyyy-MM-dd"/></td>
                        	</tr>
                        	<tr>
                        		<td>분류</td>
								<td>${gongji.category_b }</td>
                        	
                        	</tr>
                        	<tr>
                        		<td>조회수</td>
								<td>${gongji.click }</td>
                        	</tr>
                        	<tr>
                        		<td>작성자</td>
								<td>${gongji.id }</td>
                        	</tr>
                        	<tr>
                        		<td rowspan="10" id="content1">내용</td>
                        		<td rowspan="10" id="content2">${gongji.content }</td>
                        	</tr>
                        </table>
                       </div>

                            <!-- .property-meta -->
							<br><br>
                        <div class="section">
                        </div>
                            <!-- End description area  -->
                            <input type="hidden" id="preId" value="${num.prev }">
                            <input type="hidden" id="preId2" value="${num.next }">                            
                        <!-- 수정/삭제-->
                        <div class="button navbar-left" id="btn2">
                        		<button class="navbar-btn nav-button wow bounceInRight login animated"  onclick="location.href='serviceCenter'" data-wow-delay="0.45s" style="visibility: visible; animation-delay: 0.45s; animation-name: bounceInRight;" id="btn3">목록</button>
                       </div>
                        <c:if test="${users.auth eq 'ADMIN'}">
                       <div class="button navbar-right">
                        		<button class="navbar-btn nav-button wow bounceInRight login animated"  data-wow-delay="0.45s" style="visibility: visible; animation-delay: 0.45s; animation-name: bounceInRight;"id="btnUpd">수정</button>
                        		<button class="navbar-btn nav-button wow fadeInRight animated" onclick="deleteConfirm()" data-wow-delay="0.48s" style="visibility: visible; animation-delay: 0.48s; animation-name: fadeInRight;">삭제</button>
                       </div>
                       </c:if>
                    		<br><br><br><br><br><br>
                              <!-- 수정/삭제-->
                       <div class="col-sm-12" id="col2">       
                            <br>
                              <br>
                            <hr>
                            <p onclick="pagePre()"><이전 글><c:if test="${num.prev eq 0 }">이전 글이 없습니다.
                            </c:if><c:if test="${num.prev ne 0 }">${num.prev_title }</c:if>
                            </p>
                            <hr>			
                             <p onclick="pageNext()"><다음 글><c:if test="${num.next eq 0 }">다음 글이 없습니다.</c:if><c:if test="${num.next ne 0 }">${num.next_title }</c:if></p>
                            <hr>
                      </div>    			



                            <!-- End video area  -->
                        </div>
                    </div>              
                 
                </div>

            </div>
        </div>

<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>