// 회원가입 페이지

//공백 제거
	function noSpace(obj){
		var space = /\s/; //공백을 체크한다. 	
		if(space.exec(obj.value)){ 
			alert("공백을 사용할 수 없습니다.");
			obj.focus();
			obj.value = obj.value.replace(/(\s*)/g, "") //공백 제거
			return false;
		}
	}
	
	 $(function(){
		
	//id 중복체크 
		$("#idsuccess").hide();
		$("#idfail").hide();
		$("#idregexp").hide();
	//input:text 공백 제거 설정
		$("input:text").on("change", function(){
			noSpace(this);
		});
	//input:password 공백 제거 설정	
		$("input:password").on("change", function(){
			noSpace(this);
		});
		
		//중복체크
	 	 $(".id").on("change", function(){  // .change()
	 		 
	 		$("#idsuccess").hide();
			$("#idfail").hide();
			$("#idregexp").hide();
			
			var id = $("#inputid").val();
			
			//공백검사
			if(id == ""){
				return;
			}
			
			//패턴검사
			var idReg = /^(?!ADMIN)(?!admin)[A-za-z0-9]{5,10}/g; //대문자,소문자,0~9까지 숫자, 최소 5에서 최대 10까지
				
			if(!id.match(idReg)){
				$("#idregexp").show();
				$("#inputbutton").attr("disabled", true);
				return;
			}else{
				$("#idregexp").hide();
				$("#inputbutton").attr("disabled", false);	
			}
			
			$.ajax({
				url : "idCheck?id="+id,
				type : "POST",
				success : function(result){
					console.log(result);
					if(id == null && id.trim() == ""){
						return false;
					}
					else if(result == 1){
						$("#idsuccess").hide();
						$("#idfail").show();
						
					}else{
						$("#idsuccess").show();
						$("#idfail").hide();
						
					} 
				}	
			})
		});		
	    
	
	//전화번호 양식
	
		$("#phoneregexp").hide();

		$("#inputphone").change(function(){
			$("#phoneregexp").hide();
			
			var phonenum = $("#inputphone").val();
			var phoneReg = /^\d{3}-\d{3,4}-\d{4}$/;

			if(!phonenum.match(phoneReg)){
				$("#phoneregexp").show();
				$("#inputbutton").attr("disabled", true);
			}else{
				$("#phoneregexp").hide();
				$("#inputbutton").attr("disabled", false);	
			}
		})
	
	
	//생일 양식
		$("#birthregexp").hide();

		$("#inputbirth").change(function(){
			$("#birthregexp").hide();
			
			var birth = $("#inputbirth").val();
			var birthReg = /^([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))$/;

			if(!birth.match(birthReg)){
				$("#birthregexp").show();
				$("#inputbutton").attr("disabled", true);
			}else{
				$("#birthregexp").hide();
				$("#inputbutton").attr("disabled", false);	
			}
		})

		
	//Email 중복체크 
		$("#emailsuccess").hide();
		$("#emailfail").hide();
		$("#emailregexp").hide();
	
	 	 $(".email").change(function(){
	 		 
	 		$("#emailsuccess").hide();
			$("#emailfail").hide();
			$("#emailregexp").hide();
		
			var email = $("#inputemail").val();
			//공백검사
			if(email == ""){
				return;
			}
		
			var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-z])*@[0-9a-z]([-_.]?[0-9a-z])*.[a-z]{2,3}$/i;
			
			$("#inputemail").on("keyup", function(){
				$(this).val($(this).val());
			})
				
			if(!email.match(emailReg)){
				$("#emailregexp").show();
				$("#inputbutton").attr("disabled", true);
				
			}else{
				$("#emailregexp").hide();
				$("#inputbutton").attr("disabled", false);	
				
			}
			
			$.ajax({
				url : "emailCheck?email="+email,
				type : "POST",
				success : function(result){
					console.log(result);
					if(email == null && email.trim() == "" ){
						return false;
					}
					else if(result != "fail"){
						console.log(result);
						$("#emailsuccess").show();
						$("#emailfail").hide();
						
					}else{
						$("#emailsuccess").hide();
						$("#emailfail").show();
						
					} 
				}	
			})
		});	
	 	
	 	//password, passcheck 비교
	 		$("#success").hide();
	 		$("#fail").hide();
	 		
	 	 	 $(".pw").change(function(){
	 	 		$("#success").hide();
	 			$("#fail").hide();
	 			var pw = $("#password").val();
	 			var pwck = $("#passCheck").val();
	 			if(pw !='' && pwck == ''){
	 				null;
	 			 }else if(pw != '' || pwck != ''){
	 				 if(pw == pwck) {
	 					$("#success").show();
	 					$("#fail").hide();
	 					
	 				 }else{
	 					$("#success").hide();
	 					$("#fail").show();
	 				} 
	 			}
	 		}); 
	 	 	 
				 	
	 	 	 
	 	 	 
	 /* 	 //전체 disable button 
	 		if($("input:text") != ''){
	 			$("#inputbutton").attr("disabled", true);
	 		}else {
	 			$("#inputbutton").attr("disabled", false);	
	 		} */
	 });    
	
	/* function btnId(){
		//입력한 아이디 값이 없을 경우
		if($("#id").val() == "" ){
			alert("아이디를 입력하시오.")
			return;
		}
		
		//var _data = {"id" : $("#id").val()}
		//아이디 중복체크 ajax
		$.ajax({
			url : "idCheck",
			type : "POST",
			dataType : "json",
			data : {"id" : $("#id").val()},
			success : function(data){
				console.log(data);
				if(data != 0) {
					alert("중복된 아이디입니다.");	
				}else{
					$("#idCheck").attr("value", "Y");
					alert("사용가능한 아이디입니다.");
				}
			},error:function(request,status,error){console.log(request +' / '+ status+ ' / '+ error);}
		})
	}
 */

	/* function btnEmail(){
		//입력한 이메일 값이 없을 경우
		if($("#email").val() == "" ){
			alert("이메일을 입력하시오.")
			return;
		}

		 $.ajax({
			 	type : "POST",
				url : "emailCheck",
				data : {"email" : $("#email").val()},
				success:function(result) {
					if(result != 'fail'){
						$("#emailCheck").attr("value", "Y");
						alert("사용가능한 이메일입니다.");
					}else{
						alert("중복된 이메일입니다.");
						console.log(result);
					}
				}
		 }); 
	} */
	
	// 우편번호 찾기
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
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
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
