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
<jsp:include page="topHeader.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function openWindowPop(url, name){
    var options = 'top=10, left=450, width=1300, height=900, status=no, menubar=no, toolbar=no, resizable=no';
    window.open(url, name, options);
}

function getURLParams(url) {
    var result = {};
    url.replace(/[?&]{1}([^=&#]+)=([^&#]*)/g, function(s, k, v) { result[k] = decodeURIComponent(v); });
    return result;
}

$(function(){
		 console.log(getURLParams(location.search).keyword);
	 	if(getURLParams(location.search).keyword == '고용정책'){
			$('#k1').attr('class','btn btn-primary btn-lg')
			$('#k2').attr('class','btn btn-default btn-lg')
			$('#k3').attr('class','btn btn-default btn-lg')
			$('#k4').attr('class','btn btn-default btn-lg')
			$('#k5').attr('class','btn btn-default btn-lg')
		}else if(getURLParams(location.search).keyword == '취업자수'){
			$('#k2').attr('class','btn btn-primary btn-lg')
			$('#k1').attr('class','btn btn-default btn-lg')
			$('#k3').attr('class','btn btn-default btn-lg')
			$('#k4').attr('class','btn btn-default btn-lg')
			$('#k5').attr('class','btn btn-default btn-lg')
		}else if(getURLParams(location.search).keyword == '취업동향'){
			$('#k3').attr('class','btn btn-primary btn-lg')
			$('#k2').attr('class','btn btn-default btn-lg')
			$('#k1').attr('class','btn btn-default btn-lg')
			$('#k4').attr('class','btn btn-default btn-lg')
			$('#k5').attr('class','btn btn-default btn-lg')
		}else if(getURLParams(location.search).keyword == '청년취업률'){
			$('#k4').attr('class','btn btn-primary btn-lg')
			$('#k2').attr('class','btn btn-default btn-lg')
			$('#k3').attr('class','btn btn-default btn-lg')
			$('#k1').attr('class','btn btn-default btn-lg')
			$('#k5').attr('class','btn btn-default btn-lg')
		}else if(getURLParams(location.search).keyword == '노인취업률'){
			$('#k5').attr('class','btn btn-primary btn-lg')
			$('#k2').attr('class','btn btn-default btn-lg')
			$('#k3').attr('class','btn btn-default btn-lg')
			$('#k4').attr('class','btn btn-default btn-lg')
			$('#k1').attr('class','btn btn-default btn-lg')
		}else if(getURLParams(location.search).keyword != '해당없음'){
			$('#k5').attr('class','btn btn-default btn-lg')
			$('#k2').attr('class','btn btn-default btn-lg')
			$('#k3').attr('class','btn btn-default btn-lg')
			$('#k4').attr('class','btn btn-default btn-lg')
			$('#k1').attr('class','btn btn-default btn-lg')
		}

	 
	
}); 
</script>
<style>
.form-control{
width:637% !important;
height: 41px !important;
}
#k1{
 margin-left:19px;
}
#k2{
 margin-left:60px;
}
#k3{
 margin-left:60px;
}
#k4{
 margin-left:60px;
}
#k5{
 margin-left:60px;
}
.btn-success {
    color: #fff;
    background-color: #64CD3C;
    border-color: #64CD3C;
}
div#btnList .btn-primary{
    color: #FFF;
    background-color: #64CD3C;
    border-color: #64CD3C;
    border-radius: 1px;
    padding: 10px 20px;
    font-weight: 600;
}
div#btnList .btn-default{
	border-radius: 1px;
    padding: 10px 20px;
    border: 1px solid black;
    color: #000;
    background-color: white;
    border-color: #F0F0F0;
    font-weight: 600;
}
</style>
<body>
	<!-- property area -->
	<!-- property area -->
	<div class="content-area recent-property"
		style="background-color: #FFF;">
		<div class="container">
			<div class="row">


				<jsp:include page="Service_Center/sevice_left.jsp"></jsp:include>
				
				<div
					class="col-md-10 pr-40 padding-top-40 properties-page user-properties">
					<div class="section additional-details" id="btnList">
						<form action="seniorTimes">
							<!-- <input type="text" name="keyword" value=""><br> <input
								type="submit" name="검색" value="검색"> -->
						<button type="submit" class="btn btn-primary btn-lg" formaction="seniorTimes" id="k1" name="keyword" value='고용정책'>고용정책</button>
						<button type="submit" class="btn btn-default btn-lg" formaction="seniorTimes" id="k2" name="keyword" value='취업자수'>취업자</button>
						<button type="submit" class="btn btn-default btn-lg" formaction="seniorTimes" id="k3" name="keyword" value='취업동향'>취업동향</button>
						<button type="submit" class="btn btn-default btn-lg" formaction="seniorTimes" id="k4" name="keyword" value='청년취업률'>청년취업률</button>
						<button type="submit" class="btn btn-default btn-lg" formaction="seniorTimes" id="k5" name="keyword" value='노인취업률'>노인취업률</button>
						</form>
						<br>
						
						<form action="seniorTimes">
							<label for="keyword">
								<div class="col-md-2"><input size="170"type="text" id="keyword" class="form-control" name="keyword" placeholder="취업 관련 키워드를 입력해주세요" required="required"></div>
								<div class="col-md-2" style="float: right"><button class="btn btn-success"type="submit" title="검색">검색</button></div>
							</label>
							<br>
						</form>
						<br>
						
							<table class="table table-hover">
								<c:forEach items="${seniorTimes }" var="b">
									<tr>
										<td colspan="4" width="800"><p><strong>${b.title }</strong></p></td>
									</tr>

									<tr>
										<td width="400"><a href="javascript:openWindowPop('${b.originallink }', 'popup');">${b.description }</a></td>

									</tr>
								</c:forEach>

							</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>