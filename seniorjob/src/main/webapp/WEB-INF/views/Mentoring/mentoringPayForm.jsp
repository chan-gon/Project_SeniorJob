<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<style>
html,body,.wrapper{
    background: #f7f7f7;
}
.steps {
    margin-top: -41px;
    display: inline-block;
    float: right;
    font-size: 16px
}
.step {
    float: left;
    background: white;
    padding: 7px 13px;
    border-radius: 1px;
    text-align: center;
    width: 100px;
    position: relative
}
.step_line {
    margin: 0;
    width: 0;
    height: 0;
    border-left: 16px solid #fff;
    border-top: 16px solid transparent;
    border-bottom: 16px solid transparent;
    z-index: 1008;
    position: absolute;
    left: 99px;
    top: 1px
}
.step_line.backline {
    border-left: 20px solid #f7f7f7;
    border-top: 20px solid transparent;
    border-bottom: 20px solid transparent;
    z-index: 1006;
    position: absolute;
    left: 99px;
    top: -3px
}
.step_complete {
    background: #357ebd
}
.step_complete a.check-bc, .step_complete a.check-bc:hover,.afix-1,.afix-1:hover{
    color: #eee;
}
.step_line.step_complete {
    background: 0;
    border-left: 16px solid #357ebd
}
.step_thankyou {
    float: left;
    background: white;
    padding: 7px 13px;
    border-radius: 1px;
    text-align: center;
    width: 100px;
}
.step.check_step {
    margin-left: 5px;
}
.ch_pp {
    text-decoration: underline;
}
.ch_pp.sip {
    margin-left: 10px;
}
.check-bc,
.check-bc:hover {
    color: #222;
}
.SuccessField {
    border-color: #458845 !important;
    -webkit-box-shadow: 0 0 7px #9acc9a !important;
    -moz-box-shadow: 0 0 7px #9acc9a !important;
    box-shadow: 0 0 7px #9acc9a !important;
    background: #f9f9f9 url(../images/valid.png) no-repeat 98% center !important
}

.btn-xs{
    line-height: 28px;
}

/*login form*/
.login-container{
    margin-top:30px ;
}
.login-container input[type=submit] {
  width: 100%;
  display: block;
  margin-bottom: 10px;
  position: relative;
}

.login-container input[type=text], input[type=password] {
  height: 44px;
  font-size: 16px;
  width: 100%;
  margin-bottom: 10px;
  -webkit-appearance: none;
  background: #fff;
  border: 1px solid #d9d9d9;
  border-top: 1px solid #c0c0c0;
  /* border-radius: 2px; */
  padding: 0 8px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
}

.login-container input[type=text]:hover, input[type=password]:hover {
  border: 1px solid #b9b9b9;
  border-top: 1px solid #a0a0a0;
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
}

.login-container-submit {
  /* border: 1px solid #3079ed; */
  border: 0px;
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,0.1); 
  background-color: #357ebd;/*#4d90fe;*/
  padding: 17px 0px;
  font-family: roboto;
  font-size: 14px;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#4787ed)); */
}

.login-container-submit:hover {
  /* border: 1px solid #2f5bb7; */
  border: 0px;
  text-shadow: 0 1px rgba(0,0,0,0.3);
  background-color: #357ae8;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#357ae8)); */
}

.login-help{
  font-size: 12px;
}

.asterix{
    background:#f9f9f9 url(../images/red_asterisk.png) no-repeat 98% center !important;
}

/* images*/
ol, ul {
  list-style: none;
}
.hand {
  cursor: pointer;
  cursor: pointer;
}
.cards{
    padding-left:0;
}
.cards li {
  -webkit-transition: all .2s;
  -moz-transition: all .2s;
  -ms-transition: all .2s;
  -o-transition: all .2s;
  transition: all .2s;
  background-image: url('//c2.staticflickr.com/4/3713/20116660060_f1e51a5248_m.jpg');
  background-position: 0 0;
  float: left;
  height: 32px;
  margin-right: 8px;
  text-indent: -9999px;
  width: 51px;
}
.cards .mastercard {
  background-position: -51px 0;
}
.cards li {
  -webkit-transition: all .2s;
  -moz-transition: all .2s;
  -ms-transition: all .2s;
  -o-transition: all .2s;
  transition: all .2s;
  background-image: url('//c2.staticflickr.com/4/3713/20116660060_f1e51a5248_m.jpg');
  background-position: 0 0;
  float: left;
  height: 32px;
  margin-right: 8px;
  text-indent: -9999px;
  width: 51px;
}
.cards .amex {
  background-position: -102px 0;
}
.cards li {
  -webkit-transition: all .2s;
  -moz-transition: all .2s;
  -ms-transition: all .2s;
  -o-transition: all .2s;
  transition: all .2s;
  background-image: url('//c2.staticflickr.com/4/3713/20116660060_f1e51a5248_m.jpg');
  background-position: 0 0;
  float: left;
  height: 32px;
  margin-right: 8px;
  text-indent: -9999px;
  width: 51px;
}
.cards li:last-child {
  margin-right: 0;
}
/* images end */



/*
 * BOOTSTRAP
 */
.container{
    border: none;
}
.panel-footer{
    background:#fff;
}
.btn{
    border-radius: 1px;
}
.btn-sm, .btn-group-sm > .btn{
    border-radius: 1px;
}
.input-sm, .form-horizontal .form-group-sm .form-control{
    border-radius: 1px;
}

.panel-info {
    border-color: #999;
}

.panel-heading {
    border-top-left-radius: 1px;
    border-top-right-radius: 1px;
}
.panel {
    border-radius: 1px;
}
.panel-info > .panel-heading {
    color: #eee;
    border-color: #999;
}
.panel-info > .panel-heading {
    background-image: linear-gradient(to bottom, #555 0px, #888 100%);
}

hr {
    border-color: #999 -moz-use-text-color -moz-use-text-color;
}

.panel-footer {
    border-bottom-left-radius: 1px;
    border-bottom-right-radius: 1px;
    border-top: 1px solid #999;
}

.btn-link {
    color: #888;
}

hr{
    margin-bottom: 10px;
    margin-top: 10px;
}

/** MEDIA QUERIES **/
@media only screen and (max-width: 989px){
    .span1{
        margin-bottom: 15px;
        clear:both;
    }
}

@media only screen and (max-width: 764px){
    .inverse-1{
        float:right;
    }
}

@media only screen and (max-width: 586px){
    .cart-titles{
        display:none;
    }
    .panel {
        margin-bottom: 1px;
    }
}

.form-control {
    border-radius: 1px;
}

@media only screen and (max-width: 486px){
    .col-xss-12{
        width:100%;
    }
    .cart-img-show{
        display: none;
    }
    .btn-submit-fix{
        width:100%;
    }
    
}
/*
@media only screen and (max-width: 777px){
    .container{
        overflow-x: hidden;
    }
}*/
h1{text-align:center}
</style>

<div class="container wrapper">
            <div class="row cart-head">
                <div class="container">
                <div class="row">
                    <p></p>
                </div>
                <div class="row">
                    <div style="display: table; margin: auto;">
                    	<!-- Spring 이동기능 참고: https://m.blog.naver.com/10hsb04/221671582487 -->
                        <button type="button" class="btn btn-primary" onclick="history.back(-1)">뒤로가기</button>
                        <button type="button" class="btn btn-primary" onclick="getMain()">메인페이지</button>
                    </div>
                </div>
                <div class="row">
                    <p></p>
                </div>
                </div>
            </div>   
            <div class="container">
	            <h1 class="display-3">멘토링 신청/결제</h1> 
            </div>
            <p></p>
            <form name="paymentFrm" id="paymentFrm" method="post">
            <input type="hidden" name="mentoring_number" id="mentoring_number" value="${mentoring.mentoring_number }">
            <input type="hidden"  name="mentoring_price" id="mentoring_price" value="${mentoring.mentoring_price }">
            <!-- 송다희 추가 -->
            <input type="hidden" name="mentor_id" id="mentor_id" value="${mentoring.mentor_id }">
            
            <!-- 송다희 추가 -->
            <input type="text"  name="cart_no" id="cart_no" value="${cart }">
            
            <div class="row cart-body">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-push-6 col-sm-push-6">
                    <!--REVIEW ORDER-->
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            결제 정보 <div class="pull-right"><small><a class="afix-1" href="#">장바구니 수정</a></small></div>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="col-sm-3 col-xs-3">
                                    <img class="img-responsive" src="image/${mentoring.mentoring_photo }" />
                                </div>
                                <div class="col-sm-6 col-xs-6">
                                    <div class="col-xs-12">${mentoring.mentoring_name }</div>
                                </div>
                            </div>
                            <div class="form-group"><hr /></div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <strong>결제 금액</strong>
                                    <div class="pull-right"><span>${mentoring.mentoring_price }</span><span>원</span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--CREDIT CART PAYMENT-->
                    <div class="panel panel-info">
                        <div class="panel-heading"><span><i class="glyphicon glyphicon-lock"></i></span>결제</div>
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="col-md-12"><strong></strong></div>
                                <div class="col-md-12"><button type="button" class="btn btn-primary btn-block" name="PayByCard" id="PayByCard">결제</button></div>
                            </div>
                        </div>
                    </div>
                    <!--CREDIT CART PAYMENT END-->
                    
                 <!--REVIEW ORDER END-->
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-pull-6 col-sm-pull-6">
                    <!--SHIPPING METHOD-->
                    <div class="panel panel-info">
                        <div class="panel-heading">신청 정보</div>
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="col-md-12">
                                    <h4>멘토링 정보</h4>
                                </div>
                            </div>
							<div class="form-group">
                                <div class="col-md-12"><strong>멘토링 이름</strong></div>
                                <div class="col-md-12">
                                    <input type="text" class="form-control" name="mentoring_name" value="${mentoring.mentoring_name }" readonly/>
                                </div>
                            </div>                            
                            <div class="form-group">
                                <div class="col-md-12"><strong>멘토 이름</strong></div>
                                <div class="col-md-12">
                                    <input type="text" class="form-control" name="country" value="${mentor.usersVO.name }" readonly/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>멘토링 기간</strong></div>
                                <div class="col-md-12">
                                    START<input type="text" class="form-control" name="s_date" id="s_date" value="${mentoring.s_date }" readonly/>
                                    END<input type="text" class="form-control" name="e_date" id="e_date" value="${mentoring.e_date}" readonly/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <h4>신청인(멘티) 정보</h4>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>이름</strong></div>
                                <div class="col-md-12">
                                    <input type="text" name="name" class="form-control" value="${users.name }" readonly/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>아이디</strong></div>
                                <div class="col-md-12">
                                    <input type="text" name="id" id="id" class="form-control" value="${users.id }" readonly/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>연락처</strong></div>
                                <div class="col-md-12">
                                    <input type="text" name="phonenum" class="form-control" value="${users.phonenum }" readonly/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>이메일</strong></div>
                                <div class="col-md-12">
                                    <input type="text" name="email" class="form-control" value="${users.email }" readonly/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--SHIPPING METHOD END-->
                    
                </div>
            </div>
            </form>
            <div class="row cart-footer">
        
            </div>
    </div>
    
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	
	$(function() { // 카드결제
		$('#PayByCard').click(function() {
			
			var formData1 = {
				"id" : $('#id').val(),
				"mentoring_number" : $('#mentoring_number').val()
			}
			var formData2 = {
				"id" : $('#id').val(),
				"mentoring_number" : $('#mentoring_number').val(),
				"men_start" : $('#s_date').val(),
				"met_end" : $('#e_date').val(),
				"mentoring_price" : $('#mentoring_price').val()
			}

			$.ajax({ // 결제 중복체크
				url : 'paymentChk',
				dataType : 'json',
				data : formData1, // == paymentFrm.serialize()
				success : function(result) {
					if (result == 0) {
						IMP.init('imp36880135'); // 인증 키
						IMP.request_pay({ // 결제 실행
							pg : 'html5_inicis', // 결제방식(이니시스)
							pay_method : 'card', // 결제수단
							merchant_uid : 'merchant_' + new Date().getTime(),
							//merchant_uid: "${mentoring.mentoring_number}", // 상품번호(재사용 불가)
							name : '${mentoring.mentoring_name}', // 상품이름
							//amount: "${mentoring.mentoring_price}", // 상품가격
							amount : 1000, // Test용 변수
							buyer_name : '${users.name}', // 구매자 이름
							buyer_tel : '${users.phonenum}' // 구매자 연락처
						}, function(response) {
							if (response.success) {
								alert('결제가 완료되었습니다');
								$.ajax({ // 데이터 삽입or업로드
									url : 'mentoringPayProc',
									dataType : 'json',
									data : formData2,
									success : function(response) {
										if (response.code != 200) {
												var paymentFrm = document.paymentFrm;
												paymentFrm.action = "PaymentSuccessForm";
												paymentFrm.submit();
										} else {
											alert('결제실패');
										}
									},
									error : function(response) {
										console.log('error = ' + response);
									}
								})
							} else {
								alert('결제실패 / ' + response.error_msg);
							}
						});
					} else {
						alert("이미 구매하신 멘토링 입니다.");
					}
				}
			});
		});
	});

	function getMain() { // 메인페이지 이동
		if (confirm("메인페이지로 이동하시겠습니까?")) {
			location.href = "getMain";
		}
	}
</script>