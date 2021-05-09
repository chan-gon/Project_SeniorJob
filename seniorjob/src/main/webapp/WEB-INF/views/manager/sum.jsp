<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script><!-- google bar chart -->

<div class="main-content container-fluid">
	<div class="page-title">
		<div class="row">
			<div class="col-12 col-md-6 order-md-1 order-last" style="text-align: center; width: 1300px; font-family:monospace;">
				<h1>매출 관리</h1><br/>
				<p class="text-subtitle text-muted">월 매출을 볼 수 있는 페이지입니다.</p>
			</div>
			<div class="col-12 col-md-6 order-md-2 order-first">
				
			</div>
		</div>
	</div>
</div>

<!-- Bordered table start -->
<div class="row" id="table-bordered">
	<div class="col-12">
		<div class="card">
			<div class="card-header"></div>
			<div class="card-content">

				<section class="section">
					<div class="row">

						<div class="row">
							<div class="col-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">월 매출 조회</h4>
										<form action="summonth">
											<div id="chart_div">
											</div>
											
										</form>
									</div>
									<div class="card-content">
										<div class="card-body" style=" width: 400px; float: right;">
											<div class="dataTable-search">
												<form role="form" method="get" action="sumList">
													<div class="row">
														<div class="col-md-6 mb-4">
															<h6>년도</h6>

															<fieldset class="form-group">
																<select class="form-select" id="year" name="year">
																	<option>2021</option>
																</select>
															</fieldset>
														</div>
														<div class="col-md-6 mb-4">
															<h6>월</h6>

															<fieldset class="form-group">
																<select class="form-select" id="month" name="month">
																	<option>12</option>
																	<option>11</option>
																	<option>10</option>
																	<option>09</option>
																	<option>08</option>
																	<option>07</option>
																	<option>06</option>
																	<option>05</option>
																	<option>04</option>
																	<option>03</option>
																	<option>02</option>
																	<option>01</option>
																</select>
															</fieldset>
														</div>
														<div class="input-group mb-3">
															<span class="input-group-text" id="basic-addon1">월 매출 합계</span>
															<input type="text" class="form-control"
																placeholder="Addon to left" aria-label="Username"
																aria-describedby="basic-addon1" value="${monsum} 원">
															<button type="button" id="btn_submit" style="float:right;" class="btn btn-info">검색</button>
														</div>
													</div>
													</div>
												</form>
											</div>

											<table class='table table-striped' style="font-size: 11px;"
												id="table1">
												<thead>
													<tr>
														<th>멘토링 코스번호</th>
														<th>ID</th>
														<th>결제주문일</th>
														<th>주문금액</th>
													</tr>
												</thead>
												<tbody id="tbody">
													<c:forEach items="${sumList}" var="sumList">
														<tr>
															<td>${sumList.mentoring_number }</td>
															<td>${sumList.id }</td>
															<td><fmt:formatDate value="${sumList.s_date}" pattern="yyyy-MM-dd" /></td>
															<td>${sumList.men_price }</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<!-- Bordered table end -->

						</div>

					</div>
				</section>
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		var qStr = window.location.href.split("?")[1];
		   if(qStr != null){
		      var dt = qStr.split('&')[0].split('=')[1];
		      var yy = dt.substr(0,4);
		      var mm = dt.substr(4,2);
		      	$("#year").val(yy);
				$("#month").val(mm);
		   }else{
			   var today = new Date();
				$("#year").val(today.getFullYear());
				$("#month").val(fillZero(today.getMonth()+1));
		   }
	});
	
	$("#btn_submit").on("click",function(){
		var year = parseInt($("#year").val(), 10);
		var month = parseInt($("#month").val(), 10);
		
		var sDate = year+''+fillZero(month);
			month ++;
		if(month > 12){
			year++;
			month = 1;
		}		
		var eDate = year+''+fillZero(month);
		
		location.href = "sumList?" + "sDate=" + sDate + "&eDate=" + eDate;
	});
	
	function fillZero(_val){
		if(_val < 10){
			_val = '0'+_val;
		}
		return _val;
	}
	console.log(fillZero(-1));
	
	<!--구글 차트-->
	
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawBasic);

	function drawBasic() {
	

		 var data = new google.visualization.DataTable();
	       
	       data.addColumn('string', '2021년도');
	       data.addColumn('number', '월 합계 금액');
	        
	      var arr = [];
	      $.ajax({
	        	url : "summonth",
	        	async : false,  
	        	dataType : "json",
	        	success : function(result){
	        		console.log(result);
	        		for(o of result) {     
	        			arr.push([o.SMONTH, o.SUMMON]);
	        		}
	        		console.log(arr);
	        	} 
	        });
	        data.addRows(arr);
	        
	      var options = {
	        title: '월별 합계 매출',
	        chartArea: {width: '50%'},
	        hAxis: {
	          title: '금액(원)',
	          minValue: 0
	        },
	        vAxis: {
	          title: '월'
	        }
	      };

	      var chart = new google.visualization.BarChart(document.getElementById('chart_div'));

	      chart.draw(data, options);
	    }
	
	
</script>

