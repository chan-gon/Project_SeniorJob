<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html> 

<jsp:include page="../topHeader.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
  
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

<script>


    
    $(document).ready( function () {
    	$.ajax({
    		url : "getCertiList",
        	success : showContents,
        	error : showErrors
    	})
    }); 
    
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





    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraaddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraaddress").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailaddress").focus();
            }
        }).open();
    }
    
    function insertCerti() {
    	var url="popCerti";
    	window.open(url,"","width=500,height=600");
    	
    }
    
    function insertCareer() {
    	var url="popCareer";
    	window.open(url,"","width=500,height=600");
    }
    
    

</script>
<style>
th {
    text-align: center;
  }
  td {
    text-align: center;
  }
</style>
<body>
  

        <!-- property area -->
        <div class="content-area recent-property" style="background-color: #FFF;">
		<div class="container">
			<div class="row">

				<jsp:include page="../mypage.jsp" />

				<div class="col-md-9 pr-30 padding-top-40 properties-page user-properties">
					<div class="section">

                        <form action="updateUsersProc" method="post">
                            <div class="profiel-header">
                                <h3>
                                    <b>개인정보수정</b> <br>
                                </h3>
                                <hr>
                            </div>

                            <div class="clear">
                          

                                <div class="col-sm-12 padding-top-25 ">

                                    <div class="form-group">
                                        <label>이름 <small>(read only)</small></label>
                                        <input name="name" id="name" type="text" class="form-control" value="${list.name }" readonly>
                                    </div>
                                    
                                    
                                    <div class="form-group">
                                        <label>우편번호</label>
                                        <input name="postcode" id="postcode" type="text" class="form-control" value="${list.postcode }">
                                         
                                    </div>
                                    <div class="form-group">
                                    <input type="button" onclick="DaumPostcode()" value="우편번호 찾기">
                                    </div>
                                    <div class="form-group">
                                        <label>주소</label>
                                        <input name="address" id="address" type="text" class="form-control" value="${list.address }">
                                    </div>
                                    <div class="form-group">
                                        <label>참고항목</label>
                                        <input name="extraaddress" id="extraaddress" type="text" class="form-control" value="${list.extraaddress }">
                                    </div>
                                    <div class="form-group">
                                        <label>상세주소</label>
                                        <input name="detailaddress" id="detailaddress" type="text" class="form-control" value="${list.detailaddress }">
                                    </div>
                                    
                                    <div class="form-group">
                                        <label>전화번호</label>
                                        <input name="phonenum" type="text" class="form-control" value="${list.phonenum }">
                                    </div> 
                                    <div class="form-group">
                                        <label>이메일</label>
                                        <input name="email" type="email" class="form-control"  value="${list.email }">
                                    </div>
                                    <div class="form-group">
                                        <label>생년월일</label>
                                        <input name="birth" type="text" class="form-control"  value="${list.birth }">
                                    </div>
                                    <div class="form-group">
                                        <label>권한 <small>(read only)</small></label>
                                        <input name="auth" type="text" class="form-control"  value="${list.auth }" readonly>
                                    </div>
                                </div>
                                
                                <div class="area_btn col-sm-12 text-center">
									<button type="submit" class="btn btn-primary">수정</button>
								</div> 

                            </div>
                            
                           <div class="profiel-header">
                                <hr>
                                <div class="col-sm-6">
                               
                                <h3>
                                    <b>자격증 목록</b>
                                    
                                    <br>
                                </h3>
                                </div> 
                                 <div class="col-sm-3  col-sm-offset-4">
                                <br>
                                <input type='button' class='btn btn-finish btn-primary' name='finish' onclick='insertCerti()' value='추가' />
                                <br>
                                <br>
                            </div>
                            <br>
                            <div class="col-sm-12">
                                <table border="1" align="center">
                                	<thead>
                                	<tr>
                                		<th width="200px">자격증이름</th>
                                		<th width="200px">발행처</th>
                                		<th width="200px">자격증번호</th>
                                		<th width="100px">취득일자</th>
										<th>수정</th>
										<th>삭제</th>
                                	</tr>
                                	</thead>
                                	<tbody id="certi">
                                	
                                
                                	</tbody>
                                		
                                </table>
                              </div>  
                                
                            </div>
							
							
							<div class="profiel-header">
                            <div class="col-sm-12">
                            <br>
                            
                            <hr>
                            </div>
                    		</div>
                    		
                            
                               <div class="profiel-header">
                                
                                <div class="col-sm-6">
                               
                                <h3>
                                    <b>경력인증서 목록</b>
                                    
                                    <br>
                                </h3>
                                </div> 
                                 <div class="col-sm-3  col-sm-offset-4">
                                <br>
                                <input type='button' class='btn btn-finish btn-primary' name='finish' onclick='insertCareer()' value='추가' />
                                <br>
                                <br>
                            </div>
                            <br>
                            <div class="col-sm-12">
                                <table border="1" align="center">
                                	<thead>
                                	<tr>
                                		<th width="700px">경력인증서</th>
                                		<th>삭제</th>
                                		
                                	</tr>
                                	</thead>
                                	<tbody id="career">
                                	
                                	</tbody>
                                
                                </table>
                                </div>
                            </div>
                          
                          
                           
                            
                            
                            
                            <br>
                            <br>
                            <div class="col-sm-5 col-sm-offset-1">
                            <br>
                            <br>
                            
                            	<hr>
                                <br>
                                <!-- <input type='button' class='btn btn-finish btn-primary' name='finish' value='회원탈퇴' /> -->
                            </div>
                    </form>

                </div>
                
                </div>
            </div><!-- end row -->

        </div>
    </div>

<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
