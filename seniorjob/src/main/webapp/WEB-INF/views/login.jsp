<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="topHeader.jsp"></jsp:include>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(function(){
	$("#findpw").click(function(){
	window.open("findpw", "a", "width=400, height=400, left=100, top=50"); 
	})

	$("#findId").click(function(){
	window.open("findId", "a", "width=400, height=400, left=100, top=50"); 
	})
})



</script>
<style>
.error {color: red;}
.login-blocks form input{border-bottom: 3px solid #fbb530;}
</style>  
</head>
    <body>

<div class="content-area error-page" style="background-color: #FCFCFC; padding-bottom: 55px;">
            <div class="container">
                <div class="row">
                <div class="col-md-12 pr-30 padding-top-40">
                <div class="col-md-3">
                </div>
                <div class="col-md-6">
                    <div class="box-for overflow">                         
                        <div class="col-md-12 col-xs-12 login-blocks">
                            <h2 style="text-align: center; width: 500px">Login</h2> 
                            <form:form modelAttribute ="usersVO" action="loginProc" method="post" name="UsersVO">
                                <div class="form-group">
                                    <label for="id"></label>
                                    <form:input path="id" placeholder="아이디 입력" /><form:errors path="id" cssClass="error"/>${message}
                                </div>
                                <div class="form-group">
                                    <label for="password"></label>
                                    <form:input path="password" type="password" placeholder="비밀번호 입력"/><form:errors path="password" cssClass="error"/><br>${message2}
                                </div>
                                <div class="text-center">
									<button type="submit" class="btn btn-default btn-lg btn-block">Log in</button>
                                </div>
                                <br>
                            </form:form>
                           
                            <button style="width: 505.5px; height: 46px"class="btn btn-primary btn-lg btn-block"   type="button" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=3cab068ec0c75ace569fa7942cb9c9f5&redirect_uri=http://localhost/kakaologin&response_type=code'">
                            카카오 로그인
                            </button> 
                             <br>
                            <button id="findId" name="findId" style="width: 505.5px; height: 46px"class="btn btn-info" type="button">
                           	아이디 찾기
                            </button> 
                            <button id="findpw" name="findpw" style="width: 505.5px; height: 46px"class="btn btn-info" type="button">
                            비밀번호 찾기
                            </button> 
                            
                        </div>
                    </div>
                </div>
                </div>
                </div> 
            </div>
        </div> 

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>