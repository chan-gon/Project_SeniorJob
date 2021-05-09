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
function detail(id) {
	var url = "getMentor?mentor_id="+id;
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
                                    <b>수강중인 멘토링</b>
                                </h3>
                                <hr>
                            </div>

                        </div>
                        <c:if test="${empty list }">
                        <h5>수강중인 멘토링이 없습니다.</h5>
                        </c:if>
					<c:forEach items="${list }" var="list" >
                        <div class="section"> 
                            <div id="list-type" class="proerty-th-list">
                                <div class="col-md-4 p0">
                                    <div class="box-two proerty-item">
                                    <div class="item-thumb">
                                            <a href="property-1.html" ><img src="image/${list.mentoring_photo }"></a>
                                        </div>
                                        <div class="item-entry overflow">
                                            <h5><span onclick="detail('${list.mentor_id}')">${list.mentoring_name } </span></h5>
                                            <div class="dot-hr"></div>
                                            <span class="pull-left"><b>수강기간 : ${list.men_start}-${list.met_end}</b></span>
                                            
                                            <span class="proerty-price pull-right">수강중</span>
                                            <p style="display: none;">${list.mentoring_content }</p>

                                        </div>
                                    </div>
                                </div>                             
                                                                                      
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
