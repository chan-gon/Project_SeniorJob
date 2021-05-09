<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="certiUpload" method="post" name="frm" enctype="multipart/form-data">
  <input type="hidden" id="valSom" name="valSom" value="${valSom}"> 
            <div class="clear">
                                <hr>
                                <br>
                              
                                                                   
                                        
                                         
                                            <div class="col-sm-5 col-sm-offset-1">
                                                <div class="form-group">
                                                    <label for="property-images">Chose Files :</label>
                                                    <input class="form-control" type="file" multiple="multiple" name="uploadFile" id="uploadFile">
                                                </div>
                                            </div>
                                       
                                  
                                    <!--  End step 3 -->
                            </div>
                            
                            <div class="col-sm-5 col-sm-offset-1">
                                <br>
                                <button type="submit" class="btn btn-primary">등록</button>
                                <br>
                                <br>
                            </div>
                          
</form>                            
</body>
</html>