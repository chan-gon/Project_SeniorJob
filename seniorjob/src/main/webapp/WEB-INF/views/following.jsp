<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<jsp:include page="topHeader.jsp"></jsp:include>
<body>
	<div class="content-area recent-property padding-top-40"
		style="background-color: #FFF;">
		<div class="container">
			<div class="row">
				<jsp:include page="mypage.jsp"></jsp:include>
				<div align="center">
					<h2>나의 팔로우 목록</h2>
					<hr>
				</div>
				<c:forEach items="${list }" var="follow">
					<c:if test="${follow.id eq users.id }">
					
					<div class="col-sm-6 col-md-3">
                            <div class="box-two proerty-item">
                                <div class="item-thumb">
                                    <a href="getMentor?mentor_id=${follow.mentor_id }"><img src="resources/assets/img/demo/property-1.jpg"></a>
                                </div>
                                <div class="item-entry overflow">
                                    <h5><a href="getMentor?mentor_id=${follow.mentor_id }">${follow.mentor_id }</a></h5>
                                    <div class="dot-hr"></div>
                                    <span class="pull-left"><b>팔로우 상태 :</b> 팔로우중 </span>
                                </div>
                            </div>
                        </div>
						
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>


	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>