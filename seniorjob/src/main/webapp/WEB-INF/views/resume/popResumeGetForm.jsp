<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>businessPlanInsert.jsp</title>
<meta name="description" content="company is a real-estate template">
<meta name="author" content="Kimarotec">
<meta name="keyword"
	content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800'
	rel='stylesheet' type='text/css'>

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">

<link rel="stylesheet" href="resources/assets/css/normalize.css">
<link rel="stylesheet" href="resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/assets/css/fontello.css">
<link
	href="resources/assets/fonts/icon-7-stroke/css/pe-icon-7-stroke.css"
	rel="stylesheet">
<link href="resources/assets/fonts/icon-7-stroke/css/helper.css"
	rel="stylesheet">
<link href="resources/assets/css/animate.css" rel="stylesheet"
	media="screen">
<link rel="stylesheet"
	href="resources/assets/css/bootstrap-select.min.css">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/assets/css/icheck.min_all.css">
<link rel="stylesheet" href="resources/assets/css/price-range.css">
<link rel="stylesheet" href="resources/assets/css/owl.carousel.css">
<link rel="stylesheet" href="resources/assets/css/owl.theme.css">
<link rel="stylesheet" href="resources/assets/css/owl.transitions.css">
<link rel="stylesheet" href="resources/assets/css/style.css">
<link rel="stylesheet" href="resources/assets/css/responsive.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/json.min.js"></script>
<!-- ?????????, PDF ?????? -->
<script>
	function divPrint(){
		var initBody = document.body.innerHTML;
		window.onbeforeprint = function(){
			document.body.innerHTML = document.getElementById('printIs').innerHTML;
		}
		window.onafterprint = function(){
			document.body.innerHTML = initBody;
		}
		window.print();
	}
	
	/* ????????? ?????? */
	$(document).on("click", "#certiPl", function(){  
		var count = $(".certi_this").length;
		var certi_temp = $(".certi_temp").html();
		certi_temp = certi_temp.replace(/\[\]/g,"["+count+"]"); //?????????([] ??? ????????? ?????????)
		$("div[id=certi_ad]").append(certi_temp);
	})
	
	/* ????????? ?????? */
	$(document).on("click", "#certiDel", function(){
		var certi = $(this).closest('.certi_this');
		certi.remove();
	})
	
	/* ??????????????? ?????? */
	$(document).on("click", "#selfPl", function(){
		var count = $(".self_this").length;
		var self_temp = $(".self_temp").html();
		self_temp = self_temp.replace(/\[\]/g, "["+count+"]") // [] ????????? ?????? ????????????
		$("div[id=self_ad]").append(self_temp);
	})
	
	/* ??????????????? ?????? */
	$(document).on("click", "#selfDel", function(){
		var self = $(this).closest('.self_this');
		self.remove();
	})
	
	$(document).ready(function(){
		$("textarea").keyup(function(){
			var inputLength = $(this).val().length;
			if(inputLength > 2000) {
				alert("?????? ????????? ???????????? ?????? ????????????.");
			}
			var remain = 2000 - inputLength;
			$("h5").html(remain + "????????? ?????? ???????????????.");
		})
	})
	
	/* ????????? ???????????? */
	function setImage(event) {
		var reader = new FileReader();
		reader.onload = function(event){
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container").appendChild(img);
			/* ????????? ????????? ?????? ????????? ?????? ???, ?????? append */
			if(img.src != img){
				/* ????????? ????????? ????????? ?????? */
				$('.select_img').find('img').remove()
	 			$('#image_container').find('img').remove();
	 			document.querySelector("div#image_container").append(img);			
			}
		}
		reader.readAsDataURL(event.target.files[0]);
	}
	
</script>
<style>
.select_img img{width: 90px; height:90px; margin:20px 0;}
</style>
    <body>
        <!-- property area -->
        <div class="content-area recent-property padding-top-40" style="background-color: #FFF;">
            <div class="container">  
                <div class="row">
                    <div class="col-md-8 col-md-offset-2"> 
                        <div class="" id="contact1">                        
                            <!-- /.row -->
                            <div align="center"><h2>?????????</h2></div>
                            <hr>
                            <form method="post" name="frm" id="frm" encType="multipart/form-data" action="resumeUpdate?resume_no=${resumeVO.resume_no }">
                            	
                                <div class="row" id="printIs">
	                                <div class="col-sm-12">
										<div class="form-group">
											<label>????????? ??????</label> 
											<input type="text" class="form-control" name="resume_title" id="resume_title" value="${resumeVO.resume_title }">
										</div>
									</div>
                           		   <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>??????</label>
                                            <div class="select_img">
	                                            <img src="image/${resumeVO.image }">
	                                            <div id="image_container" name="image_container" class="select_img"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>??????</label>
                                            <input type="text" class="form-control" id="resume_name" name="resume_name" value=${resumeVO.resume_name }>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>????????????</label>
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
                                            <label>????????? ??????</label>
                                            <input type="text" class="form-control" id="resume_phone" name="resume_phone" value=${resumeVO.resume_phone }>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>??????</label>
                                            <input type="text" class="form-control" id="resume_address" name="resume_address" value=${resumeVO.resume_address }>
                                        </div>
                                    </div>
									<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
									<div class="col-sm-12">
									<hr>
									</div>
                                    <h3>????????????</h3>

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>?????????</label>
                                            <input type="text" class="form-control" id="resume_school" name="resume_school" value=${resumeVO.resume_school }>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>??????</label>
                                            <input type="text" class="form-control" id="resume_major" name="resume_major" value=${resumeVO.resume_major }>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>??????</label>
                                            <input type="text" class="form-control" id="resume_area" name="resume_area" value=${resumeVO.resume_area }>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>?????????</label>
                                            <input type="date" class="form-control" id="resume_start" name="resume_start" value=${resumeVO.resume_start }>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>?????????</label>
                                            <input type="date" class="form-control" id="resume_end" name="resume_end" value=${resumeVO.resume_end }>
                                        </div>
                                    </div>
                                    <br><br><br><br><br><br><br><br><br>
                                    <div class="col-sm-12">
									<hr>
									</div>
                                    <div id="certi_ad">
                                    <h3>?????????</h3>
                                    <c:forEach items="${clist}" var="certi" varStatus="i"> 
                                    <div class='certi_this'>
                                    <input type="hidden" id="certi_no" name="clist[${i.index }].certi_no" value=${certi.certi_no }>
									<br><br>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                        	<label>????????? ??????</label>
                                            <select id = "certi_kinds" name = "clist[${i.index }].certi_kinds" value=${certi.certi_kinds }>
												<option value="IT" <c:if test="${certi.certi_kinds  eq 'IT' }">selected</c:if>>IT</option>
												<option value="??????/??????" <c:if test="${certi.certi_kinds eq '??????/??????' }">selected</c:if>>??????/??????</option>
												<option value="??????" <c:if test="${certi.certi_kinds eq '??????' }">selected</c:if>>??????</option>
												<option value="??????" <c:if test="${certi.certi_kinds eq '??????' }">selected</c:if>>??????</option>
												<option value="?????????" <c:if test="${certi.certi_kinds eq '?????????' }">selected</c:if>>?????????</option>
												<option value="??????/??????" <c:if test="${certi.certi_kinds eq '??????/??????' }">selected</c:if>>??????/??????</option>
												<option value="????????????" <c:if test="${certi.certi_kinds eq '????????????' }">selected</c:if>>????????????</option>
												<option value="??????" <c:if test="${certi.certi_kinds eq '??????' }">selected</c:if>>??????</option>
												<option value="??????" <c:if test="${certi.certi_kinds eq '??????' }">selected</c:if>>??????</option>
											</select>
                                        </div>
                                    </div>
									 <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>????????????</label>
                                            <select name="clist[${i.index }].accept" id="accept" value=${certi.accept }>
												<option value="1?????????" <c:if test="${certi.accept  eq '1?????????' }">selected</c:if>>1?????????</option>
												<option value="2?????????" <c:if test="${certi.accept  eq '2?????????' }">selected</c:if>>2?????????</option>
												<option value="????????????" <c:if test="${certi.accept  eq '????????????' }">selected</c:if>>????????????</option>
												<option value="????????????" <c:if test="${certi.accept  eq '????????????' }">selected</c:if>>????????????</option>
												<option value="????????????" <c:if test="${certi.accept  eq '????????????' }">selected</c:if>>????????????</option>
											</select>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>????????????</label>
                                            <input type="text" class="form-control" id="certi_name" name="clist.certi_name[${i.index }]" value=${certi.certi_name }>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>?????????/??????</label>
                                            <input type="text" class="form-control" id="certi_place" name="clist.certi_place[${i.index }]" value=${certi.certi_place }>
                                        </div>
                                    </div>
                                   
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>?????????</label>
                                            <input type="date" class="form-control" id="certi_date" name="clist.certi_date[${i.index }]" value=${certi.certi_date }>
                                        </div>
                                    </div>
                                    <br><br><br><br><br><br><br><br><br><br>
                                    </div>
                                    </c:forEach> 
                                    </div> 
                                    <div class="col-sm-12">
									<hr>
									</div>
										<div id="port_ad">
											<h3>???????????????</h3>
											<div class="col-sm-6">
												<div class="form-group">
													<c:forEach items="${plist }" var="port">
													<input type="hidden" name="portfolio" id="portfolio" value="${port.portfolio }">${port.portfolio }<br>
													</c:forEach>
												</div>
											</div>
										</div>
									<br><br><br><br><br><br><br><br>
									<div class="col-sm-12">
									<hr>
									</div>
									<div id="self_ad">
										<h3>???????????????</h3>
										<c:forEach items="${slist }" var="self" varStatus="i">
										<div class='self_this'>
										<input type="hidden" id="self_no" name="slist[${i.index }].self_no" value="${self.self_no }">
										<div class="col-sm-10">
											<div class="form-group">
												<label for="subject">??????</label> 
												<input type="text" class="form-control" id="self_name" name="slist[${i.index }].self_name" placeholder="??????????????? ??????" value=${self.self_name }>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<label for="message">??????</label>
												<textarea id="self_content" name="slist[${i.index }].self_content" class="form-control" 
												placeholder="????????? ???????????????.">${self.self_content }</textarea>
											</div>
										</div>
										</div>
										</c:forEach>
                                </div> 
                                </div>
                                <!-- /.row -->
								<br><br><br><br>
                                 
                            </form>
                        </div>
                    </div>    
                </div>
            </div>
        </div>
		
		<!-- ????????? ??????(????????? ???????????? ??????) -->
		<div style="display: none" class="certi_temp"> 
		  <div class='certi_this'>
              <input type="hidden" name="clist[${i.index }].certi_no" value=${certi.certi_no }><br><br>
                <div class="col-sm-6">
                  <div class="form-group">
                     <label>????????? ??????</label>
                        <select name = "clist[${i.index }].certi_kinds" value=${certi.certi_kinds }>
							<option value="IT" <c:if test="${certi.certi_kinds  eq 'IT' }">selected</c:if>>IT</option>
							<option value="??????/??????" <c:if test="${certi.certi_kinds eq '??????/??????' }">selected</c:if>>??????/??????</option>
							<option value="??????" <c:if test="${certi.certi_kinds eq '??????' }">selected</c:if>>??????</option>
							<option value="??????" <c:if test="${certi.certi_kinds eq '??????' }">selected</c:if>>??????</option>
							<option value="?????????" <c:if test="${certi.certi_kinds eq '?????????' }">selected</c:if>>?????????</option>
							<option value="??????/??????" <c:if test="${certi.certi_kinds eq '??????/??????' }">selected</c:if>>??????/??????</option>
							<option value="????????????" <c:if test="${certi.certi_kinds eq '????????????' }">selected</c:if>>????????????</option>
							<option value="??????" <c:if test="${certi.certi_kinds eq '??????' }">selected</c:if>>??????</option>
							<option value="??????" <c:if test="${certi.certi_kinds eq '??????' }">selected</c:if>>??????</option>
						</select>
                  </div>
                  </div>
					<div class="col-sm-6">
                      <div class="form-group">
                         <label>????????????</label>
                            <select name="clist[${i.index }].accept" value=${certi.accept }>
							   <option value="1?????????" <c:if test="${certi.accept  eq '1?????????' }">selected</c:if>>1?????????</option>
							   <option value="2?????????" <c:if test="${certi.accept  eq '2?????????' }">selected</c:if>>2?????????</option>
							   <option value="????????????" <c:if test="${certi.accept  eq '????????????' }">selected</c:if>>????????????</option>
							   <option value="????????????" <c:if test="${certi.accept  eq '????????????' }">selected</c:if>>????????????</option>
							   <option value="????????????" <c:if test="${certi.accept  eq '????????????' }">selected</c:if>>????????????</option>
							</select>
                      </div>
                     </div>
                     <div class="col-sm-6">
                      <div class="form-group">
                          <label>????????????</label>
                             <input type="text" class="form-control" name="clist[${i.index }].certi_name" value=${certi.certi_name }>
                      </div>
                     </div>
                     <div class="col-sm-6">
                        <div class="form-group">
                           <label>?????????/??????</label>
                               <input type="text" class="form-control"  name="clist[${i.index }].certi_place" value=${certi.certi_place }>
                         </div>
                     </div>
                     <div class="col-sm-6">
                         <div class="form-group">
                             <label>?????????</label>
                                <input type="date" class="form-control"  name="clist[${i.index }].certi_date" value=${certi.certi_date }>
                         </div>
                     </div>
                  <br><br><br><br><br><br><br><br><br><br>
                  </div>
                  
                  
                  
                  
                  <!-- ??????????????? ??????(????????? ???) -->
                  <div style="display: none" class="self_temp">
	                  <div class='self_this'>
						 <input type="hidden" id="self_no" name="slist[${i.index }].self_no" value="${self.self_no }">
							 <div class="col-sm-10">
								<div class="form-group">
									<label for="subject">??????</label> 
									<input type="text" class="form-control" id="self_name" name="slist[${i.index }].self_name" placeholder="??????????????? ??????" value=${self.self_name }>
								</div>
							</div>
							<div class="col-sm-12">
								<div class="form-group">
									<label for="message">??????</label>
									<textarea id="self_content" name="slist[${i.index }].self_content" class="form-control" 
									placeholder="????????? ???????????????.">${self.self_content }</textarea>
									<h5>2000????????? ?????? ???????????????.</h5>
								</div>
							</div>
					 </div>
				</div>
				<script src="resources/assets/js/modernizr-2.6.2.min.js"></script>
	<script src="resources/assets/js/jquery-1.10.2.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/js/bootstrap-select.min.js"></script>
	<script src="resources/assets/js/bootstrap-hover-dropdown.js"></script>

	<script src="resources/assets/js/easypiechart.min.js"></script>
	<script src="resources/assets/js/jquery.easypiechart.min.js"></script>

	<script src="resources/assets/js/owl.carousel.min.js"></script>
	<script src="resources/assets/js/wow.js"></script>

	<script src="resources/assets/js/icheck.min.js"></script>
	<script src="resources/assets/js/price-range.js"></script>

	<script
		src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=false"></script>
	<script src="resources/assets/js/gmaps.js"></script>
	<script src="resources/assets/js/gmaps.init.js"></script>

	<script src="resources/assets/js/main.js"></script>
    </body>
</html>