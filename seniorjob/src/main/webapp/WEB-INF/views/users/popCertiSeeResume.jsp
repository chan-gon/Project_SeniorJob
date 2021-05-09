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
	let td1 = $('<td />').attr('id','certiName').html(certi.CERTI_NAME).attr('value',certi.CERTI_NAME);
	let td2 = $('<td />').attr('id','certiPlace').html(certi.CERTI_PLACE).attr('value',certi.CERTI_PLACE);
	let td3 = $('<td />').attr('id','certiNo').html(certi.CERTI_NO).attr('value',certi.CERTI_NO);
	let td4 = $('<td />').attr('id','certiDate').html(certi.CERTI_DATE).attr('value',certi.CERTI_DATE);
	let td5 = $('<td />');
	let inp1 = $('<input />').attr('type','button').attr('id','but').attr('value',"입력").attr('title',certi.NO);
	
	$(inp1).on('click', function() {
					var tar = event.target;
					var count = $(".som_certi_group",opener.document).length;
					var count = count-1;
    				$("input[name='clist["+count+"].certi_name']",opener.document).val($(tar).parent().parent().children('#certiName').html());
    				$("input[name='clist["+count+"].certi_place']",opener.document).val($(tar).parent().parent().children('#certiPlace').html());
    				$("input[name='clist["+count+"].certi_date']",opener.document).val($(tar).parent().parent().children('#certiDate').html());
    				console.log($(tar).parent().parent().children('#certiName').html());
    				window.open('','_self').close();
    			});
	
    $(td5).append(inp1);
	
	$(tr).append(td1);
	$(tr).append(td2);
	$(tr).append(td3);
	$(tr).append(td4);
	$(tr).append(td5);
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
										<th>입력하기</th>
                                	</tr>
                                	</thead>
                                	<tbody id="certi">
                                	
                                
                                	</tbody>
                                		
                                </table>


</body>
</html>