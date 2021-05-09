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
<script>

function click_seq(obj){
	$("#example tr").click(function(){ 	
		var tr = $(this);
		var td = tr.children();
		var no = td.eq(0).text();
		var no1 = td.eq(3).text();
	
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
				var td1_2 = $("<td>").attr({id:"tr1_2"}).text(response[i].title);
				var tr2 = $("<tr>").attr({id:"tr2"});
				var td2_1 = $("<td>").attr({id:"tr2_1"}).html("작성일");
				var td2_2 = $("<td>").attr({id:"tr2_2"}).html(response[i].w_date);
				var tr3 = $("<tr>").attr({id:"tr3"});
				var td3_1 = $("<td>").attr({id:"tr3_1"}).html("내용");
				var td3_2 = $("<td>").attr({id:"tr3_2"}).html(response[i].content);
				table1.append(tr1, tr2,tr3);
				tr1.append(td1_1,td1_2);
				tr2.append(td2_1,td2_2);
				tr3.append(td3_1,td3_2);
				$("#table_body").append(table1);
				$("#myModalLabel").html("<strong>["+no1+"]</strong>"+"에 대한 답변입니다.");
				console.log(response[i]);
				console.log(no1);

			})
			
		}		
	});
})
	};
</script>	
<style>
button.btn.btn-default {
    margin-right: 240px;
    margin-top: 31px;
}
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
div#optionVal {
    top: -24px;
}

tr#trMain {
    background-color: cornsilk;
}
tr#trSub {
    height: 61px;
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
				<div
					class="col-md-1 pr-30 padding-top-40 properties-page user-properties"></div>
				<!--왼쪽  -->
				<div id="optionVal"
					class="col-md-9 pr-30 padding-top-40 properties-page user-properties">
					<h4 id="h4title" style="text-align: center;"><strong>${id }님</strong> 문의 목록</h4>
					<br>	
					<hr id="hr1">
					<br>




					<!--목록 게시판  -->
					<input type="hidden" id="id" name="id" value="${id }">
					<c:if test="${not empty list}">
					<table class="table table-striped" id="example">
						<tr id="trMain">
							<th>글번호<th>
							<th>구분</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>답변 상태</th>
							<th>답변 확인</th>
						</tr>
						
						
						<c:forEach items="${list }" var="b">
							<input type="hidden" id="seq" name="seq" value="${b.seq }">
							<tr id="trSub">
								<td id="modal_Seq">${b.seq}<td>
								<td onclick="location.href='getUserInquire?seq=${b.seq}'">${b.category_a }</td>
								<td id="titleValue" onclick="location.href='getUserInquire?seq=${b.seq}'">${b.title }</td>
								<td onclick="location.href='getUserInquire?seq=${b.seq}'">${b.id }</td>
								<td onclick="location.href='getUserInquire?seq=${b.seq}'"><fmt:formatDate value="${b.w_date }" pattern="yyyy-MM-dd"/></td>
								<td onclick="location.href='getUserInquire?seq=${b.seq}'">${b.status}</td>
								<td>
								<c:if test="${b.status  eq '답변완료'}">
								<button type="button" id="#" onclick="click_seq()" class="btn btn-primary"data-toggle="modal" data-target="#myModal">답변확인</button>
								</c:if>
								</td>
								
							</tr>
						</c:forEach>
						
					</table>
					</c:if>
					<c:if test="${empty list}">
					<h3 style="text-align: center;"><strong>문의 내역이 없습니다.</strong></h3>
					</c:if>

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
									<h5 class="modal-title" id="myModalLabel" ></h5>
								</div>
								<div class="modal-body" id="table_body">
								<!--실제 내용 부분  -->
								<table class="table table-hover" id="modal-body">
								
								
								
								</table>
								<!--실제 내용 부분  -->
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">목록으로</button>
									
								</div>
								
							</div>
						</div>
					</div>

					<!--목록 게시판  -->





				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
