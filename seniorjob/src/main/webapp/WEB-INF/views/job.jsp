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
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

<jsp:include page="topHeader.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function openWindowPop(url, name){
    var options = 'top=10, left=950, width=1100, height=900, status=no, menubar=no, toolbar=no, resizable=no';
    window.open(url, name, options);
}

function getURLParams(url) {
    var result = {};
    url.replace(/[?&]{1}([^=&#]+)=([^&#]*)/g, function(s, k, v) { result[k] = decodeURIComponent(v); });
    return result;
}

 $(function(){
	 for (var i = 11; i < 27; i++) {
		 console.log(i);
		 console.log(getURLParams(location.search).cd);
	 	if(getURLParams(location.search).cd == i){
			$('#cd'+i).attr('class','btn btn-primary btn-lg')
			
		}else{ 
			$('#cd'+i).attr('class','btn btn-default btn-lg')
		}
	}
	 
	
}); 



</script>
<style>
#cd11{
 margin-left:20px;
}
#cd12{
 margin-left:35px;
}
#cd13{
 margin-left:35px;
}
#cd14{
 margin-left:35px;
}
#cd15{
 margin-left:35px;
}
#cd16{
 margin-left:35px;
}
#cd17{
 margin-left:35px;
}
#cd18{
 margin-left:35px;
}
#cd19{
 margin-left:20px;
}
#cd20{
 margin-left:35px;
}
#cd21{
 margin-left:35px;
}
#cd22{
 margin-left:35px;
}
#cd23{
 margin-left:35px;
}
#cd24{
 margin-left:35px;
}
#cd25{
 margin-left:35px;
}
#cd26{
 margin-left:35px;
}
div#btnList .btn-primary{

}
div#btnList .btn-default{
	border-radius: 1px;
    padding: 10px 20px;
    border: 1px solid gray;
    color: #000;
    background-color: white;
    border-color: 1px solid #F0F0F0;
    font-weight: 600;

}
</style>
<body>
	<!-- property area -->
	<!-- property area -->
	<div class="content-area recent-property" style="background-color: #FFF;">
		<div class="container">
			<div class="row">
			
				<jsp:include page="Service_Center/sevice_left.jsp"></jsp:include>
				

				<div class="col-md-10 pr-40  properties-page user-properties">
				<div class="section additional-details" id="btnList">
				<h4><strong>지역 선택</strong></h4>
				<hr>
				<form action="job">
						
						<button type="submit" class="btn btn-primary btn-lg" formaction="job" id="cd11"name="cd" value='11'>서울</button>
						<button type="submit" class="btn btn-default btn-lg"  formaction="job" id="cd12"name="cd" value='12'>부산</button>
						<button type="submit" class="btn btn-default btn-lg" formaction="job" id="cd13"name="cd" value='13'>대구</button>
						<button type="submit" class="btn btn-default btn-lg" formaction="job" id="cd14"name="cd" value='14'>인천</button>
						<button type="submit" class="btn btn-default btn-lg" formaction="job" id="cd15"name="cd" value='15'>광주</button>
						<button type="submit" class="btn btn-default btn-lg" formaction="job" id="cd16"name="cd" value='16'>대전</button>
						<button type="submit" class="btn btn-default btn-lg" formaction="job" id="cd17"name="cd" value='17'>울산</button>
						<button type="submit" class="btn btn-default btn-lg" formaction="job" id="cd18"name="cd" value='18'>경기</button>
						<br><hr>
						<button type="submit" class="btn btn-default btn-lg" formaction="job" id="cd19"name="cd" value='19'>강원</button>
						<button type="submit" class="btn btn-default btn-lg" formaction="job" id="cd20"name="cd" value='20'>충북</button>
						<button type="submit" class="btn btn-default btn-lg" formaction="job" id="cd21"name="cd" value='21'>충남</button>
						<button type="submit" class="btn btn-default btn-lg" formaction="job" id="cd22"name="cd" value='22'>전북</button>
						<button type="submit" class="btn btn-default btn-lg" formaction="job" id="cd23"name="cd" value='23'>전남</button>
						<button type="submit" class="btn btn-default btn-lg" formaction="job" id="cd24"name="cd" value='24'>경북</button>
						<button type="submit" class="btn btn-default btn-lg" formaction="job" id="cd25"name="cd" value='25'>경남</button>
						<button type="submit" class="btn btn-default btn-lg" formaction="job" id="cd26"name="cd" value='26'>제주</button>
						<hr>
				</form>
				<table class="table table-hover">
					<tr>
						<th>기업명</th>
						<th align="center" rowspan="1" colspan="3">채용제목</th>
						<th>근무조건</th>
						<th>마감일</th>
					</tr>

					<c:forEach items="${job }" var="a">
						<tr>
							<td><strong>${a.companyName }</strong></td>
							<td colspan="3" >
							<p><a href="javascript:openWindowPop('${a.companyUrl }', 'popup');">
							${a.incruit }
							</a></p>
							${a.incruit2nd }</td>
							<td>${a.incruit3nd }</td>
							<td>${a.incruitDday }</td>
						</tr>
					
					</c:forEach>
				</table>


					
				</div>
				
				
			</div>
		</div>

	</div>
</div>
	<!-- TOP버튼 / https://seo6285.tistory.com/189-->
    <a style="display:scroll;position:fixed;bottom:20px;right:20px;" href="#" title=”맨 위로">맨 위로<i class="fas fa-arrow-up"></i></a> 
    <!-- TOP버튼 -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>