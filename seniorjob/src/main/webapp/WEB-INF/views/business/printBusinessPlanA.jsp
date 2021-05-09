<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html><html><head><meta charset="UTF-8"><title>인쇄미리보기</title>
<script type="text/javascript">
function divPrint() {
	var initBody = document.body.innerHTML;
	window.onbeforeprint = function() {
		document.body.innerHTML = document.getElementById('divId').innerHTML;
	}
	window.onafterprint = function() {
		document.body.innerHTML = initBody;
	}
	window.print();
}
</script>
</head>
<body>
<div id="divId">
<h2>인쇄 미리보기</h2>
${bp.seq }<br>
${bp.business_a }<br>
${bp.business_b}<br>		
${bp.business_c}<br>		
${bp.prod_a}<br>		
${bp.prod_b}<br>	
${bp.prod_c}<br>		
${bp.market_a}<br>		
${bp.market_b}<br>		
${bp.market_c}<br>		
${bp.market_d}<br>		
${bp.selling_a}<br>		
${bp.selling_b}<br>		
${bp.selling_c}<br>

</div>	
<button type="button" onclick="divPrint()">인쇄</button>
</body>
</html>