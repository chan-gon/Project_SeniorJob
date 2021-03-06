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
<style>
thead.thead-dark {
	color: white;
	background-color: gray;
}

div#cateView {
	margin-top: 71px;
	padding: 31px;
	padding-bottom: 36px;
	border: 1px solid #e0e0e0;
	background-color: #fafafa;
}

.btn-group>.btn:first-child {
	margin-left: 0;
	height: 45px;
}

input#keywordInput {
    width: 606px;
    margin-top: -21px;
}



#cs_biz_form1 {
	margin-left: 30px;
	margin-right: 50px;
}
.col-xs-7 {
    margin-left: -23px;
}
.box-white.v2 {
    padding: 25px;
    border: 5px solid #ecf0f3;
    background-color: #fff;
    margin-bottom: -48px;
}
div#buttonView {
    top: -14px;
    right: -21px;
}
#pagi {
    height: 40px;
    margin: 20px 10px;
    margin-left: 323px;
}
button#searchBtn {
    margin-top: -25px;
}

.input-group {
    position: relative;
    display: table;
    border-collapse: separate;
    border: 0px solid grey !important;
    margin: 20px;
}

button#cs_biz_form2 {
    margin-right: 50px;
}
button#cs_biz_form3 {
    margin-right: 50px;
}
button#cs_biz_form4 {
    margin-right: 50px;
}
button#cs_biz_form5 {
    margin-right: 50px;
}
button#cs_biz_form6 {
    margin-right: 49px;
}
div#buttonView .btn-primary{
    color: #FFF;
    background-color: #52E252;
    border-color: #52E252;
    border-radius: 1px;
    padding: 10px 20px;
    font-weight: 600;
}
div#buttonView .btn-default{
border-radius: 1px;
    padding: 10px 20px;
    border: 1px solid #FDC600;
    color: #000;
    border-color: #F0F0F0;
    font-weight: 600;
    background-color: white;
}
</style>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/topHeader.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


	
<body>
	<!-- property area -->
	<div class="content-area recent-property"
		style="background-color: #FFF;">
		<div class="container">
			<div class="row">
					
				<jsp:include page="../new_sevice_left.jsp"></jsp:include>
				<div class="col-md-1 pr-30 padding-top-40 properties-page user-properties">
				</div>
				<div class="col-md-9 pr-30 padding-top-40 properties-page user-properties">
					<div class="box-white v2 mb40">
						<ul class="dot-list v1">
							<li>FAQ(???????????? ??????)??? ??????????????? ????????? ???????????? ???????????? ??? ????????????.</li>
							<li>???????????? ????????? ?????? ???????????? ??????????????? ??????????????? ????????????.</li>
						</ul>
					</div>
				</div>
				<div class="col-md-1 pr-30  properties-page user-properties">
				</div>
				
				<div class="col-md-9 pr-30 properties-page user-properties" id="cateView">
					<div class="col-md-12 pr-30" id="buttonView">
							<button type="button" id="cs_biz_form1" name="cs_biz_form" class="btn btn-primary" value="">??????</button>
							<button type="button" id="cs_biz_form2" name="cs_biz_form" class="btn btn-default " value="??????">??????</button>
							<button type="button" id="cs_biz_form3" name="cs_biz_form" class="btn btn-default " value="??????">??????</button>
							<button type="button" id="cs_biz_form4" name="cs_biz_form" class="btn btn-default " value="??????">??????</button>
							<button type="button" id="cs_biz_form5" name="cs_biz_form" class="btn btn-default " value="??????">??????</button>
							<button type="button" id="cs_biz_form6" name="cs_biz_form" class="btn btn-default " value="??????">??????</button>	
					</div>
					<br>
					<hr>
					<div class="col-md-12 pr-30" id="searchView">
							<div class="col-xs-2">
								<div class="btn-group bootstrap-select show-tick form-control">
									<select id="basic" name="searchType"
										class="selectpicker show-tick form-control" tabindex="-98">
										<option value="t"
											<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>??????</option>
										<option value="c"
											<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>??????</option>
										<option value="tc"
											<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>??????+??????</option>
									</select>
								</div>
							</div>
							<div class="col-xs-7">
								<div class="input-group" id="input-group">
									<input class="form-control" name="keyword" id="keywordInput"
										value="${scri.keyword}"
										style="text-align: center; height: 45px;" type="text"
										placeholder="?????? ?????? "> <span class="input-group-btn">
										<button class="btn btn-primary subscribe" id="searchBtn"
											type="button">
											<i class="pe-7s-paper-plane pe-2x"></i>
										</button>
				
									</span>
								</div>
							</div>
					</div>
				</div>
				<div class="col-md-1 pr-30 padding-top-40 properties-page user-properties">
				
				</div>
				
				<div
					class="col-md-9 pr-30 padding-top-40 properties-page user-properties">
					<div class="section additional-details">
						<table class="table">
							<thead class="thead-dark">
								<tr>
									<th scope="col">????????????</th>
									<th scope="col">??????</th>
									<th scope="col">????????????</th>
									<th scope="col">?????????</th>
								</tr>
							</thead>
							<tbody>
							<c:if test="${not empty list}">
							<c:forEach items="${list }" var="gongji">
								<tr>
									<th scope="row" onclick="location.href='getService_CenterQna?seq=${gongji.seq }'">
									${gongji.category_b }</th>
									<td onclick="location.href='getService_CenterQna?seq=${gongji.seq }'">${gongji.title }</td>
									<td onclick="location.href='getService_CenterQna?seq=${gongji.seq }'"><fmt:formatDate
										value="${gongji.w_date }" pattern="yyyy-MM-dd" /></td>
									<td onclick="location.href='getService_CenterQna?seq=${gongji.seq }'">${gongji.click }</td>
								</tr>
							</c:forEach>
							</c:if>
							</tbody>
						</table>
							<c:if test="${empty list}">
							<h3 style="text-align: center;"><strong>????????? ???????????? ?????? ???????????? ???????????? ????????????.</strong></h3>
							</c:if>

					</div>

					<div
						class="col-md-12 pr-50 padding-top-40 properties-page user-properties">
						<div class="pagination" id="pagi">
							<ul>
								<c:if test="${pageMaker.prev}">
									<li><a
										href="serviceCenterQna${pageMaker.makeSearch(pageMaker.startPage - 1)}">??????</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}" var="idx">
									<li><a href="serviceCenterQna${pageMaker.makeSearch(idx)}">${idx}</a></li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="serviceCenterQna${pageMaker.makeSearch(pageMaker.endPage + 1)}">??????</a></li>
								</c:if>
							</ul>
						</div>
					</div>

					<div
						class="col-md-12 pr-30 padding-top-40 properties-page user-properties">
						<form role="form" method="get">
							<div class="search">
								<br>
							</div>
							
						</form>
					</div>
				</div>



			</div>
		</div>
	</div>

	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"></jsp:include>
<script>
//???????????? ????????????(??????/??????/??????...)

$(function(){
	//?????? ?????????
	/* $('[value=${param.optionValue}]').iCheck('check');
	
	//?????? ??????
	$('[name="cs_biz_form"]').on('ifClicked', function(){
		var param = 'optionValue='+$(this).val();
		location.href='serviceCenterQna?'+param;
	}); */
	
	$('[name="cs_biz_form"]').on("click", function(){
		var param = 'optionValue='+$(this).val();
		location.href='serviceCenterQna?'+param;
	});
	
});	
$(function(){
  $('#searchBtn').click(function() {
    self.location = "serviceCenterQna" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
  });
});  

function getURLParams(url) {
    var result = {};
    url.replace(/[?&]{1}([^=&#]+)=([^&#]*)/g, function(s, k, v) { result[k] = decodeURIComponent(v); });
    return result;
}

$(function(){
	if(getURLParams(location.search).optionValue == '??????'){
		$('#cs_biz_form1').attr('class','btn btn-default') //??????
		$('#cs_biz_form2').attr('class','btn btn-primary') //??????
		$('#cs_biz_form3').attr('class','btn btn-default') //??????
		$('#cs_biz_form4').attr('class','btn btn-default') //??????
		$('#cs_biz_form5').attr('class','btn btn-default') //??????
		$('#cs_biz_form6').attr('class','btn btn-default') //??????
	}else if(getURLParams(location.search).optionValue == '??????'){
		$('#cs_biz_form1').attr('class','btn btn-default') //??????
		$('#cs_biz_form2').attr('class','btn btn-default') //??????
		$('#cs_biz_form3').attr('class','btn btn-primary') //??????
		$('#cs_biz_form4').attr('class','btn btn-default') //??????
		$('#cs_biz_form5').attr('class','btn btn-default') //??????
		$('#cs_biz_form6').attr('class','btn btn-default') //??????
	}else if(getURLParams(location.search).optionValue == '??????'){
		$('#cs_biz_form1').attr('class','btn btn-default') //??????
		$('#cs_biz_form2').attr('class','btn btn-default') //??????
		$('#cs_biz_form3').attr('class','btn btn-default') //??????
		$('#cs_biz_form4').attr('class','btn btn-primary') //??????
		$('#cs_biz_form5').attr('class','btn btn-default') //??????
		$('#cs_biz_form6').attr('class','btn btn-default') //??????
	}else if(getURLParams(location.search).optionValue == '??????'){
		$('#cs_biz_form1').attr('class','btn btn-default') //??????
		$('#cs_biz_form2').attr('class','btn btn-default') //??????
		$('#cs_biz_form3').attr('class','btn btn-default') //??????
		$('#cs_biz_form4').attr('class','btn btn-default') //??????
		$('#cs_biz_form5').attr('class','btn btn-primary') //??????
		$('#cs_biz_form6').attr('class','btn btn-default') //??????
	}else if(getURLParams(location.search).optionValue == '??????'){
		$('#cs_biz_form1').attr('class','btn btn-default') //??????
		$('#cs_biz_form2').attr('class','btn btn-default') //??????
		$('#cs_biz_form3').attr('class','btn btn-default') //??????
		$('#cs_biz_form4').attr('class','btn btn-default') //??????
		$('#cs_biz_form5').attr('class','btn btn-default') //??????
		$('#cs_biz_form6').attr('class','btn btn-primary') //??????
	}else if(getURLParams(location.search).optionValue != '????????????'){
		$('#cs_biz_form1').attr('class','btn btn-primary') //??????
		$('#cs_biz_form2').attr('class','btn btn-default') //??????
		$('#cs_biz_form3').attr('class','btn btn-default') //??????
		$('#cs_biz_form4').attr('class','btn btn-default') //??????
		$('#cs_biz_form5').attr('class','btn btn-default') //??????
		$('#cs_biz_form6').attr('class','btn btn-default') //??????
	}
	
	
});

</script>
<script>


</script>
</body>
</html>