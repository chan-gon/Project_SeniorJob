<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자격증 등록</title>
<script>
function submit() {
	var frm = document.frm;
	frm.submit();
}


</script>
</head>
<body>
<form action="insertCerti" method="post" name="frm">
<input type="hidden" id="valSom" name="valSom" value="${valSom}">
    <div class="clear">
                                
                                <hr>
                                <br>
                                <div class="col-sm-5 col-sm-offset-1">
                                    <div class="form-group">
                                        <label>자격증명 :</label>
                                        <input name="certi_name" id="certi_name" type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>발행처/기관 :</label>
                                        <input name="certi_place" id="certi_place" type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>자격증번호:</label>
                                        <input name="certi_no" id="certi_no" type="text" class="form-control">
                                    </div>
                                     <div class="form-group">
                                        <label>취득일:</label>
                                        <input name="certi_date" id="certi_date" type="date" class="form-control">
                                    </div>
                                </div>  

                             
 
                            </div>
                    
                            <div class="area_btn col-sm-12 text-center">
				<button onclick="submit()" class="btn btn-primary">등록</button>
			</div>
</form>
</body>
</html>