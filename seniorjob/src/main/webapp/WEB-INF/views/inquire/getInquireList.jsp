<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<jsp:include page="../topHeader.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
<script>

function click_seq(obj){

	
	$("#example tr").click(function(){ 	
		var tr = $(this);
		var td = tr.children();
		var no = td.eq(0).text();
		var no1 = td.eq(2).text();
	console.log(no);
	
 	$.ajax({
		url:"getAnswer",
		data :{seq : no},
		dataType : "json",
		success: function(result){
			$('#modal-body').val(""); // 태그 초기화
			$('#modal-body').remove();
			var response = result.list;
			$.each(response, function(i){
				var table1 = $("<table>").attr({id:"modal-body", class:"table table-hover" });
				var tr1 = $("<tr>").attr({id:"tr1"});
				var td1_1 = $("<td>").attr({id:"tr1_1"}).text("제목");
				var td1_2 = $("<td>").attr({id:"tr1_2"});
				var td1_2input = $("<input>").attr({id:"input1_2", type:"text", value:response[i].title});
				
				var tr2 = $("<tr>").attr({id:"tr2"});
				var td2_1 = $("<td>").attr({id:"tr2_1"}).html("작성일");
				var td2_2 = $("<td>").attr({id:"tr2_2"}).html(response[i].w_date);
				
				var tr3 = $("<tr>").attr({id:"tr3"});
				var td3_1 = $("<td>").attr({id:"tr3_1"}).html("내용");
				var td3_2 = $("<td>").attr({id:"tr3_2"});
				var td3_2input =  $("<textarea>").attr({id:"td3_2textarea", value:response[i].content}).html(response[i].content); 
				
				var input_seq = $("<input>").attr({id:"input_seq", type:"hidden", value:response[i].i_seq})
				var input_seq2 = $("<input>").attr({id:"input_seq2", type:"hidden", value:response[i].seq})
				table1.append(tr1, tr2,tr3,input_seq, input_seq2);
				tr1.append(td1_1,td1_2);
				tr2.append(td2_1,td2_2);
				tr3.append(td3_1,td3_2);
				
				td1_2.append(td1_2input);
 				td3_2.append(td3_2input);
				
				$("#table_body").append(table1);
				$("#myModalLabel").html("<strong>["+no1+"]</strong>"+"에 대한 답변입니다.");
				console.log(response[i]);
				console.log(no1);
				console.log(response[i].i_seq);
				
		

				
						})
			
					}		
			}); 

		})
	};
	
function answerUpdate(){
	var upCon = confirm("답변을 수정하시겠습니까?");
	if(upCon == true){ 
	$(function(){
		var seq = $('#input_seq').val();
		console.log(seq);
		var updateTitle =  $('#input1_2').val();
		var updateContent =  $('#td3_2textarea').val();
		
		$.ajax({
			url:"updateAnswer",
			type: "POST",
			data :{title : updateTitle, content : updateContent, i_seq : seq},
			success: function(result){
				location.href="/getInquireList";
				window.alert("답변이 수정되었습니다.");
				console.log(result);
			}
		});
	});
	}else if(upCon == false){
		
	}
	
}
function answerDelete(){
	var delCon = confirm("답변을 삭제하시겠습니까?");
	if(delCon == true){
		$(function(){
			var answerSeq = $('#input_seq').val();
			var inquireSeq = $('#input_seq2').val();
			
			$.ajax({
				url:"deleteAnswer",
				type: "POST",
				data :{i_seq : answerSeq, seq : inquireSeq},
				success: function(result){
					location.href="/getInquireList";
					window.alert("답변이 삭제되었습니다.");
				}
			});
		});
		
	}else if(delCon == false){
		
	}
};
	
</script>
<style>
.modal-content {
    height: 650px;
}
td#tr3_1 {
    width: 81px;
}
tr#tr3 {
    height: 322px;
}
hr#hr1 {
    margin-top: -9px;
}
button.btn.btn-default.answer {
    margin-right: 70px;
    margin-top: 29px;
    border: 1px solid #FDC600;
}
textarea#td3_2textarea {
    width: 464px;
    height: 305px;
    resize: none;
}
.col-xs-2.selectO {
    margin-left: -28px;
    margin-right: -26px;
}
.col-xs-6.selectS {
    right: 36px;
    top: -21px;
}
.input-group {
    position: relative;
    display: table;
    border-collapse: separate;
    border: 1px solid bisque;
    margin: 20px;
}
.col-md-6.padding-top-40.properties-page.user-properties {
    top: -60px;
    right: -245px;
}
button.btn.btn-primary.blue {
    margin-left: 631px;
    margin-top: -49px;
}
button.btn.btn-primary.green {
    margin-top: -48px;
    margin-left: 9px;
}
</style>
<body>
	<!-- property area -->
	<div class="content-area recent-property"
		style="background-color: #FFF;">
		<div class="container">
			<div class="row">
				
				<!--왼쪽 -->
				<jsp:include page="../Service_Center/new_sevice_left.jsp"></jsp:include>
				<!--왼쪽  -->
				<div class="col-md-1 pr-30 padding-top-40 properties-page user-properties">
				</div>
				<div id="optionVal"
					class="col-md-9 pr-30 padding-top-40 properties-page user-properties">

					
				<h4 style="text-align: center;"><strong>회원 전체 문의 목록</strong></h4>
				<br>
					<div id="btn123">
							<button  class="btn btn-primary blue" type="button"  onclick="optionSelect2()" value="답변완료">답변완료</button>
							<button class="btn btn-primary green" type="button"onclick="optionSelect3()" value="미답변">미답변</button>
					</div>
					<!--목록 게시판  -->
					<table class="table table-striped" id="example">
						<tr>
							<th>번호</th>
							<th>구분</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>상태</th>
						</tr>
						<c:if test="${not empty list}">
						<c:forEach items="${list }" var="b">
							<tr>
								<td onclick="location.href='getInquire?seq=${b.seq}'">${b.seq}</td>
								<td onclick="location.href='getInquire?seq=${b.seq}'">${b.category_a }</td>
								<td onclick="location.href='getInquire?seq=${b.seq}'">${b.title }</td>
								<td onclick="location.href='getInquire?seq=${b.seq}'">${b.id }</td>
								<td onclick="location.href='getInquire?seq=${b.seq}'"><fmt:formatDate value="${b.w_date }" pattern="yyyy-MM-dd"/></td>
								<td>
								<c:if test="${b.status eq '답변완료'}">
								<button type="button" id="#" onclick="click_seq()" class="btn btn-primary" data-toggle="modal" data-target="#myModal">답변확인</button>
								</c:if>
								<c:if test="${b.status eq '미답변'}">
								${b.status }
								</c:if>
								</td>
							</tr>
						</c:forEach>
						</c:if>
					</table>
							<c:if test="${empty list}">
							<h3 style="text-align: center;"><strong>검색한 키워드에 맞는 게시글이 존재하지 않습니다.</strong></h3>
							</c:if>
						
						
						
	<!--검색기능  -->
				<div
					class="col-md-12  properties-page user-properties">
					<form role="form" method="get">
						<div class="search">
							<br>
						</div>
						<div class="col-xs-2 selectO">
						<select id="items_per_page" onchange="optionSelect(this)"class="selectpicker show-tick form-control" tabindex="-98">
								<option value="" id="select0">전체</option>
								<option value="결제" id="select1">결제</option>
								<option value="환불" id="select2">환불</option>
								<option value="신청" id="select3">신청</option>
								<option value="취소" id="select4">취소</option>
								<option value="기타" id="select5">기타</option>
							</select>
						</div>
						
						<div class="col-xs-2 selectT">
							<div class="btn-group bootstrap-select show-tick form-control">
								<div class="dropdown-menu open"
									style="max-height: 640.781px; overflow: hidden; min-height: 109px;">
								</div>
								<select id="basic" name="searchType"
									class="selectpicker show-tick form-control" tabindex="-98">
									<option value="t"
										<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
									<option value="c"
										<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
									<option value="w"
										<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
									<option value="tc"
										<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
								</select>
							</div>
						</div>
						<div class="col-xs-6 selectS">
							<div class="input-group" id="input-group">
								<input class="form-control" name="keyword" id="keywordInput"
									value="${scri.keyword}"
									style="text-align: center; height: 45px; width: 500px"
									type="text" placeholder="내용 입력 "> <span
									class="input-group-btn">
									<button class="btn btn-primary subscribe" id="searchBtn"
										type="button">
										<i class="pe-7s-paper-plane pe-2x"></i>
									</button>
									
<script>
function optionSelect(obj){
	var param = 'optionValue='+$('#items_per_page').val();
	location.href='getInquireList?'+(obj==""?"":param);
	}
function optionSelect2(){
	location.href='getInquireList?optionValue2=답변완료';			
	}    
function optionSelect3(){
	location.href='getInquireList?optionValue2=미답변';			
	}    
	
/* function valueO(){
	var gup = getURLParams(location.search).optionValue;
	var gup2;
	if(typeof gup == 'undefined'){
		gup2
	}

} */	
$(function() {
	$('#searchBtn').click(
		function() {		self.location = "getInquireList"
							+ '${pageMaker.makeQuery(1)}' + "&searchType="
							+ $("#basic option:selected").val() + "&keyword="
							+ encodeURIComponent($('#keywordInput').val())
							+ "&optionValue=" + getURLParams(location.search).optionValue;
							});
			});
	//카테고리 체크검색(결제/환불/신청...)

/* $(function() {
		//체크 초기화
		$('[value=${param.optionValue}]').iCheck('check');
		//체크 검색
		$('[name="cs_biz_form"]').on('ifClicked', function() {
			var param = 'optionValue=' + $(this).val();
			location.href = 'getInquireList?' + param;
			});
		}); */
function getURLParams(url) {
    var result = {};
    url.replace(/[?&]{1}([^=&#]+)=([^&#]*)/g, function(s, k, v) { result[k] = decodeURIComponent(v); });
    return result;
}

 $(function(){
	if(getURLParams(location.search).optionValue == '결제'){
		$('#select1').attr('selected','selected')
	}else if(getURLParams(location.search).optionValue == '환불'){
		$('#select2').attr('selected','selected')
	}else if(getURLParams(location.search).optionValue == '신청'){
		$('#select3').attr('selected','selected')
	}else if(getURLParams(location.search).optionValue == '취소'){
		$('#select4').attr('selected','selected')
	}else if(getURLParams(location.search).optionValue == '기타'){
		$('#select5').attr('selected','selected')
	}else if(getURLParams(location.search).optionValue2 == '미답변' ){
		$('#select0').attr('selected','selected')
		
	}else if(getURLParams(location.search).optionValue2 == '답변완료'){
		$('#select0').attr('selected','selected')
	}
}); 	

</script>
								</span>
							</div>
						</div>
					</form>
				</div>
					<!--페이징  -->
					<div
						class="col-md-6  padding-top-40 properties-page user-properties">
						<div class="pagination" style="float: center">
							<ul>
								<c:if test="${pageMaker.prev}">
									<li><a
										href="getInquireList${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}" var="idx">
									<li><a href="getInquireList${pageMaker.makeSearch(idx)}">${idx}</a></li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="getInquireList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
								</c:if>
							</ul>
						</div>
					</div>
					
				<!-- Modal -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel"></h4>
								</div>
								<div class="modal-body" id="table_body">
								<!--실제 내용 부분  -->
								<table class="table table-hover" id="modal-body">
								
								</table>
								<!--실제 내용 부분  -->
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default answer"  id="answerBtn1"name="answerButton"  onclick="answerUpdate()">답변수정</button>
									<button type="button" class="btn btn-default answer" name="answerButton" onclick=" answerDelete()" >답변삭제</button>
									<button type="button" class="btn btn-default answer" name="answerButton" data-dismiss="modal">목록으로</button>
									
										
								</div>
								
								
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
