<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<jsp:include page="topHeader.jsp"></jsp:include>
<body>

	<!-- property area -->
	<div class="properties-area recent-property"
		style="background-color: #FFF;">
		<div class="container">
			<div class="row">

				<div class="col-md-3 p0 padding-top-40">
					<div class="blog-asside-right pr0">
						<div class="panel panel-default sidebar-menu wow fadeInRight animated">
							<div class="panel-heading">
								<h3 class="panel-title">고객센터</h3>
							</div>
						</div>
						<hr>
						<div class="panel panel-default sidebar-menu wow fadeInRight animated">
							<div class="panel-heading">
								<h3 class="panel-title">결제/환불</h3>
							</div>
						</div>
						<div class="panel panel-default sidebar-menu wow fadeInRight animated">
							<div class="panel-heading">
								<h3 class="panel-title">신청/취소</h3>
							</div>
						</div>
						<div class="panel panel-default sidebar-menu wow fadeInRight animated">
							<div class="panel-heading">
								<h3 class="panel-title">화상면접 사용법</h3>
							</div>
						</div>
						<div class="panel panel-default sidebar-menu wow fadeInRight animated">
							<div class="panel-heading">
								<h3 class="panel-title">문의하기</h3>
							</div>
						</div>
						<div class="panel panel-default sidebar-menu wow fadeInRight animated">
							<div class="panel-heading" onclick="location.href='inquireList'">
								<h3 class="panel-title">문의목록</h3>
							</div>
						</div>
					</div>
				</div>
				<form id="frm">	
				<div class="section additional-details">

					<h4 class="s-property-title">문의 등록</h4>
						<div class="col-sm-5">
                            <div class="form-group">
                                제목: <input type="text" class="form-control" id="">
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="form-group">
                                작성자: <input type="text" class="form-control" id="">
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                            	분류:
                                <select>
                                	<option>결제/환불</option>
                                	<option>화상</option>
                                	<option>기타</option>
                                </select>
                            </div>
                        </div>
                        <br>
                        <div class="col-sm-7"> 
                     		<div class="form-group">
                        		<label for="message">내용</label>
                         		<textarea id="self_content2" name="self_content2" class="form-control" placeholder="내용을 입력하세요."></textarea>
                      		</div>
                    	 </div>
					</div>
				</form>
			</div>
			<div align="right"><button type="button">등록</button></div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>