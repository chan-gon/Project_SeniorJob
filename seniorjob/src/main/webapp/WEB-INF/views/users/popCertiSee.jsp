<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready( function () {
	$.ajax({
		url : "getCertiList",
    	success : showContents,
    	error : showErrors
	})
}); 




function showErrors(result) {
console.log("error");
}

function showContents(result) {
var list = result;
for(certi of list ) {
	
	let tr = $('<tr />');
	let td1 = $('<td />').html(certi.CERTI_NAME);
	let td2 = $('<td />').html(certi.CERTI_PLACE);
	let td3 = $('<td />').html(certi.CERTI_NO);
	let td4 = $('<td />').html(certi.CERTI_DATE);
	let td5 = $('<td />');
	let td6 = $('<td />');
	let inp1 = $('<input />').attr('type','button').attr('value',"수정").attr('title',certi.NO);
	let inp2 = $('<input />').attr('type','button').attr('value',"삭제").attr('title',certi.NO);
	
	$(inp1).on('click', function() {
    				var no = this.title;
    				var url="updateCertiForm?no="+no;
    		    	window.open(url,"","width=500,height=600");
    			});
	$(inp2).on('click', function() {
    				console.log(this);
    				var no = this.title;
    				location.href="deleteCerti?no="+no;
    			});
    $(td5).append(inp1);
	$(td6).append(inp2);
	
	$(tr).append(td1);
	$(tr).append(td2);
	$(tr).append(td3);
	$(tr).append(td4);
	$(tr).append(td5);
	$(tr).append(td6);
	$('#certi').append(tr);
	

	
}


}
</script>
</head>
<body>
 <table border="1" align="center">
                                	<thead>
                                	<tr>
                                		<th>자격증이름</th>
                                		<th>발행처</th>
                                		<th>자격증번호</th>
                                		<th>취득일자</th>
						<th>수정</th>
						<th>삭제</th>
                                	</tr>
                                	</thead>
                                	<tbody id="certi">
                                	
                                
                                	</tbody>
                                		
                                </table>


</body>
</html>