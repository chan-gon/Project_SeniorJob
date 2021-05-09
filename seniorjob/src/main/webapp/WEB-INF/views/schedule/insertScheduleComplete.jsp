<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js"> <!--<![endif]-->
 <jsp:include page="../topHeader.jsp"></jsp:include>
    <body>

<div class="content-area error-page" style="background-color: #FCFCFC; padding-bottom: 55px;">
            <div class="container">
                <div class="row">
                <jsp:include page="../mypage.jsp"></jsp:include>
                    <div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
                        <h2 class="error-title">멘토링 요청 완료</h2>
                        <p>요청이 완료되었습니다.</p>
                        <a href="index.html" class="btn btn-default">Home</a>                        
                    </div>
                </div> 
            </div>
        </div> 

<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>