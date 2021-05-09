<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.table-striped > thead > tr > th{

word-break : keep-all;
text-align : center;

}

.badge {

cursor : pointer;

}
</style>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="userList?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<div class="main-content container-fluid">
	<div class="page-title">
		<div class="row">
			<div class="col-12 col-md-6 order-md-1 order-last" style="text-align: center; width: 1300px; font-family:monospace;">
				<h1>회원 관리</h1><br/>
				<p class="text-subtitle text-muted">전체 회원 목록 조회 또는 멘토 승급 페이지입니다.</p>
			</div>
			<br/>
			<div class="col-12 col-md-6 order-md-2 order-first">
				
			</div>
		</div>
	</div>
	<section class="section">
		<div class="card">
			<div class="card-header">전체 회원 데이터 테이블</div>
			<div id ="countmentor">
				<span id ="mensyscount" style="float:right; text-family:monospace;"></span>
			</div>
			<div class="card-body">
				<div class="dataTable-search">
				<form role="form" method="get">
					<div class="col-xs-12">
                         <div class="btn-group bootstrap-select show-tick form-control" style="width: 500px; ">
                         	 <div class="dropdown-menu open" style="max-height: 200px; overflow: hidden; min-height: 109px;"><ul class="dropdown-menu inner" role="menu" style="max-height: 100px; overflow-y: auto; min-height: 98px;"><li data-original-index="0" class=""><a tabindex="0" class="" style="" data-tokens="null"><span class="text"> -Status- </span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="1" class=""><a tabindex="0" class="" style="" data-tokens="null"><span class="text">Rent </span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="2" class="selected"><a tabindex="0" class="" style="" data-tokens="null"><span class="text">Boy</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="3"><a tabindex="0" class="" style="" data-tokens="null"><span class="text">used</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li></ul></div>
                         <select id="basic" name="searchType" class="form-select" style="width:200px;" tabindex="-98">
                              <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>------</option>
						      <option value="name"<c:out value="${scri.searchType eq 'name' ? 'selected' : ''}"/>>이름</option>
						      <option value="id"<c:out value="${scri.searchType eq 'id' ? 'selected' : ''}"/>>ID</option>
						      <option value="auth"<c:out value="${scri.searchType eq 'auth' ? 'selected' : ''}"/>>회원등급</option>
						      <option value="mentor_confirm_status"<c:out value="${scri.searchType eq 'mentor_confirm_status' ? 'selected' : ''}"/>>승인대기</option>
                        </select>
							<div class="input-group">
                             <input class="form-control"  name="keyword" id="keywordInput" value="${scri.keyword}" style="text-align:center; height:45px; width: 230px; flex:unset;" type="text" placeholder="내용 입력 ">&nbsp;
                             <span class="input-group-btn">
                             	<button class="btn btn-primary subscribe" id="searchBtn" style="" type="button"><i data-feather="edit"></i>검색</button>
							 </span>
                    		</div>
                        </div>
                        </div>
                        <div class="col-xs-7">
						</div>
				</form>
						
				<br>
				
				<table class='table table-striped' style="font-size: 10px;" id="table1">
					<thead>
						<tr>
							<th>ID</th>
							<th>회원 이름</th>
							<!-- 양소민 수정 -->
							<th>자격증/<br/>경력증명서</th>
							<th>멘토<br/>신청일자</th>
							<th>멘토<br/>신청상태</th>
							<th>회원등급</th>
							<th>소셜닉네임</th>
							<th>승급</th>
							<th>상세보기 및<br/>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody id="tbody" style="text-align:center;">
						<c:forEach items="${viewAll}" var="users">
							<tr>
								<td>${users.id }</td>
								<td>${users.name }</td>
								<!-- 양소민 수정(자격증, 경력증명서 조회) -->
								<td><a href="#getCertiModal" class="edit" data-bs-toggle="modal"><i data-feather="external-link"></i></a></td>
								<td><fmt:formatDate value="${users.mentor_date}" pattern="yy/MM/dd"/></td>
								<td>${users.mentor_confirm_status}</td>								
								<td>${users.auth}</td>
								<td>${users.distinction}</td>
								<td>
									<c:choose>
										<c:when test="${users.auth eq 'USER'}">
											<span class="badge bg-success" href="#info" class="info" data-bs-toggle="modal">승급</span>
										</c:when>
										<c:when test="${users.auth eq 'MENTOR'}">
											<span class="badge bg-danger" href="#down" class="down" data-bs-toggle="modal">강등</span>
										</c:when>
									</c:choose>
								</td>
								<td><a href="#exampleModalLong" class="edit" data-bs-toggle="modal"> <i data-feather="edit"></i></a></td>
								<td><a href="#delete" class="delete" data-bs-toggle="modal"><i data-feather="alert-circle"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				 <div class="card-body">
                       <nav aria-label="Page navigation example">
                          <ul class="pagination pagination-primary  justify-content-center">
    						<c:if test="${pageMaker.prev}">
    						<li><a href="userList${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
    						</c:if> 

    						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    						<li><a href="userList${pageMaker.makeSearch(idx)}">${idx}</a></li>
    						</c:forEach>
			
    						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    						<li><a href="userList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
    						</c:if> 
					  	  </ul>
                      </nav>
					</div>
				</div>

			</div>
		</div>

	</section>
</div>

<!--승급 modal -->
<div class="modal fade text-left" id="info" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel130" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
		role="document">
		<div class="modal-content">
			<div class="modal-header bg-info">
				<h5 class="modal-title white" id="myModalLabel130">승급</h5>
				<button type="button" class="close" data-bs-dismiss="modal"
					aria-label="Close">
					<i data-feather="x"></i>
				</button>
			</div>
			<div class="modal-body">이 <span id="authSpan"></span>회원을 멘토로 승급시키겠습니까?</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
					<i class="bx bx-x d-block d-sm-none"></i> 
					<span class="d-none d-sm-block">닫기</span>
				</button>
				<button type="button" class="btn btn-info ml-1" id="btnAuth" data-bs-dismiss="modal">
					<i class="bx bx-check d-block d-sm-none"></i> 
					<span class="d-none d-sm-block">승인</span>
				</button>
			</div>
		</div>
	</div>
</div>

<!--강등 modal -->
<div class="modal fade text-left" id="down" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel130" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
		role="document">
		<div class="modal-content">
			<div class="modal-header bg-info">
				<h5 class="modal-title white" id="myModalLabel130">강등</h5>
				<button type="button" class="close" data-bs-dismiss="modal"
					aria-label="Close">
					<i data-feather="x"></i>
				</button>
			</div>
			<div class="modal-body">이 <span id="authDownSpan"></span>멘토를 회원으로 강등시키겠습니까?</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
					<i class="bx bx-x d-block d-sm-none"></i> 
					<span class="d-none d-sm-block">닫기</span>
				</button>
				<button type="button" class="btn btn-info ml-1" id="btnDownAuth" data-bs-dismiss="modal">
					<i class="bx bx-check d-block d-sm-none"></i> 
					<span class="d-none d-sm-block">승인</span>
				</button>
			</div>
		</div>
	</div>
</div>


<!-- 회원정보 수정 modal -->
<div class="modal fade" id="exampleModalLong" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLongTitle"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form action="updateUserProc" method="post">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle"><span id="userSpan"></span>회원 정보 상세 및 수정</h5>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<i data-feather="x"></i>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-4">
							<label>ID</label>
						</div>
						<div class="col-md-8">
							<div class="form-group has-icon-left">
								<div class="position-relative">
									<input type="text" class="form-control" placeholder="ID" id="id" name="id" readonly="readonly">
									<div class="form-control-icon">
										<i data-feather="user"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<label>Name</label>
						</div>
						<div class="col-md-8">
							<div class="form-group has-icon-left">
								<div class="position-relative">
									<input type="text" class="form-control" placeholder="Name" id="name" name="name">
									<div class="form-control-icon">
										<i data-feather="user"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<label>Email</label>
						</div>
						<div class="col-md-8">
							<div class="form-group has-icon-left">
								<div class="position-relative">
									<input type="email" class="form-control" placeholder="Email" id="email" name="email">
									<div class="form-control-icon">
										<i data-feather="mail"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<label>phonenum</label>
						</div>
						<div class="col-md-8">
							<div class="form-group has-icon-left">
								<div class="position-relative">
									<input type="text" class="form-control" placeholder="Mobile" id="phonenum" name="phonenum">
									<div class="form-control-icon">
										<i data-feather="phone"></i>
									</div>
								</div>
							</div>
						</div>
						<!-- <div class="col-md-4">
							<label>auth</label>
						</div>
						<div class="col-md-8">
							<div class="form-group has-icon-left">
								<div class="position-relative">
									<input type="text" class="form-control" placeholder="Auth" id="auth" name="auth" readonly="readonly">
									<div class="form-control-icon">
										<i data-feather="file"></i>
									</div>
								</div>
							</div>
						</div>  -->
						<!-- 	<div class="card-body">
								<div class="row">
									<div class="col-lg-6 col-md-12">
										<p>File</p>
										<div class="form-file">
											<input type="file" class="form-file-input" id="customFile">
											<label class="form-file-label" for="customFile"> 
											<span class="form-file-text">Choose file...</span> 
											<span class="form-file-button">Browse</span>
											</label>
										</div>
									</div> -->
						<div class="modal-footer">
							<button type="button" class="btn btn-light-secondary"
								data-bs-dismiss="modal">
								<i class="bx bx-x d-block d-sm-none"></i> 
								<span class="btn btn-warning">닫기</span>
							</button>

							<button type="submit" id="btnup" class="btn btn-primary ml-1" data-bs-dismiss="modal">
								<i class="bx bx-check d-block d-sm-none"></i> 
								<span class="d-none d-sm-block">수정</span>
							</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- 자격증, 경력증명서 조회(양소민 수정) -->
<div class="modal fade" id="getCertiModal" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLongTitle"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form action="#" method="post">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle"><span id="certiModalSom"></span>자격증/경력증명서조회</h5>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<i data-feather="x"></i>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						 <div class="profiel-header">
                                <h3>
                                    <b>자격증 목록</b>
                                </h3>
                                <table border="1" align="center">
                                	<thead>
                                	<tr>
                                		<th>자격증이름</th>
                                		<th>발행처</th>
                                		<th>자격증번호</th>
                                		<th>취득일자</th>
                                	</tr>
                                	</thead>
                                	<tbody id="certi">
                                	
                                
                                	</tbody>
                                		
                                </table>
                                
                                
                            </div>
						<div class="profiel-header">
                                <br />
                                <br />
                                <br />
                                <h3>
                                    <b>경력인증서 목록</b>
                                </h3>
                                <table border="1" align="center">
                                	<thead>
                                	<tr>
                                		<th>경력인증서</th>
                                		
                                	</tr>
                                	</thead>
                                	<tbody id="career">
                                	
                                	</tbody>
                                
                                </table>
                            </div>
						
						
						
						

						<div class="modal-footer">
							<button type="button" class="btn btn-light-secondary"
								data-bs-dismiss="modal">
								<i class="bx bx-x d-block d-sm-none"></i> 
								<span class="btn btn-warning">닫기</span>
							</button>

							
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>




<!--삭제 Modal -->
<div class="modal fade text-left" id="delete" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel120" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
		role="document">
		<div class="modal-content">
			<form name="deleteUser" action="deleteUser" method="post">
				<div class="modal-header bg-danger">
					<h5 class="modal-title white" id="myModalLabel120">회원삭제</h5>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<i data-feather="x"></i>
					</button>
				</div>
				<div class="modal-body">정말로<span id="delspan"></span>회원을 삭제하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-light-secondary"
						data-bs-dismiss="modal">
						<i class="bx bx-x d-block d-sm-none"></i> <span
							class="d-none d-sm-block">닫기</span>
					</button>
					<button type="button" class="btn btn-danger ml-1" id="btndel" data-bs-dismiss="modal">
						<i class="bx bx-check d-block d-sm-none"></i> <span class="d-none d-sm-block">확인</span>
					</button>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- modal 창 -->
<script>
$(function(){
	<!--modal 창에 단건 조회값을 띄우기-->
	$("#exampleModalLong").on('show.bs.modal', function(event){
				console.log(event);	
		let idx = $(event.relatedTarget).closest('tr').find('td').eq(0).text();
				$('#userSpan').html(idx);
		   	$.ajax({
	    		url : 'getUserList',
	    		type : 'get',
				data : {"id": idx},	
	    		dataType: 'json',
	    		success: function(result){
	    			console.log(result);
	    			if(result.length > 0 ){
	    				var id = result[0].id;
	    				var name = result[0].name;
	    				var email = result[0].email;
	    				var phonenum = result[0].phonenum;
	    				/* var auth = result[0].auth;	 */
	    		
	    					$("#exampleModalLong").find('[name=id]').val(id);
	    					$("#exampleModalLong").find('[name=name]').val(name);
	    					$("#exampleModalLong").find('[name=email]').val(email);
	    					$("#exampleModalLong").find('[name=phonenum]').val(phonenum);
	    					/* $("#exampleModalLong").find('[name=auth]').val(auth);  */
	    				
	    			}
				}
			})
			
	});
	
	<!--양소민 수정. 자격증, 경력증명서 조회-->
	$("#getCertiModal").on('show.bs.modal', function(event){
		let idx = $(event.relatedTarget).closest('tr').find('td').eq(0).text();
		
		let condi = "manUser";
		$('#certiModalSom').html(idx);
		
		var sendData = "idx="+idx+'&condi='+condi;
		
		$(document).ready( function () {
	    	$.ajax({
	    		url : "getCertiList",
	    		method:'POST',
	    		data : sendData,
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
				
				$(tr).append(td1);
				$(tr).append(td2);
				$(tr).append(td3);
				$(tr).append(td4);
				$(tr).append(td5);
				$(tr).append(td6);
				$('#certi').append(tr);
				
			
				
			}
			
			
		}
		
		
		$(document).ready( function () {
	    	$.ajax({
	    		url : "getCarList",
	    		method:'POST',
	    		data : sendData,
	        	success : function (result) {
	        		var list = result;
	        		for(certi of list ) {
	        			
	        			
	        			let tr2 = $('<tr />');
	        			let td5 = $('<td />').html(certi.CARRER_CERTI);
	        			let td6 = $('<td />');
	        			
	        			
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
	
});
	
	
	<!--회원 정보 수정-->
	$("#btnup").on("click", function(event){
		let idx =$('#userSpan').html();
		let idx1 = $('#name').val();
		let idx2 = $('#email').val();
		let idx3 = $('#phonenum').val();
		let idx4 = $('#address').val();
		$.ajax({
			url : 'updateUserProc',
			type: 'POST',
			data :{id: idx, 
				   name: idx1, 
				   email : idx2, 
				   phonenum : idx3, 
				   address : idx4},
			dataType :'text',
			success: function(result){
				location.reload();		
			},error : function(result){
				alert("x");
			}
			
		})
	})
	
	<!-- delete modal 클릭-->
	
	$("#delete").on('show.bs.modal', function(event){
		let idx = $(event.relatedTarget).closest('tr').find('td').eq(0).text();
			console.log(idx);
		$('#delspan').html(idx);
	});
	
	<!-- 삭제 modal 창 -->
	$("#btndel").on('click', function(event){
			console.log(event);
		let idx = $('#delspan').html();
			$.ajax({
				url: 'deleteUser',
				type : 'GET',
				data : {"id": idx},
				dataType : 'text',
				success : function(result){	
					location.reload();
				}
			})
	});
	
	<!--회원 승급 modal click-->
	
	$("#info").on('show.bs.modal', function(event){
		let idx = $(event.relatedTarget).closest('tr').find('td').eq(0).text();
			console.log(idx);
		$('#authSpan').html(idx);
	});
	
	<!--회원 승급 modal 창-->
	$("#btnAuth").on('click', function(event){
		console.log(event);
		let idx = $('#authSpan').html();
		
		var makeAjax = function(url, result){
			
			$.ajax({
				url : url,
				type : 'POST',
				data : {"id":idx},
				dataType : 'text',
				success : function(result){
					location.reload();
				
				} 
				
			});
		
		};
				makeAjax(
					'authUser',
					makeAjax(
						'authMento',
						function(){}
					)
				);	
		
	});
	
	<!--회원 강등 modal click-->
	$("#down").on('show.bs.modal', function(event){
		let idx = $(event.relatedTarget).closest('tr').find('td').eq(0).text();
		console.log(idx);
		$('#authDownSpan').html(idx);
	});
	
	<!-- 회원 강등 modal 창-->
	$("#btnDownAuth").on('click', function(event){
		console.log(event);
		let idx = $('#authDownSpan').html();
		
		var makeAjax = function(url, result){
		
			$.ajax({
				url: 'authDownUser',
				type : 'GET',
				data : {"id":idx},
				dataType : 'text',
				success : function(result){
					location.reload();
				
				} 
				
			});
		};
		
				makeAjax(
					'authDownUser',
					makeAjax(
						'authDownMento',
						function(){}
							)
				);
	});
	
	<!--이력서를 냈으나 USER 등급인 유저-->
	$("#mensyscount").ready(function(){
			
		$.ajax({
			url : 'mentorSys',
			async : false,
			type : 'get',
			dataType : 'json',
			success : function(response){
				console.log(response[0].COUNTAUTH);
				var scount = response[0].COUNTAUTH;
				if(scount != 0){
					$('#mensyscount').text("현재 멘토 승급 대기 인원수:" + response[0].COUNTAUTH + "명");
				}else{
					$('#mensyscount').text("현재 신청한 사람이 없습니다.");
				}
			}
		
		});
	});

});

<!--검색-->
	
	 	$('#searchBtn').click(function() {
		 self.location = "userList" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
		});
	  

</script>
