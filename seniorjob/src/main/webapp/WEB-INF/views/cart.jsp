<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js">
<jsp:include page="topHeader.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function allDel(){
	var yn = confirm("장바구니를 비우시겠습니까?");
	if(yn){
		form.action = "deleteCartAll";
		form.submit();
	}
}	
</script>
<body>
	<!-- property area -->
	<div class="properties-area recent-property" style="background-color: #FFF;">
		<div class="container">
			<div class="row" id="list">
				<div class="section additional-details">
					<h4 class="s-property-title">${sessionScope.users.id}님의 장바구니</h4>
					<hr>
					<form id="form" name="form" method="post">
					<div align="right">
						<button class="btn btn-primary" type="submit" id="allCheck" name="allCheck" onclick="allDel()">비우기</button>
						<button class="btn btn-primary" type="submit" id="delCheck" name="delCheck" onclick="deleteValue()">선택삭제</button>
					</div>
					<table class="table">
					    <thead class="thead-light">
					    <tr>
					      <th>
					      <div class="allCheck">
					      	<input type="checkbox"  id="checkedAll" name="checkedAll"> ALL 
					      </div>
					      </th>
					      <th>멘토</th>	
					      <th>상품명</th>
					      <th>코스 시작일</th>
					      <th>코스 종료일</th>
					      <th>가격</th>
					    </tr>
					  </thead>
					  <tbody>
					  <c:forEach items="${list }" var="cart">
					  <c:choose>
					  <c:when test="${cart.id eq users.id }">
				        <tr>
				        	<th>
				        		<div class="chBox">
				        			<input type="checkbox" id="del" name="del" value="${cart.cart_no }" >
				        		</div>
				        	</th>
				        	<input type="hidden" id="mentoring_number" name="mentoring_number" value="${cart.mtNum.mentoring_number }">
				        	<td><input type="text" id="mentor_id" name="mentor_id" value="${cart.mentor_id }"></td>
				            <td><a href="getMentor?mentor_id=${cart.mentor_id }">${cart.mentoring_name }</a></td>
				            <td>${cart.cart_start }</td>
				            <td>${cart.cart_end }</td>
				            <td><input type="text" id="total" name="total" value="${cart.cart_price }"></td>
				        </tr>
				      </c:when>
				      </c:choose>  
				      </c:forEach>
				      <c:if test="${empty list}">
				      	<tr>
				      		<th>장바구니가 텅 비었습니다.</th>
				      	</tr>
				      </c:if>
					  </tbody>
					  <tfoot>
					    <tr align="right">
					        <td colspan="5">최종 합계</td>
					        <td>
					        	<input type="text" name="total_sum" id="total_sum" readonly="readonly">
					        </td>
					    </tr>
					  </tfoot>
					</table>
					<div align="right">
						<button type="button" class="btn btn-primary" onclick="mentoringPayForm()">결제하기</button>
						<button type="button" class="btn btn-primary" onclick="location.href='getMentoringList'">상품 둘러보기</button>
<!-- 						<button type="button" class="btn btn-primary" onclick = "location.href='MentorListForm'">상품 둘러보기</button> -->
					</div>
					</form>
					</div>
				</div>
			</div>
		</div>
<!-- 	</div> -->
	<script src="resources/assets/js/icheck.min.js"></script>
	<script>
	//css 체크박스 안 먹을 때 .iCheck() 추가
/* 	$('[name=del]').on('ifCreated ifClicked ifChanged ifChecked ifUnchecked ifDisabled ifEnabled ifDestroyed', function(event){
      }).iCheck(); */
      /* $('input').iCheck('check');    >>     iCheck를 통해서 체크여부 가능 */
      
    //선택한 항목 값 나오기(최종합계)
	$('[name=del]').on('ifChanged', function(event){
		  var sum = 0;
		  var count = form.del.length;
		  for(var i = 0; i < count; i++){
			  if(form.del[i].checked == true){
				  sum += parseInt(form.total[i].value);
			      console.log(sum);
			  }
		  }
		  if(form.del.checked == true){
			 sum += parseInt(form.total.value);
			 console.log(sum);
		  }
		  form.total_sum.value = sum;
	  }).iCheck();
      
    
    /* 선택한 항목(들) 삭제 */
    function deleteValue(){
    	var url = "deleteCart";
    	var valueArr = new Array();
    	var list = $('input[name=del]');
    	for(var i = 0; i < list.length; i++){
    		if(list[i].checked){
    			valueArr.push(list[i].value);
    		}
    	}
    	if(valueArr.length == 0){
    		alert("선택된 항목이 없습니다.");
    	}else{
    		var chk = confirm("정말 삭제하시겠습니까?");
    		$.ajax({
    			url : url,
    			type : 'POST',
    			traditional : true,
    			data : { valueArr : valueArr},
    			success : function(response){
    				console.log(response)
    				if(response != 0){
    					alert("삭제 성공");
    					location.replace("cart");
    				}else{
    					alert("삭제 실패");
    				}
    			}
    		});
    	}
    }
    
    
	//전체선택 누르면 나머지 체크박스도 체크된 상태로 변화
    $('input[name=checkedAll]').on('ifChanged', function(event){
    	var sum = 0;
    	var count = form.del.length;
    	if($(this).is(":checked")){
    		$('input[name=del]').iCheck('check');
    		//전체선택에서도 전체합계 나오게 하기
    		for(var i = 0; i < count; i++){
  			  if(form.del[i].checked == true){
  				  sum += parseInt(form.total[i].value);
  			      console.log(sum);
  			    }
  		     }
    		 //배열 없이 하나인 목록에서도 전체합계 출력
    		 if(form.del.checked == true){
	   			 sum += parseInt(form.total.value);
	   			 console.log(sum);
   		 	 }
    	} else{
    		$('input[name=del]').iCheck('uncheck');
    	}
    	//전체합계 출력
    	form.total_sum.value = sum;
    }).iCheck();
	
	
	//목록이 하나라도 풀릴 시, 전체선택 해제...인데 안 됨
    $('input[name=del]').on('ifChanged', function(event){
    	var count = $('input[name=del]').length;
    	for(var i = 0; i < count; i++){
    		if($('input[name=del]'[i]).is(":checked") == false){
    			$('input[name=checkedAll]').iCheck('uncheck');
    		}else {
    			$('input[name=checkedAll]').iCheck('check');
    		}
    	}
    })

     // 결제하기(선택한 체크박스의 아이디 값 찾기)
	function mentoringPayForm(){
		var menNo;
		var mentor_id;
		var del;
		var chk = $("input[name=del]:checked");
		var checked = $(this).iCheck('checked');
		var yn = confirm("결제 하시겠습니까?");
		// 상품 선택 안 하고 결제하기 누를 때 발생.
		if(chk.length == 0){
			alert("상품을 선택해주세요.");
			return;
		}
		if(yn){
			menNo = $("input[name=del]:checked").closest("tr").find("#mentoring_number").val();
			mentor_id = $("input[name=del]:checked").closest("tr").find("#mentor_id").val();
			/*del = $("input[name=del]:checked").val() */
			/* if(checked){
				$("input[name=del]:checked").iCheck("disabled", true);
			}else{
				
			} */
			location.href = "mentoringPayForm?mentoring_number="+menNo +"&mentor_id=" + mentor_id;
// 			location.href = "deleteSub?cart_no="+cartNo;
			/*  +"&cart_no="+ cartNo 
				+"&deleteSub?cart_no="+cartNo
			*/
		}
	}
	</script>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>