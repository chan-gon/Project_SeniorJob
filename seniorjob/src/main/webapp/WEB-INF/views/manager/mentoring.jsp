<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<h1>멘토링 관리</h1><br/>
				<p class="text-subtitle text-muted">전체 멘토링을 볼 수 있는 목록 페이지입니다.</p>
			</div>
			<div class="col-12 col-md-6 order-md-2 order-first">
				
			</div>
		</div>
	</div>

	<section class="section">
		<div class="card">
			<div class="card-header">멘토링 데이터 테이블</div>
			<div class="card-body">
				<div class="dataTable-search">
				<form role="form" method="get">
					<div class="col-xs-12">
                         <div class="btn-group bootstrap-select show-tick form-control" style="width: 500px; ">
                         	 <div class="dropdown-menu open" style="max-height: 200px; overflow: hidden; min-height: 109px;"><ul class="dropdown-menu inner" role="menu" style="max-height: 100px; overflow-y: auto; min-height: 98px;"><li data-original-index="0" class=""><a tabindex="0" class="" style="" data-tokens="null"><span class="text"> -Status- </span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="1" class=""><a tabindex="0" class="" style="" data-tokens="null"><span class="text">Rent </span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="2" class="selected"><a tabindex="0" class="" style="" data-tokens="null"><span class="text">Boy</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="3"><a tabindex="0" class="" style="" data-tokens="null"><span class="text">used</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li></ul></div>
                         <select id="basic" name="searchType" class="form-select" style="width:200px;" tabindex="-98">
                              <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>------</option>
						      <option value="mentoring_number"<c:out value="${scri.searchType eq 'mentoring_number' ? 'selected' : ''}"/>>멘토링 코스 번호 </option>
						      <option value="mentoring_name"<c:out value="${scri.searchType eq 'mentoring_name' ? 'selected' : ''}"/>>멘토링 코스 이름</option>
						      
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
				
				<table class='table table-striped' style="font-size: 11px; text-align :center;" id="table1" >
					<thead>
						<tr>
							<th style="width:150px;">멘토링 코스 번호</th>
							<th style="width:200px;">멘토링 코스 이름</th>
							<th>멘토링 분야</th>
							<th>멘토링 시작일</th>
							<th>멘토링 종료일</th>
							<th>멘토링 상세보기</th>
							<th>멘토링 삭제</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<c:forEach items="${menViewAll}" var="ment">
							<tr>
								<td>${ment.mentoring_number }</td>
								<td>${ment.mentoring_name }</td>
								<td>${ment.mentoring_kind }</td>
								<td><fmt:formatDate value="${ment.mentoring_begin_date }" pattern="yyyy-MM-dd" /></td>
								<td><fmt:formatDate value="${ment.mentoring_end_date}" pattern="yyyy-MM-dd" /></td>
								<td><a href="#exampleModalLong" class="edit" data-bs-toggle="modal"> <i data-feather="file-text"></i></a></td>
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




<!-- 회원정보 수정 modal -->
<div class="modal fade" id="exampleModalLong" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLongTitle"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form action="updateUserProc" method="post">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">코스번호 <span id="menSpan"></span>번 멘토링 상세정보</h5>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<i data-feather="x"></i>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-4">
							<label>멘토링 코스번호</label>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<div class="position-relative">
									<input type="text" class="form-control" id="mennum" name="mennum" readonly="readonly">
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<label>멘토링 이름</label>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<div class="position-relative">
									<input type="text" class="form-control" id="menname" name="menname">
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<label>멘토링 분야</label>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<div class="position-relative">
									<input type="text" class="form-control"  id="menkind" name="menkind">
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<label>멘토링 소개</label>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<div class="position-relative">
									<input type="text" class="form-control" id="menintro" name="menintro">
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<label>멘토링 내용</label>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<div class="position-relative">
									 <textarea class="form-control" id="mencontent" name="mencontent" rows="10"></textarea>
								</div>
							</div>
						</div>
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
					<h5 class="modal-title white" id="myModalLabel120">멘토링 삭제</h5>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<i data-feather="x"></i>
					</button>
				</div>
				<div class="modal-body">정말로 <span id="delspan"></span>번호 멘토링을 삭제하시겠습니까?</div>
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
				$('#menSpan').html(idx);
		   	$.ajax({
	    		url : 'getManMentoringList',
	    		type : 'get',
				data : {"mentoring_number": idx},	
	    		dataType: 'json',
	    		success: function(result){
	    			console.log(result);
	    			if(result.length > 0 ){
	    				var mennum = result[0].mentoring_number;
	    				var menname = result[0].mentoring_name;
	    				var menkind = result[0].mentoring_kind;
	    				var menintro = result[0].mentoring_introduce;	
	    				var mencontent = result[0].mentoring_content;
	    		
	    					$("#exampleModalLong").find('[name=mennum]').val(mennum);
	    					$("#exampleModalLong").find('[name=menname]').val(menname);
	    					$("#exampleModalLong").find('[name=menkind]').val(menkind);
	    					$("#exampleModalLong").find('[name=menintro]').val(menintro);
	    					$("#exampleModalLong").find('[name=mencontent]').val(mencontent); 
	    				
	    			}
				}
			})
			
	});
	
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
				url: 'deleteManMentoring',
				type : 'GET',
				data : {"mentoring_number": idx},
				dataType : 'text',
				success : function(result){	
					location.reload();
				}
			})
	});
	
});

<!--검색-->
	
	 	$('#searchBtn').click(function() {
		 self.location = "mentoringList" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
		});
	  

</script>
