<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html class="no-js">
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/topHeader.jsp"></jsp:include>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/user/user.js"></script>

<style>
.error {
	color: red;
}

.register-blocks form input {
	border: 1px solid #fbb530;
}

.email_success {
	coler: green;
	display: none;
}

.email_fail {
	coler: red;
	display: none;
}
</style>
<body>
	<div class="content-area error-page"
		style="background-color: #FCFCFC; padding-bottom: 55px;">
		<div class="container">
		 <div class="col-md-12 pr-30 padding-top-40">
			<div class="row">
			<div class="col-md-3"></div>
				<div class="col-md-6">
					<div class="box-for overflow" id="form">
						<div class="col-md-12 col-xs-12 register-blocks">
							<h2>회원가입</h2>
							<form:form modelAttribute="usersVO" action="insertUsersProc"
								method="post" name="users">
								<div class="form-group">
									<label for="id">아이디</label>
									<form:input path="id" id="inputid" placeholder="아이디를 적어주세요.(ADMIN,admin 사용불가)"
										class="id" />
									<form:errors path="id" cssClass="error" />
									<!--<form:button class="idCheck" style="position:inherit; right: 20px;" type="button" id="idCheck" onclick="btnId();" value="N">중복체크</form:button>-->
									<div style="display: inline; width: 100%">
										<div class="text" id="idsuccess" style="color: green;">※아이디를 사용 할 수 있습니다.</div>
										<div class="text" id="idfail" style="color: red;">※이미 사용중인 아이디입니다.</div>
										<div class="text" id="idregexp" style="color: red;">※아이디 생성시 대소문자 또는 숫자로 시작, 최소4 ~ 최대 10까지 입력해주세요.(ADMIN,admin 사용불가)</div>	
									</div>
								</div>
								<div class="form-group">
									<label for="password">비밀번호</label>
									<form:password path="password" id="password" name="password" 
									 maxlength="10" class="pw" placeholder="4자리 이상 영문 대,소문자와 숫자, 특수기호가 적어도 한 개 포함." />
									<form:errors path="password" cssClass="error" />
								</div>
								<div class="form-group">
									<label for="passCheck">비밀번호 재확인</label> <input type="password"
										id="passCheck" name="passCheck"  maxlength="10" class="pw" />
									<div class="text" id="success" style="color: green;">※패스워드가 일치합니다.</div>
									<div class="text" id="fail" style="color: red;">※패스워드가 일치하지 않습니다.</div>
								</div>
								<div class="form-group">
									<label for="address">주소</label>
									<form:input path="postcode" id="sample6_postcode"
										placeholder="우편번호" />
									<form:errors path="postcode" cssClass="error" />
									<br> <input type="button"
										onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
									<form:input path="address" id="sample6_address" 
										placeholder="주소" />
									<form:errors path="address" cssClass="error" />
									<br>
									<form:input path="detailaddress" id="sample6_detailAddress" 
										placeholder="상세주소" />
									<form:errors path="detailaddress" cssClass="error" />
									<br>
									<form:input path="extraaddress" id="sample6_extraAddress" 
										placeholder="참고항목" />
									<form:errors path="extraaddress" cssClass="error" />
								</div>
								<div class="form-group">
									<label for="phonenum">전화번호</label>
									<form:input path="phonenum" id="inputphone"  placeholder="전화번호를 적어주세요. 예시:010-1234-5678" />
									<form:errors path="phonenum" cssClass="error" />
									<div class="text" id="phoneregexp" style="color: red;">※전화번호 양식을 따라주세요. 예시:010-1234-5678</div>
								</div>
								<div class="form-group">
									<label for="name">이름</label>
									<form:input path="name"  placeholder="이름을 적어주세요." />
									<form:errors path="name" cssClass="error" />
								</div>
								<div class="form-group">
									<label for="birth">생일</label>
									<form:input path="birth" id="inputbirth"  placeholder="생일을 적어주세요. 예시:88년 1월 1일생 -> 880101" />
									<form:errors path="birth" cssClass="error" />
									<div class="text" id="birthregexp" style="color: red;">※생일양식을 따라주세요. 예시: 880101</div>
								</div>
								<div class="form-group">
									<label for="email">Email</label>
									<!-- style에 uppercase를 줘서 대문자로 입력되도록 한다. -->
									<form:input path="email" id="inputemail" class="email" placeholder="이메일 예제(ex:USER1@NAVER.COM)" name="email" />
									<form:errors path="email" cssClass="error"/>
										<div class="text" id="emailsuccess" style="color: green;">※중복되지 않는 이메일입니다.</div>
										<div class="text" id="emailfail" style="color: red;">※중복된 이메일입니다.</div>
										<div class="text" id="emailregexp" style="color: red;">※이메일 양식에 맞춰주세요.</div>
								</div>
								<div class="text-center">
									<button type="submit" id="inputbutton" class="btn btn-default">가입</button>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>

	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
</html>