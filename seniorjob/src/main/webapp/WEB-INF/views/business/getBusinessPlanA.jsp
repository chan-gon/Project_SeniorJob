<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js"><head><meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>사업계획서 조회</title>
<meta name="description" content="company is a real-estate template">
<meta name="author" content="Kimarotec">
<meta name="keyword"
	content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800'
	rel='stylesheet' type='text/css'>

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">

<link rel="stylesheet" href="resources/assets/css/normalize.css">
<link rel="stylesheet" href="resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/assets/css/fontello.css">
<link
	href="resources/assets/fonts/icon-7-stroke/css/pe-icon-7-stroke.css"
	rel="stylesheet">
<link href="resources/assets/fonts/icon-7-stroke/css/helper.css"
	rel="stylesheet">
<link href="resources/assets/css/animate.css" rel="stylesheet"
	media="screen">
<link rel="stylesheet"
	href="resources/assets/css/bootstrap-select.min.css">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/assets/css/icheck.min_all.css">
<link rel="stylesheet" href="resources/assets/css/price-range.css">
<link rel="stylesheet" href="resources/assets/css/owl.carousel.css">
<link rel="stylesheet" href="resources/assets/css/owl.theme.css">
<link rel="stylesheet" href="resources/assets/css/owl.transitions.css">
<link rel="stylesheet" href="resources/assets/css/style.css">
<link rel="stylesheet" href="resources/assets/css/responsive.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
    var frm = document.frm;
    var phidden = frm.phidden.value;
    var mhidden = frm.mhidden.value;
    var shidden = frm.shidden.value;
    
    if(phidden == 1) {
    	prodAdd();
    	if(mhidden == 1) {
    		marketAdd();
    		if(shidden == 1) {
    			sellAdd();
    		} //end of shidden
    		
    		else {
    			console.log("4");
    		}
    	} //end of mhidden 
    	
    	else { 
    		if(shidden == 1) {
    			console.log("5");
        			sellAdd();
    			}
    		}
    	} // end of phidden
    
    else{
    		if(mhidden == 1) {
    			console.log("6");
        		marketAdd();
        		if(shidden == 1) {
        			console.log("7");
        			sellAdd();
    			}
        	} else {
        		if(shidden == 1) {
        			console.log("8");
            			sellAdd();
        			}
        		}
    }
    
});



function prodAdd() {
	
	var prodLen = $("#prodDiv").length; //prodDiv가 있는지 찾는다.
	
	
	if(prodLen > 0) {  //prodDiv가 있다면
		alert("이미 추가된 항목입니다.");
	} else {
	
	var prodDiv = $('<div />').attr("class", "row").attr("id", "prodDiv");
	var hidden = $('<input />').attr("type","hidden").attr("id","pHidden").attr("name","pHidden").attr("value","1");
	var br = $('<br />');
	var hr = $('<hr />');
	var h2 = $('<h2 />').html("생산제품의 소개");
	var colSmDiv = $('<div />').attr("class", "col-sm-12");
	var formGDiv = $('<div />').attr("class", "form-group");
	var labelA = $('<label />').attr("for","prod_a").html("제품(서비스)명");
	var textAreaA = $('<textarea />').attr("name","prod_a").attr("id", "prod_a").attr("class", "form-control").html("${bpp.prod_a}");
	var labelB = $('<label />').attr("for","prod_b").html("제품(서비스)소개");
	var textAreaB = $('<textarea />').attr("name","prod_b").attr("id", "prod_b").attr("class", "form-control").html("${bpp.prod_b}");
	var labelC = $('<label />').attr("for","prod_c").html("제품(서비스)차별성");
	var textAreaC = $('<textarea />').attr("name","prod_c").attr("id", "prod_c").attr("class", "form-control").html("${bpp.prod_c}");
	
	
	$(prodDiv).append(hidden);
	
	$(prodDiv).append(br);
	$(prodDiv).append(hr);
	$(prodDiv).append(h2);
	$(br).clone().appendTo(prodDiv);  //br이라는 요소를 복제하여 prodDiv에 넣음.
	
	
	$(formGDiv).append(labelA);
	$(formGDiv).append(textAreaA);

	$(formGDiv).append(labelB);
	$(formGDiv).append(textAreaB);
	
	$(formGDiv).append(labelC);
	$(formGDiv).append(textAreaC);
	
	$(colSmDiv).append(formGDiv);
	$(prodDiv).append(colSmDiv);
	
	$("#businessDiv").eq(-1).after(prodDiv);
	
	}
}


function marketAdd() {
	
	var marketLen = $("#marketDiv").length; //marketDiv가 있는지 찾는다.
	if(marketLen > 0) {  //marketDiv가 있다면
		alert("이미 추가된 항목입니다.");
	} else {
	
	
	var marketDiv = $('<div />').attr("class", "row").attr("id", "marketDiv");
	var hidden = $('<input />').attr("type","hidden").attr("id","mHidden").attr("name","mHidden").attr("value","1");
	var br = $('<br />');
	var hr = $('<hr />');
	var h2 = $('<h2 />').html("시장현황 및 전망");
	var colSmDiv = $('<div />').attr("class", "col-sm-12");
	var formGDiv = $('<div />').attr("class", "form-group");
	var labelA = $('<label />').attr("for","market_a").html("국내외 목표시장");
	var textAreaA = $('<textarea />').attr("name","market_a").attr("id", "market_a").attr("class", "form-control").html("${bpp.market_a}");
	var labelB = $('<label />').attr("for","market_b").html("국내외 관련기술(제품) 동향");
	var textAreaB = $('<textarea />').attr("name","market_b").attr("id", "market_b").attr("class", "form-control").html("${bpp.market_b}");
	var labelC = $('<label />').attr("for","market_c").html("경쟁사 현황");
	var textAreaC = $('<textarea />').attr("name","market_c").attr("id", "market_c").attr("class", "form-control").html("${bpp.market_c}");
	var labelD = $('<label />').attr("for","market_d").html("시장창출 가능성");
	var textAreaD = $('<textarea />').attr("name","market_d").attr("id", "market_d").attr("class", "form-control").html("${bpp.market_d}");
	
	$(marketDiv).append(hidden);
	
	$(marketDiv).append(br);
	$(marketDiv).append(hr);
	$(marketDiv).append(h2);
	$(br).clone().appendTo(marketDiv);  //br이라는 요소를 복제하여 prodDiv에 넣음.
	
	
	$(formGDiv).append(labelA);
	$(formGDiv).append(textAreaA);

	$(formGDiv).append(labelB);
	$(formGDiv).append(textAreaB);
	
	$(formGDiv).append(labelC);
	$(formGDiv).append(textAreaC);
	
	$(formGDiv).append(labelD);
	$(formGDiv).append(textAreaD);
	
	$(colSmDiv).append(formGDiv);
	$(marketDiv).append(colSmDiv);
	
	
	var prodLen = $("#prodDiv").length; //prodDiv가 있는지 찾는다.
	
	
	if(prodLen > 0) {  //prodDiv가 있다면
		$("#prodDiv").eq(-1).after(marketDiv);  //prodDiv 뒤에 찰싹 붙음
		
	} else {  //prodDiv가 없다면
		$("#businessDiv").eq(-1).after(marketDiv); //businessDiv 뒤에 찰싹 붙음
	}
	
	}
}

function sellAdd() {
	
	var sellingLen = $("#sellingDiv").length; //sellingDiv가 있는지 찾는다.
	if(sellingLen > 0) {  //sellingDiv가 있다면
		alert("이미 추가된 항목입니다.");
	} else {
	
	
	var sellingDiv = $('<div />').attr("class", "row").attr("id", "sellingDiv");
	var hidden = $('<input />').attr("type","hidden").attr("id","sHidden").attr("name","sHidden").attr("value","1");
	var br = $('<br />');
	var hr = $('<hr />');
	var h2 = $('<h2 />').html("판매계획");
	var colSmDiv = $('<div />').attr("class", "col-sm-12");
	var formGDiv = $('<div />').attr("class", "form-group");
	var labelA = $('<label />').attr("for","selling_a").html("제품홍보방법");
	var textAreaA = $('<textarea />').attr("name","selling_a").attr("id", "selling_a").attr("class", "form-control").html("${bpp.selling_a}");
	var labelB = $('<label />').attr("for","selling_b").html("수익창출방안");
	var textAreaB = $('<textarea />').attr("name","selling_b").attr("id", "selling_b").attr("class", "form-control").html("${bpp.selling_b}");
	var labelC = $('<label />').attr("for","selling_c").html("시장성공요인");
	var textAreaC = $('<textarea />').attr("name","selling_c").attr("id", "selling_c").attr("class", "form-control").html("${bpp.selling_c}");
	
	$(sellingDiv).append(hidden);
	
	$(sellingDiv).append(br);
	$(sellingDiv).append(hr);
	$(sellingDiv).append(h2);
	$(br).clone().appendTo(sellingDiv);  //br이라는 요소를 복제하여 prodDiv에 넣음.
	
	
	$(formGDiv).append(labelA);
	$(formGDiv).append(textAreaA);

	$(formGDiv).append(labelB);
	$(formGDiv).append(textAreaB);
	
	$(formGDiv).append(labelC);
	$(formGDiv).append(textAreaC);
	
	$(colSmDiv).append(formGDiv);
	$(sellingDiv).append(colSmDiv);
	
	
	
	
	
	
	var marketLen = $("#marketDiv").length; //marketDiv가 있는지 찾는다.
	var prodLen = $("#prodDiv").length; //prodDiv가 있는지 찾는다.
	
	if(marketLen > 0) {  //marketDiv가 있다면
		$("#marketDiv").eq(-1).after(sellingDiv);  //marketDiv 뒤에 찰싹 붙음
		
	} else {  //marketDiv가 없다면
		if(prodLen > 0) {  //prodDiv가 있다면
			$("#prodDiv").eq(-1).after(sellingDiv);  //prodDiv 뒤에 찰싹 붙음
			
		} else {  //prodDiv가 없다면
			$("#businessDiv").eq(-1).after(sellingDiv); //businessDiv 뒤에 찰싹 붙음
		}
	}
	
	}
	
}


</script>


</head>
<body>

	<div id="preloader">
		<div id="status">&nbsp;</div>
	</div>
	<!-- Body content -->

<form action="updateBusinessPlanA" method="post" name="frm">
<input type="hidden" id="phidden" name="phidden" value="${bpp.phidden}">
<input type="hidden" id="mhidden" name="mhidden" value="${bpp.mhidden}">
<input type="hidden" id="shidden" name="shidden" value="${bpp.shidden}">
<input type="hidden" id="seq" name="seq" value="${bpp.seq}">


	<!-- property area -->
	<div class="content-area recent-property padding-top-40" style="background-color: #FFF;">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2" id="allDiv">
					
					<div class="row" id="businessDiv" >
					<hr>
					<h2>계획사업의 개요</h2>
					<br>
					
							<div class="col-sm-12">
								<div class="form-group">
									<label for="title">제목</label>
									<textarea name="title" id="title" class="form-control">${bpp.title }</textarea>
								</div>
							</div>
						
							<div class="col-sm-12">
								<div class="form-group">
									<label for="business_a">사업의 배경과 필요성</label>
									<textarea name="business_a" id="business_a" class="form-control">${bpp.business_a }</textarea>
								</div>
							</div>

							<div class="col-sm-12">
								<div class="form-group">
									<label for="business_b">사업의 목적</label>
									<textarea name="business_b" id="business_b" class="form-control">${bpp.business_b }</textarea>
								</div>
							</div>

							<div class="col-sm-12">
								<div class="form-group">
									<label for="business_c">사업 기대효과</label>
									<textarea name="business_c" id="business_c" class="form-control">${bpp.business_c }</textarea>
								</div>
							</div>
					</div>
					
				</div>

					
				</div> 
			</div>
		</div>
	</div>


</form>

				
				
				
				
				

	<script src="resources/assets/js/modernizr-2.6.2.min.js"></script>
	<script src="resources/assets/js/jquery-1.10.2.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/js/bootstrap-select.min.js"></script>
	<script src="resources/assets/js/bootstrap-hover-dropdown.js"></script>

	<script src="resources/assets/js/easypiechart.min.js"></script>
	<script src="resources/assets/js/jquery.easypiechart.min.js"></script>

	<script src="resources/assets/js/owl.carousel.min.js"></script>
	<script src="resources/assets/js/wow.js"></script>

	<script src="resources/assets/js/icheck.min.js"></script>
	<script src="resources/assets/js/price-range.js"></script>

	<script
		src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=false"></script>
	<script src="resources/assets/js/gmaps.js"></script>
	<script src="resources/assets/js/gmaps.init.js"></script>

	<script src="resources/assets/js/main.js"></script>

</body>
</html>
