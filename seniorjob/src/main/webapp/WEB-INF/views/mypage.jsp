<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<style>

</style>
<!--<![endif]-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.ul-none-som {
display:none;
}

</style>
<script>
	$(document).on("click",".toggle-som",function() {
	
		var tar = event.target;
		$(tar).parent().parent().children('ul').slideToggle();
	
	});
</script>
<body>




	<!-- property area -->

	 <div class="col-md-3 p0 padding-top-40">
		<div class="blog-asside-right pr0">
 

			<div class="panel panel-default sidebar-menu wow fadeInRight animated">
				<div class="panel-heading" onclick="location.href='mypageHome'">
					<h3 class="panel-title">My Home</h3>
				</div>
			</div>

			<div class="panel panel-default sidebar-menu wow fadeInRight animated">
				<div class="panel-heading">
					<div class="resumeMenu" id="resM">
						<h3 class="panel-title" >
							<a href="getSearchResumeList"> <span class="toggle-som">이력서</span></a>
						</h3>
						
					</div>
				</div>
			</div>
			<div class="panel panel-default sidebar-menu wow fadeInRight animated">
				<div class="panel-heading">
					<div class="busiMenu" id="busiM" >
						<h3 class="panel-title" ><a href="getSearchBusinessPlanA"><span class="toggle-som"  >사업계획서</span></a></h3>
						
					</div>	
				</div>
			</div>
			<div class="panel panel-default sidebar-menu wow fadeInRight animated">
				<div class="panel-heading">
					<div class="mentoMenu" id="mentoM">
						<h3 class="panel-title"><span class="toggle-som" >멘토링 현황</span></h3>
						<ul class="mentosub ul-none-som">
							<li class="panel panel-default sidebar-menu wow fadeInRight animated">
								<a href="getSearchShopping"> <span class="txt">수강중인 멘토링</span></a>
							</li>
							<li class="panel panel-default sidebar-menu wow fadeInRight animated">
								<a href="getMyMentoringListSom"> <span class="txt">내가 만든 멘토링</span></a>
							</li>
						</ul>
					</div>	
				</div>
			</div>
			<div class="panel panel-default sidebar-menu wow fadeInRight animated">
				<div class="panel-heading">
					<div class="priceMenu" id="priM">
						<h3 class="panel-title"><span class="toggle-som" >나의 결제정보</span></h3>
						<ul class="pricesub ul-none-som">
							<li class="panel panel-default sidebar-menu wow fadeInRight animated">
								<a href="getSearchPay"> <span class="txt">결제내역</span></a>
							</li>
							<li class="panel panel-default sidebar-menu wow fadeInRight animated">
								<a href="cart"> <span class="txt">장바구니</span></a>
							</li>
						</ul>
					</div>	
				</div>
			</div>
			<div class="panel panel-default sidebar-menu wow fadeInRight animated">
				<div class="panel-heading">
					<div class="SelfMenu" id="selfM">
						<h3 class="panel-title"><span class="toggle-som" >개인정보 수정</span></h3>
						<ul class="selfsub ul-none-som">
							<li class="panel panel-default sidebar-menu wow fadeInRight animated">
								<a href="updateUsers"> <span class="txt">개인정보/경력 수정</span></a>
							</li>
							<li class="panel panel-default sidebar-menu wow fadeInRight animated">
								<a href="updateInfo"> <span class="txt">비밀번호 변경</span></a>
							</li>
							<li class="panel panel-default sidebar-menu wow fadeInRight animated">
								<a href="following"> <span class="txt">나의 팔로우 목록</span></a>
							</li>
						</ul>
					</div>	
				</div>
			</div>
		</div>
	</div>
	
	
</body>
</html>