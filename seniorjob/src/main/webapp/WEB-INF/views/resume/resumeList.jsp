<%@ page language="java" contentType="text/html; charset=UTF-8"
 	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>         
<!DOCTYPE html>
<html class="no-js"> 


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function delRe(str){
		var yn = confirm("정말 삭제하시겠습니까?");
		if(yn){
			frm.action = "resumeDelete?resume_no="+str;
			frm.submit();
		}
	}
	
	function ckRe(num) {
		var url = "checkReForm?resume_no="+num;
		window.open(url,"","width=500, height=600");
	}
	function resumeSom(){
		var url = "resumeInsertForm";
		window.open(url,"","width=1400,height=900");
	}
	
</script>
<jsp:include page="../topHeader.jsp" />

<body>
	
		        <!-- Body content -->
        <!-- property area -->
      
         <div class="content-area submit-property" style="background-color: #FCFCFC;">&nbsp; 
            <div class="container">
             
 				<div class="row">
				<jsp:include page="../mypage.jsp" />

				
				
				<button type="button" class="btn btn-primary" onclick="resumeSom()">이력서 등록</button>
				
						<form action="" method="post" name="frm">  
				
				<c:forEach  var="resume" items="${list}">
				
				<c:if test="${resume.id eq users.id }">	
					<div
						class="col-md-9 pr-30 padding-top-40 properties-page user-properties">
						<div class="section">

							<section class="post">
								<div class="text-center padding-b-50">
									<h2 class="wow fadeInLeft animated" onclick="location.href='resumeGetForm?resume_no=${resume.resume_no}'" >${resume.resume_title}</h2>
									<div class="title-line wow fadeInRight animated"></div>
								</div>

								<div class="row">
									
									
								</div>
								
								<p class="read-more">
									<a onclick="location.href='resumeUpdateForm?resume_no=${resume.resume_no}'" class="btn btn-default btn-border">수정</a>
									<a onclick="delRe('${resume.resume_no}')" class="btn btn-default btn-border">삭제</a>
									<a onclick="location.href='resumeUpdateForm?resume_no=${resume.resume_no}'" class="btn btn-default btn-border">인쇄/PDF</a>
									<a onclick="ckRe('${resume.resume_no}')" class="btn btn-default btn-border">첨삭요청</a>
									<a onclick="location.href='seeCkRe?resume_no=${resume.resume_no}'" class="btn btn-default btn-border">첨삭보기</a>
								</p>
							</section>
							<hr>



						</div>
					</div>
					</c:if>
				</c:forEach>
                            </form>
				
			</div>
			<!-- row end -->
			<c:if test="${empty list}">
                        <h5>등록된 이력서가 없습니다.</h5>
                        </c:if>
            </div>
        </div>

<jsp:include page="../footer.jsp"></jsp:include>
	
    </body>
</html>
