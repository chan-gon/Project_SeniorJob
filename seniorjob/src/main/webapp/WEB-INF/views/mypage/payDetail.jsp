<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function detail(num) {
	var url = "getMentoring?mentoring_number="+num;
	window.open(url);
}
</script>
 <jsp:include page="../topHeader.jsp"></jsp:include>
    <body>

  


        <!-- property area -->
        <div class="content-area recent-property" style="background-color: #FFF;">
            <div class="container">   
                <div class="row">

				<jsp:include page="../mypage.jsp"></jsp:include>

                    <div class="col-md-9 pr-30 padding-top-40 properties-page user-properties">

                        <div class="section"> 
        					  <div class="profiel-header">
                                <h3>
                                    <b>결제내역</b>
                                </h3>
                                <hr>
                            </div>

                        </div>
                        <c:forEach items="${list }" var="list">

                        <div class="section"> 
                            <div id="list-type" class="proerty-th-list">
                            <!--  -->
                                <div class="col-md-4 p0">
                                    <div class="box-two proerty-item">
                                        
                                        <div class="item-entry overflow">
                                            <div class="dot-hr"><h5><span> ${list.mentoring_name } </span></h5></div>
                                            <div>${list.s_date }</div>
                                            <span class="pull-left"><b> 결제완료</b></span>
                                            <span class="proerty-price pull-right"> ${list.mentoring_price }</span>
                                            <p style="display: none;"></p>

                                        </div>
                                    </div>
                                </div>                             

                                 <!--  -->
                                
                           
                                                                                      
                            </div>
                        </div>

						</c:forEach>
                        

                    </div>       

        
                </div>
            </div>
        </div>

  
<jsp:include page="../footer.jsp"></jsp:include>

    </body>
</html>
