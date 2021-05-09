<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">  
    <!-- 워드파일이 깨지는 오류가 있음. -->
<% 
	response.setHeader("Content-Disposition", "attachment;filename=member.doc");
	response.setHeader("Content-Description", "JSP Generated Data");	
	response.setContentType("application/vnd.ms-word; charset=euc-kr");                                        
%>  
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <body>
        <!-- property area -->
        <div class="content-area recent-property padding-top-40" style="background-color: #FFF;">
            <div class="container">  
                <div class="row">
                    <div class="col-md-8 col-md-offset-2"> 
                        <div class="" id="contact1">                        
                            <!-- /.row -->
                            <div align="center"><h2>이력서</h2></div>
                            <hr>
                            <form name="frm">
                            	
                                <div class="row" id="printIs">
                           		   <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>사진</label>
                                            <%-- <img src="{path}/image/${resumeVO.image }">
                                            <input type="file" id="image" name="image"> --%>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>이름</label>
                                            <input type="text" class="form-control" id="resume_name" name="resume_name" value=${resumeVO.resume_name }>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>생년월일</label>
                                            <input type="text" class="form-control" id="resume_birth" name="resume_birth" value=${resumeVO.resume_birth }>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="email" class="form-control" id="resume_email" name="resume_email" value=${resumeVO.resume_email }>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>휴대폰 번호</label>
                                            <input type="text" class="form-control" id="resume_phone" name="resume_phone" value=${resumeVO.resume_phone }>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>주소</label>
                                            <input type="text" class="form-control" id="resume_address" name="resume_address" value=${resumeVO.resume_address }>
                                        </div>
                                    </div>
									<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                                    <h3>학력사항</h3>

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>학교명</label>
                                            <input type="text" class="form-control" id="resume_school" name="resume_school" value=${resumeVO.resume_school }>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>지역</label>
                                            <input type="text" class="form-control" id="resume_area" name="resume_area" value=${resumeVO.resume_area }>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>입학일</label>
                                            <input type="text" class="form-control" id="resume_start" name="resume_start" value=${resumeVO.resume_start }>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>졸업일</label>
                                            <input type="text" class="form-control" id="resume_end" name="resume_end" value=${resumeVO.resume_end }>
                                        </div>
                                    </div>
                                    <br><br><br><br><br><br><br><br><br>
                                    <h3>자격증</h3>
                                    <c:forEach items="${clist}" var="certi"> 
                                    <input type="hidden" id="certi_no" name="certi_no" value=${certi.certi_no }>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                        	<label>자격증 항목</label>
                                            <select id = "certi_kinds" name = "certi_kinds" value=${certi.certi_kinds }>
												<option value="IT" <c:if test="${certi.certi_kinds  eq 'IT' }">selected</c:if>>IT</option>
												<option value="세무/회계" <c:if test="${certi.certi_kinds eq '세무/회계' }">selected</c:if>>세무/회계</option>
												<option value="건축" <c:if test="${certi.certi_kinds eq '건축' }">selected</c:if>>건축</option>
												<option value="농업" <c:if test="${certi.certi_kinds eq '농업' }">selected</c:if>>농업</option>
												<option value="디자인" <c:if test="${certi.certi_kinds eq '디자인' }">selected</c:if>>디자인</option>
												<option value="보건/의료" <c:if test="${certi.certi_kinds eq '보건/의료' }">selected</c:if>>보건/의료</option>
												<option value="기계제작" <c:if test="${certi.certi_kinds eq '기계제작' }">selected</c:if>>기계제작</option>
												<option value="전기" <c:if test="${certi.certi_kinds eq '전기' }">selected</c:if>>전기</option>
												<option value="기타" <c:if test="${certi.certi_kinds eq '기타' }">selected</c:if>>기타</option>
											</select>
                                        </div>
                                    </div>
									 <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>합격구분</label>
                                            <select name="accept" id="accept" value=${certi.accept }>
												<option value="1차합격" <c:if test="${certi.accept  eq '1차합격' }">selected</c:if>>1차합격</option>
												<option value="2차합격" <c:if test="${certi.accept  eq '2차합격' }">selected</c:if>>2차합격</option>
												<option value="필기합격" <c:if test="${certi.accept  eq '필기합격' }">selected</c:if>>필기합격</option>
												<option value="실기합격" <c:if test="${certi.accept  eq '실기합격' }">selected</c:if>>실기합격</option>
												<option value="최종합격" <c:if test="${certi.accept  eq '최종합격' }">selected</c:if>>최종합격</option>
											</select>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>자격증명</label>
                                            <input type="text" class="form-control" id="certi_name" name="certi_name" value=${certi.certi_name }>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>발행처/기관</label>
                                            <input type="text" class="form-control" id="certi_place" name="certi_place" value=${certi.certi_place }>
                                        </div>
                                    </div>
                                   
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>취득일</label>
                                            <input type="text" class="form-control" id="certi_date" name="certi_date" value=${certi.certi_date }>
                                        </div>
                                    </div>
                                    </c:forEach>  
                                	<br><br><br><br><br><br><br><br><br><br>
									<h3>포트폴리오</h3>
									<div class="col-sm-6">
										<div class="form-group">
											<label for="subject">포트폴리오 및 기타문서</label> <br>
											<c:forEach items="${plist }" var="port">
											<input type="hidden" name="portfolio" id="portfolio" value="${port.portfolio }">${port.portfolio }<br>
											</c:forEach>
										</div>
									</div>
									<br><br><br><br><br><br><br><br>
									<h3>자기소개서</h3>
									<c:forEach items="${slist }" var="self">
									<input type="hidden" id="self_no" name="self_no" value="${self.self_no }">
									<div class="col-sm-10">
										<div class="form-group">
											<label for="subject">제목</label> 
											<input type="text" class="form-control" id="self_name" name="self_name" placeholder="자기소개서 제목" value=${self.self_name }>
										</div>
									</div>
									<div class="col-sm-12">
										<div class="form-group">
											<label for="message">내용</label>
											<textarea id="self_content" name="self_content" class="form-control" 
											placeholder="내용을 입력하세요.">${self.self_content }</textarea>
										</div>
									</div>
									</c:forEach>
                                </div>
                                <!-- /.row -->
                            </form>
                        </div>
                    </div>    
                </div>
            </div>
        </div>
    </body>
</html>