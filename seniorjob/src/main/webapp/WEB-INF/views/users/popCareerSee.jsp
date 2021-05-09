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
		url : "getCarList",
    	success : function (result) {
    		var list = result;
    		for(certi of list ) {
    			
    			
    			let tr2 = $('<tr />');
    			let td5 = $('<td />').html(certi.CARRER_CERTI);
    			let td6 = $('<td />');
    			
    			let inp1 = $('<input />').attr('type','button').attr('value',"삭제").attr('title',certi.NO);
    			//let no = certi.NO;
    			$(inp1).on('click', function() {
    				console.log(this);
    				var no = this.title;
    				location.href="delCareer?no="+no;
    			})
    			$(td6).append(inp1);
    			
    			$(tr2).append(td5);
    			$(tr2).append(td6);
    			$('#career').append(tr2);
    			
    			
    			
    		}
    		
    		
    	},
    	error : function() {
    		console.log("error입니다.");
    	}
	})
}); 
</script>
</head>
<body>
<table border="1" align="center">
                                	<thead>
                                	<tr>
                                		<th>경력인증서</th>
                                		<th>삭제</th>
                                		
                                	</tr>
                                	</thead>
                                	<tbody id="career">
                                	
                                	</tbody>
                                
                                </table>

</body>
</html>