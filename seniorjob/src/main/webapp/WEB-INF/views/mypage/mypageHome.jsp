<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<jsp:include page="../topHeader.jsp" />
 <head>
   <link href='resources/fullcalendar/lib/main.css' rel='stylesheet' />
    <script src='resources/fullcalendar/lib/main.js'></script>
     
     
    
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
       
    	
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	
          initialView: 'dayGridMonth',
          eventSources: [

        	    // your event source
        	    {
        	      url: 'getSearchSchedule'
        	      }
        	    

        	    // any other sources...

        	  ]
          
        });
        calendar.render();
        
        
      });
      
$(document).ready(function() {
	$.ajax({
        	url : "getSearchRequest",
        	success : showContents,
        	error : showErrors
        })
        
    $.ajax({
    	url : "replyQuestBadge",
    	success : function(result) {
    		var badge = result;
    		$("#reQBadge").html(badge);
    	},
    	error : function() {
    		console.log("error");
    	}
    })
    
    
    
        
 
});	  

$(document).ready(function() {
	$.ajax({
    	url : "checkPBadge",
    	success : function(result) {
    		var badge = result;
    		$("#cpBadge").html(badge);
    	},
    	error : function() {
    		console.log("error");
    	}
    })
    
    $.ajax({ //<!-- 수정 -->
    	url : "checkRBadge",
    	success : function(result) {
    		var badge = result;
    		$("#cRBadge").html(badge);
    	},
    	error : function() {
    		console.log("error");
    	}
    })
});

$(document).ready(function() {
$.ajax({
	url : "getSearchQuest",
	success : showContents,
	error : showErrors
})
});	

function resumeList(seq) {
	var url="popResumeList?seq="+seq;
		window.open(url,"","width=500,height=600");
	//location.href='updateSchedule?seq='+seq;
}

function updateQuest(seq) {
	var url="updateQuest?seq="+seq;
		window.open(url,"","width=500,height=600");
	//location.href='updateSchedule?seq='+seq;
}
  
function showErrors(result) {
	   console.log("error")
	  
	 }
	 
function showContents(result) {
	//console.log(result);
	for(list of result) {
		console.log(list.STATE);
		let li,a,div,dl,dt, but, but2, but3;
		li=$('<li />').attr("aria-hidden", "false").attr("style","float: left; list-style: none; position: relative; width: 300px; margin-right: 16px;").attr("class","somLi");
		a=$('<a />').attr("href","/zf_user/company-review-qst-and-ans").attr("target","_blank").attr("onclick","#").attr("class","link my_notification_card_link").attr("data-gtm_creative","card_main").attr("data-gtm_position","d15");
		div=$('<div />').attr("class","inner");
		dl=$('<dl />');
		dt=$('<dt />').attr("class","title").html(list.MENTORID+"가 <br />"+"다음 요청을 보냈습니다. <br />"+list.SCHEDULE_NAME+"<br />");
		but=$('<button />').attr("type","button").attr("onclick","resumeList("+list.SEQ+")").html("승낙<br />");
		but2=$('<button />').attr("type","button").attr("onclick","location.href='updateScheduleReject?seq="+list.SEQ+"'").html("거절<br />");
		but3=$('<button />').attr("type","button").attr("onclick","updateQuest("+list.SEQ+")").html("답변<br />");
		
		if(list.STATE == 'request'){
		$(dt).append(but);
		$(dt).append(but2);
		} else if(list.STATE == 'quest'){
			$(dt).append(but3);
		}
		
		$(dl).append(dt);
		$(div).append(dl);
		
		
		$(li).append(a);
		$(li).append(div);
		
		$('#ulId').append(li);
		
		var somLiCount = $(".somLi").length;
		console.log(somLiCount);
		$("#somLiBadge").html(somLiCount);
		
	}
}

function checkP() {
	var url = "checkP";
	window.open(url,"","width=500,height=600");
}

function checkR() {
	var url = "checkR";
	window.open(url,"","width=500,height=600");
}

function reply() {
	var url = "replyQuestFormSom";
	window.open(url,"","width=500,height=600");
}

	

    </script>
    <style>
/* somin */

#nudge_wrap {
    width: 260px;
    position: fixed;
    top: 96px;
    left: 50%;
    margin-left: 370px;
}

.btn_check {
    display: inline-block;
    position: absolute;
    right: 0;
    padding: 0 0 0 12px;
    width: 62px;
    height: 30px;
    border: 1px solid #dfdfdf;
    border-radius: 15px;
    box-sizing: border-box;
    color: #222;
    font-size: 13px;
    font-weight: normal;
    letter-spacing: -1px;
    background-color: #fff;
}

.btn_check:after {
    display: inline-block;
    position: absolute;
    top: 9px;
    right: 11px;
    width: 9px;
    height: 9px;
    background: url(//www.saraminimage.co.kr/sri/person/resume/ico_check.png) no-repeat -7px -7px;
    content: "";
}


.tabWrap .tab .badge {
    display: inline-block;
    margin: 0 0 0 8px;
    padding: 0 12px 0 13px;
    min-width: 36px;
    height: 28px;
    border-radius: 14px;
    box-sizing: border-box;
    color: #fff;
    font-size: 18px;
    letter-spacing: 0;
    vertical-align: top;
    background: #afbac8;
}

.tabWrap:after {
    display: table;
    clear: both;
    content: "";
    table-layout: fixed;
}

.my_notification .sliders .bx-viewport {
    overflow: visible !important;
}

.bx-viewport {
    -webkit-transform: translatez(0);
}

.my_notification .slider .link:after {
    position: absolute;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
    content: "";
    display: block;
    background: #fff;
    opacity: 0;
}

.my_notification .slider.my li:nth-of-type(4n+1), .my_notification .slider.apply li {
    border-color: #5189fa;
    background: #5189fa;
}


.my_notification .slider.my li:nth-of-type(4n+2), .my_notification .slider.request li {
    border-color: #00cba4;
    background: #00cba4;
}

.my_notification .slider.my li:nth-of-type(4n+3), .my_notification .slider.jobs li {
    border-color: #00beea;
    background: #00beea;
}

.my_notification .slider.my li:nth-of-type(4n+4), .my_notification .slider.company li {
    border-color: #a574ee;
    background: #a574ee;
}

.my_notification .slider li {
    float: left;
    position: relative;
    width: 300px;
    height: 190px;
    border-width: 1px;
    border-style: solid;
    border-radius: 16px;
    box-sizing: border-box;
    letter-spacing: -1px;
}

.my_notification .slider .title {
    overflow: hidden;
    margin-bottom: 12px;
    width: 100%;
    color: #fff;
    font-size: 18px;
    font-weight: bold;
    line-height: 24px;
    text-overflow: ellipsis;
    white-space: nowrap;
}

.my_notification .slider.my li .inner {
    padding: 31px 23px 23px 23px;
}

.my_notification .slider .inner {
    position: relative;
    z-index: 1;
    padding: 23px;
    height: 100%;
    box-sizing: border-box;


</style>
  </head>
<body>

	<div class="content-area recent-property"
		style="background-color: #FFF;">
		<div class="container">
			<div class="row">

				<jsp:include page="../mypage.jsp" />

				<div class="col-md-9 pr-30 padding-top-40 properties-page user-properties">
				
								<div class="section">
						<h3>열정적인 멘토, ${name } 님</h3>

						<div id="wrap_notification">
							<div class="my_notification complete">
								<ul class="tabWrap">
									<li class="select">
										<button type="button" class="tab" onmousedown="MYHOME.Myhome.gaEvent('dashboard_1', '')">
											나의 알림<span class="badge" id="somLiBadge"></span>
										</button>
										<c:if test="${auth eq 'MENTOR' }">
										<button type="button" class="tab" onmousedown="MYHOME.Myhome.gaEvent('dashboard_1', '')" onclick="checkP()">
											사업계획서 첨삭 요청<span class="badge" id="cpBadge"></span>
										</button>
										</c:if>
										<c:if test="${auth eq 'MENTOR' }">
										<button type="button" class="tab" onmousedown="MYHOME.Myhome.gaEvent('dashboard_1', '')" onclick="checkR()">
											이력서 첨삭 요청<span class="badge" id="cRBadge"></span>
										</button>
										</c:if>
										<c:if test="${auth eq 'USER' }">
										<button type="button" class="tab" onmousedown="MYHOME.Myhome.gaEvent('dashboard_1', '')" onclick="reply()">
											답변 목록<span class="badge" id="reQBadge"></span>
										</button>
										</c:if>
									</li>
								</ul>
								<div class="wrap_cards">
									<div class="sliders">
										<!-- 나의 알림 -->
										<div class="wrap_slider" style="max-width: 1248px; display: block;">
											<div class="bx-viewport" aria-live="polite" style="width: 100%; overflow: hidden; position: relative; height: 190px;">
												<ul class="slider my" id="ulId" style="width: 6215%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
													
												
												</ul>
											</div>
										</div>
									
										
									</div>
									<button type="button" class="btn_slider btn_prev"
										onmousedown="MYHOME.Myhome.gaEvent('card', 'previous')"
										disabled=""></button>
									<button type="button" class="btn_slider btn_next"
										onmousedown="MYHOME.Myhome.gaEvent('card', 'next')"></button>
								</div>
							</div>
							<script type="text/template" id="data_gtm_promotion_view">
    {"my_notify_card":["<li><a href='\/zf_user\/company-review-qst-and-ans' target='_blank' onclick='' class='link my_notification_card_link' data-gtm_creative='card_main' data-gtm_position='d15'><\/a><div class='inner'><dl><dt class='title'>\ucde8\uc5c5\uc900\ube44 \ub9c9\ub9c9\ud558\uc8e0?<br>\uc120\ubc30\ub4e4\uc5d0\uac8c \ubb3c\uc5b4\ubd10\uc694!<\/dt><\/dl><\/div><\/li>","<li><a href='\/zf_user\/member\/profile\/introduce-view' target='_parent' onclick='' class='link my_notification_card_link' data-gtm_creative='card_main' data-gtm_position='d17'><\/a><div class='inner'><dl><dt class='title'>\uc544\uc9c1 \uc790\uae30\uc18c\uac1c\uc11c\uac00 \uc5c6\uc73c\uc2e0\uac00\uc694?<\/dt><\/dl><\/div><\/li>","<li><a href='\/zf_user\/member\/webvq\/svq' target='_parent' onclick='' class='link my_notification_card_link' data-gtm_creative='card_main' data-gtm_position='d19'><\/a><div class='inner'><dl><dt class='title'>\ubb34\ub8cc \uc778\uc801\uc131\uac80\uc0ac\ub85c<br>\ubab8\ud480\uae30 \ud558\uc2e4\ub798\uc694?<\/dt><\/dl><\/div><\/li>","<li><a href='\/zf_user\/member\/profile\/school-view' onclick='' target='_parent' class='link my_notification_card_link' data-gtm_creative='card_main' data-gtm_position='d20'><\/a><div class='inner'><dl><dt class='title'>\ud55c\ubc88 \uc791\uc131\ud574\ub450\uba74<br>\uc774\ub825\uc11c \uc791\uc131\uc774 \ub354 \ud3b8\ud574\uc9d1\ub2c8\ub2e4.<\/dt><dd class='txt'>\uc5ed\ub7c9\uacfc \uc774\ub825 \uad00\ub9ac \uc11c\ube44\uc2a4<\/dd><dd class='txt'>MY DATA\ub97c \uc785\ub825\ud574\ub450\uc138\uc694~!<\/dd><\/dl><\/div><\/li>","<li><a href='\/zf_user\/persons\/scrap-recruit' onclick='' target='_parent' class='link my_notification_card_link' data-gtm_creative='card_main' data-gtm_position='d22'><\/a><div class='inner'><dl><dt class='title'>\uc2a4\ud06c\ub7a9, \ud574\ubcfc\ub7a9?<\/dt><dd class='txt'>\ub193\uce58\uae30 \uc26c\uc6b4 \uacf5\uace0\uc758<\/dd><dd class='txt'>\uc77c\uc815 \uc54c\ub9bc\uc744 \ubc1b\uc744 \uc218 \uc788\uc5b4\uc694.<\/dd><\/dl><\/div><\/li>","<li><a href='\/zf_user\/member\/avatar\/list' target='_parent' onclick='' class='link my_notification_card_link' data-gtm_creative='card_main' data-gtm_position='d23'><\/a><div class='inner'><dl><dt class='title'>\uc9c0\uc6d0\ud560\ub9cc\ud55c \uacf5\uace0\uc5d0<br>\uc0c8\ub85c\uc6b4 \uacf5\uace0\uac00 \uc788\uc5b4\uc694!<\/dt><\/dl><\/div><\/li>"],"apply_notify_card":[],"company_request_notify_card":["\n                                    <li>\n                                        <div class='inner'>\n                                            <div class='flag'><svg><use xlink:href='#svg_my_39'><\/use><\/svg>\uc601\uc0c1\uba74\uc811<\/div>\n                                            <label class='title_input' for='interview_code'>\uae30\uc5c5\uc73c\ub85c\ubd80\ud130 \uc218\uc2e0\ub41c \uc778\uc99d\ucf54\ub4dc\uac00<br>\uc788\uc744 \uacbd\uc6b0 \uc785\ub825\ud574\uc8fc\uc138\uc694<\/label>\n                                            <div class='wrap_input'>\n                                                <input id='interview_code' type='text' class='inpTypo2 sizeS' placeholder='\uc778\uc99d\ucf54\ub4dc\ub97c \uc785\ub825\ud558\uc138\uc694' value='' required \/>\n                                                <span><button type='button' class='btnSizeS colorBlue btn_certify'>\ud655\uc778<\/button><\/span>\n                                            <\/div>\n                                        <\/div>\n                                    <\/li>\n                                    ","<li><div class='spacer'><p class='title'>\uc601\uc0c1\uba74\uc811 \uc694\uccad\ub0b4\uc5ed\uacfc<br>\uc77c\uc815\uc744 \ud655\uc778\ud574\ubcf4\uc138\uc694.<br><a href='\/zf_user\/member\/video-interview' target='_blank' class='my_notification_card_link' data-gtm_creative='card_pool' data-gtm_position='default0'>\uc601\uc0c1\uba74\uc811 \ud648 \uac00\uae30<\/a><\/p><\/div><\/li>"],"recruit_notify_card":[{"rec_idx":"39720444","mcom_idx":"2504736","com_idx":"25414","bbs_gb":"0","company_nm":"(\uc8fc)\ucf54\ub09c\ud14c\ud06c\ub180\ub85c\uc9c0","simple_company_nm":"\ucf54\ub09c\ud14c\ud06c\ub180\ub85c\uc9c0","title":"\uc720\uc9c0\ubcf4\uc218 \uac1c\ubc1c","company_type":"venture,main-biz,innobiz,goodcompany,w-small-giant,ex_audit,ex_import","company_cd":"1","contact_address":"(06627) \uc11c\uc6b8 \uc11c\ucd08\uad6c \uac15\ub0a8\ub300\ub85c 327 \ub300\ub96d\uc11c\ucd08\ud0c0\uc6cc 6, 7\uce35(\uc11c\ucd08\ub3d9)","mcom_address":"\uc11c\uc6b8 \uc11c\ucd08\uad6c \uac15\ub0a8\ub300\ub85c 327, 6\uce35, 7\uce35","edu_cd":"8","sales_rank":"0","stock_gb":"","exp_cd":"3","exp_min":"0","exp_max":"3","gender":"","age_min":"0","age_max":"0","sal_cd":"0","salary":"0","job_type":"1","subway_cd":"0","subway_cd_distance":"null","read_cnt":"882","reg_dt":"1614755922","edit_dt":"1616050327","opening_dt":"1614697200","closing_dt":"2019567600","closing_date":"20331231","loc_cd":"101000,101150","loc_bcd":"101000,101150","loc_mcd":"101000","ind_key":"","cat_key":"40404|40413|40416|40427|40430|40720|40745|40746","keyword":".NET,HTML,Java\u00b7JSP,MS-SQL,MySQL,Oracle,\ubc31\uc5d4\ub4dc,\ud504\ub860\ud2b8\uc5d4\ub4dc","ind_cd":"","ind_bcd":"","cat_cd":"404,407","cat_bcd":"4","welfare_cd":"","preferential_cd":"","info_open_fl":"y","item_id":"","category":"","item_grade":"0","apply_cnt":"47","homepage":"www.konantech.co.kr","grab_source_cd":"","description":"","exam_nm":"","pre_nm":"","valuestatement":"n","com_photo":"n","personnel_manager_fl":"s,n,81","group_nm":"","workpost":"","major_cd":"","license_cd":"","job_grade":"","license_cd_type":"","cert_class":"venture,mainbiz,innobiz,goodcompany,w-small-giant","lang_exam":"","workday":"","apply_gb":"email","csn_num":"229-81-37316","upjik_bcode_nm":"IT\u00b7\uc778\ud130\ub137","upjik_code_nm":"\uc6f9\uac1c\ubc1c,\uc751\uc6a9\ud504\ub85c\uadf8\ub7a8\uac1c\ubc1c","rec_division":"","recruit_contents":"\uc720\uc9c0\ubcf4\uc218 \uac1c\ubc1c \uc11c\ube44\uc2a4 \uc18c\uac1c 'KONAN'\uc740 1999\ub144 \uc124\ub9bd\ub41c \uae30\uc220\ud601\uc2e0 \uae30\uc5c5\uc73c\ub85c \uc790\uc5f0\uc5b4\ucc98\ub9ac\uc640 \uc778\uacf5\uc9c0\ub2a5, \ube45\ub370\uc774\ud130\uc640 \ube44\uc815\ud604\ub370\uc774\ud130\ub97c \ud3ec\ud568\ud558\ub294 \ucd08\ub300\uc6a9\ub7c9 \ubb38\uc11c\ucc98\ub9ac\uae30\uc220\uc744 \ud1b5\ud574 \uace0\uac1d\uc758 \uac00\uce58\uc5d0 \uae30\uc5ec\ud558\ub294 \uc778\uacf5\uc9c0\ub2a5 \ubc0f \ube45\ub370\uc774\ud130 \uc18c\ud504\ud2b8\uc6e8\uc5b4 \uc804\ubb38\uae30\uc5c5\uc785\ub2c8\ub2e4. Korea Natural Language Analysis\uc758 \uc758\ubbf8\ub97c \ub2f4\uace0 \uc788\uc2b5\ub2c8\ub2e4. \ubaa8\uc9d1 \ubd80\ubb38 \ubc0f \uc0c1\uc138 \ub0b4\uc6a9 \uc0ac\uc6a9 \uae30\uc220 java, .net, javascript, css 3, jquery, html5, spring framework, oracle, mysql, mssql \uc8fc\uc694\uc5c5\ubb34 \u2022 \uc7a5\uc560 \ubc0f \uc624\ub958 \ub300\uc751, \uae30\uc220\ubb38\uc758 \uc751\ub300 \u2022 \ub2f9\uc0ac \uc194\ub8e8\uc158 \ub0a9\ud488 \uace0\uac1d\uc0ac \ubc29\ubb38\uc810\uac80 \u2022 \ub2f9\uc0ac \uc194\ub8e8\uc158(\uac80\uc0c9\uc5d4\uc9c4 \ub4f1) \uc14b\uc5c5 \u2022 \uac80\uc0c9\uc11c\ube44\uc2a4 \uc6f9 \ud398\uc774\uc9c0 \uac1c\ubc1c \ubc0f \uc131\ub2a5,\ud488\uc9c8 \uc870\uc815 cf. \uc5c5\ubb34\ube44\uc728 : \uc720\uc9c0\ubcf4\uc218 \uae30\uc220\uc9c0\uc6d0 8 : \uac1c\ubc1c 2 \uc790\uaca9\uc694\uac74 \u2022 \uc804\uacf5: \ubb34\uad00 \uc6b0\ub300\uc0ac\ud56d \u2022 \ucee4\ubba4\ub2c8\ucf00\uc774\uc158 \ub2a5\ub825 \ubc0f \uc11c\ube44\uc2a4 \ub9c8\uc778\ub4dc \ubcf4\uc720\uc790 \u2022 \ucef4\ud4e8\ud130 \uacf5\ud559 \ub610\ub294 IT \uad00\ub828\ud559\uacfc \uc6b0\ub300 \u2022 Java, .NET, Javascript, css \ucf54\ub529 \uac00\ub2a5\uc790 \u2022 \uae30\ubcf8 \uc804\uc0b0 \ubc0f IT\ubd84\uc57c \uacbd\ub825\uc790 \u2022 IT \uad00\ub828 \uc720\uc9c0\ubcf4\uc218 \uacbd\ub825\uc790 \ub9c8\uac10\uc77c \ubc0f \uadfc\ubb34\uc9c0 \u318d\ub9c8\uac10\uc77c : \uc0c1\uc2dc \u318d\uadfc\ubb34\uc9c0 : \uc11c\uc6b8\ud2b9\ubcc4\uc2dc \uc11c\ucd08\uad6c \uac15\ub0a8\ub300\ub85c 327 \ub300\ub96d\uc11c\ucd08\ud0c0\uc6cc 6, 7\uce35 \ubcf5\uc9c0 \ubc0e \ud61c\ud0dd \u2022 \uccad\ub144\ub0b4\uc77c\ucc44\uc6c0\uacf5\uc81c \/ \uccad\ub144\uc7ac\uc9c1\uc790\ub0b4\uc77c\ucc44\uc6c0\uacf5\uc81c \uc6b4\uc601 \u2022 \uc790\uc720\ub85c\uc6b4 \uc5f0\ucc28 \uc0ac\uc6a9, \uc790\uc720 \ubcf5\uc7a5, \uc7a5\uae30\uadfc\uc18d\uc790 \ud3ec\uc0c1 \ubc0f \ud734\uac00 \u2022 OJT, \uc628\/\uc624\ud504\ub77c\uc778 , \ub3c4\uc11c\uad6c\uc785\ube44 \uc9c0\uc6d0 \u2022 \uc120\ud0dd\uc801 \ubcf5\ub9ac\ud6c4\uc0dd(\uc5f0 100\ub9cc\uc6d0\uc774\uc0c1), \uacbd\uc870 \ube44\uc6a9&\ubb3c\ud488&\ud734\uac00 \uc9c0\uc6d0, \uc0dd\uc77c \ucd95\ud558\uae08, \uba85\uc808 \uc120\ubb3c \u2022 \uac74\uac15\uac80\uc9c4 \ube44\uc6a9\uc9c0\uc6d0, \uc778\ub825 \ucd94\ucc9c\/ \ud2b9\ud5c8 \uc218\ub2f9, \uc0ac\uc6b0\ud68c \uc6b4\uc601","kindness_expired_dt":"","company_file_fl":"n","logo_use_fl":"y","hidden_star_main_contents":"","hidden_star_rec_fl":"n","cooperator_category":"","pc_sort_dt":"1616050327","mobile_sort_dt":"1616050327","pc_keyword_product_nm":"","pc_keyword_booster_nm":"","mobile_keyword_product_nm":"","mobile_keyword_booster_nm":"","rec_manage_cd":"C,ZI,ZA,S,ZR","last_update_dt":"1616050327","job_category_origin_cd":"404,407","jkeyword_origin_cd":"40404,40413,40416,40427,40430,40720,40745,40746","employee_apply_status":"n","paid_fl":"n","scale":"\uc911\uc18c\uae30\uc5c5","hr_fl":"n","top_fl_order":"6","major":"","rt_paid_fl":"n","company_tag":"","bbsrecruit_tag":"","logo_src":"25414_logo.gif","com_data_status":"n","main_area_kcode":"16","rec_type_cd":"rtc001","recruitment_data_dp":"[]","company_auth_key":"451,804,109,579,199,976,213,1007,865,212,807,864,1012,225,1013,849,867","ai_head_hunting":"n","mcom_logo_src":"25414_logo.gif","loc_mcd_nm":"\uc11c\uc6b8","loc_bcd_nm":"\uc11c\uc6b8,\uc11c\ucd08\uad6c","jumpit_rec_idx":"280","jumpit_flag":"y","ROWID":48022,"score":0,"recruit_category_type":"recently"},{"rec_idx":"39791150","mcom_idx":"2775550","com_idx":"29552","bbs_gb":"1","company_nm":"\ub86f\ub370\uadf8\ub8f9","simple_company_nm":"\ub86f\ub370\uadf8\ub8f9","title":"\ub86f\ub370 \uc2e0\uc785\uc0ac\uc6d0 3\uc6d4 \uc0c1\uc2dc\ucc44\uc6a9","company_type":"stock,ex_import","company_cd":"0","contact_address":"","mcom_address":"\uc11c\uc6b8 \uc1a1\ud30c\uad6c \uc62c\ub9bc\ud53d\ub85c 300 \ub86f\ub370\uc6d4\ub4dc\ud0c0\uc6cc\uc564\ub4dc\ub86f\ub370\uc6d4\ub4dc\ubab0","edu_cd":"8","sales_rank":"0","stock_gb":"kospi","exp_cd":"1","exp_min":"0","exp_max":"0","gender":"ignore","age_min":"0","age_max":"0","sal_cd":"0","salary":"0","job_type":"1,11,4","subway_cd":"0","subway_cd_distance":"null","read_cnt":"70312","reg_dt":"1615534806","edit_dt":"1616458870","opening_dt":"1615766400","closing_dt":"1617202799","closing_date":"20210331","loc_cd":"117000","loc_bcd":"117000","loc_mcd":"117000","ind_key":"80301","cat_key":"10101|10108|11301|11317|11320|11417|20208|20601|20604|20619|20621|20902|20910|30302|30303|30304|30310|41701|41702|41703|90613","keyword":"\uc720\ud1b5\uc5c5,\uacbd\uc601\uae30\ud68d,\uacbd\uc601\uc9c0\uc6d0,\uace0\ubd84\uc790,\uae08\uc735\uc0ac\ubb34,\uae08\uc735\uc0c1\ub2f4,\uae08\uc735\uc601\uc5c5,\uae30\ud68d,\uba38\uc2e0\ub7ec\ub2dd,\ube45\ub370\uc774\ud130,\uc11d\uc720\ud654\ud559,\uc2dc\uc124\uad00\ub9ac,\uc601\uc5c5\uad00\ub9ac,\uc601\uc5c5\uae30\ud68d,\uc778\uacf5\uc9c0\ub2a5(AI),\uc778\uc0ac,\uc778\uc0ac\uae30\ud68d,\uc778\uc0ac\ud3c9\uac00,\uc77c\ubc18\uc601\uc5c5,\ud22c\uc790\uc0c1\ub2f4,\ud654\uacf5,\ud654\ud559","ind_cd":"803","ind_bcd":"8","cat_cd":"101,113,114,202,206,209,303,417,906","cat_bcd":"1,2,3,4,9","welfare_cd":"","preferential_cd":"","info_open_fl":"y","item_id":"","category":"","item_grade":"0","apply_cnt":"0","homepage":"www.lotte.co.kr","grab_source_cd":"","description":"","exam_nm":"","pre_nm":"","valuestatement":"n","com_photo":"n","personnel_manager_fl":"s,n","group_nm":"\ub86f\ub370","workpost":"","major_cd":"","license_cd":"","job_grade":"etc010","license_cd_type":"","cert_class":"","lang_exam":"","workday":"","apply_gb":"homepage","csn_num":"295-00-25803","upjik_bcode_nm":"IT\u00b7\uc778\ud130\ub137,\uac74\uc124,\uacbd\uc601\u00b7\uc0ac\ubb34,\uc0dd\uc0b0\u00b7\uc81c\uc870,\uc601\uc5c5\u00b7\uace0\uac1d\uc0c1\ub2f4,\ud310\ub9e4\u00b7\uc720\ud1b5","upjik_code_nm":"\uae08\uc735\u00b7\ubcf4\ud5d8\uc601\uc5c5,\uae30\ud68d\u00b7\uc804\ub7b5\u00b7\uacbd\uc601,\uc548\uc804\u00b7\ud488\uc9c8\u00b7\uac80\uc0ac\u00b7\uad00\ub9ac,\uc601\uc5c5\uae30\ud68d\u00b7\uad00\ub9ac\u00b7\uc9c0\uc6d0,\uc720\ud1b5\u00b7\ubb34\uc5ed\u00b7\uc0c1\uc0ac,\uc778\uacf5\uc9c0\ub2a5(AI)\u00b7\ube45\ub370\uc774\ud130,\uc778\uc0ac\u00b7\uad50\uc721\u00b7\ub178\ubb34,\uc77c\ubc18\uc601\uc5c5,\ud654\ud559\u00b7\uc5d0\ub108\uc9c0,\ud68c\uacc4\u00b7\uc7ac\ubb34\u00b7\uc138\ubb34\u00b7IR","rec_division":"","recruit_contents":"\ub86f\ub370\uadf8\ub8f9 \ub86f\ub370 \uc2e0\uc785\uc0ac\uc6d0 3\uc6d4 \uc0c1\uc2dc\ucc44\uc6a9 \uc720\ud1b5\u00b7\ubb34\uc5ed\u00b7\uc0c1\uc0ac > \uc720\ud1b5\uc5c5 \ubb3c\ub958\u00b7\uc720\ud1b5\u00b7\uc6b4\uc1a1 > \ubb3c\ub958, \uc720\ud1b5, \uc0c1\ud488\uc785\ucd9c\uace0","kindness_expired_dt":"","company_file_fl":"n","logo_use_fl":"y","hidden_star_main_contents":"","hidden_star_rec_fl":"n","cooperator_category":"","pc_sort_dt":"1616458870","mobile_sort_dt":"1616943957","pc_keyword_product_nm":"","pc_keyword_booster_nm":"","mobile_keyword_product_nm":"","mobile_keyword_booster_nm":"","rec_manage_cd":"C,ITM,ADS,S,ZR","last_update_dt":"1616736571","job_category_origin_cd":"101,113,114,202,206,209,303,417,906","jkeyword_origin_cd":"10101,10108,11301,11317,11320,11417,20208,20601,20604,20619,20621,20902,20910,30302,30303,30304,30310,41701,41702,41703,90613","employee_apply_status":"n","paid_fl":"y","scale":"\ub300\uae30\uc5c5,1000\ub300\uae30\uc5c5","hr_fl":"n","top_fl_order":"1","major":"","rt_paid_fl":"y","company_tag":"","bbsrecruit_tag":"","logo_src":"29552_logo.png","com_data_status":"y","main_area_kcode":"277","rec_type_cd":"rtc001","recruitment_data_dp":"[]","company_auth_key":"240,381,311,554,184,236,638,639,1050,637","ai_head_hunting":"n","mcom_logo_src":"29552_logo.png","loc_mcd_nm":"\uc804\uad6d","loc_bcd_nm":"\uc804\uad6d","jumpit_rec_idx":"","jumpit_flag":"n","ROWID":83309,"score":1,"recruit_category_type":"recently"},{"job_type":"11,4","company_type":"venture,family-friendly,ex_audit","exp_min":"0","cat_bcd":"2,4,10","csn_num":"102-81-42945","description":"","company_file_fl":"n","title":"2021\ub144 1\ucc28 KT \ucc44\uc6a9\uc804\ud658\ud615 \uc778\ud134 \ucc44\uc6a9","mcom_idx":"2815747","logo_src":"29565_logo.jpg","personnel_manager_fl":"s,n","read_cnt":"42713","group_nm":"\ucf00\uc774\ud2f0","sales_rank":"0","reg_dt":"1615768234","apply_cnt":"0","cat_cd":"1001,203,209,402,403,404,413","loc_cd":"101000,104000,106000,109000,110000,111000,112000,113000,114000,115000","valuestatement":"n","apply_gb":"homepage","edu_cd":"8","subway_cd":"0","cert_class":"venture,family-friendly","info_open_fl":"y","opening_dt":"1615770000","com_idx":"29565","grab_source_cd":"","sal_cd":"0","kindness_expired_dt":"","closing_dt":"1617001200","loc_mcd":"101000,104000,106000,109000,110000,111000,112000,113000,114000,115000","item_id":"bold_m2,icon_attention_m2,rank_up6_m2","cat_key":"20302|20330|20901|20902|20908|20909|40201|40203|40207|40210|40226|40232|40233|40308|40309|40315|40319|40321|40324|40402|40404|40427|40430|41301|41303|100102|100115","rec_manage_cd":"C,ITM,ADS,S,ZR","exp_cd":"0","com_photo":"n","stock_gb":"kospi","loc_bcd":"101000,104000,106000,109000,110000,111000,112000,113000,114000,115000","exp_max":"0","rec_idx":"39797950","bbs_gb":"1","company_nm":"(\uc8fc)\ucf00\uc774\ud2f0","category":"eutteum_fix,grand_m,headline_prime,logo_premium_fix,platinum_fix_expand,platinum_m,premium_fix_m","pc_sort_dt":"1616458893","homepage":"www.kt.co.kr","recruit_category_type":"avatar"},{"job_type":"1","company_type":"family-friendly","exp_min":"0","cat_bcd":"4","csn_num":"104-81-36565","description":"","company_file_fl":"n","title":"2021\ub144 \uc0c1\ubc18\uae30 \uc2e0\uc785\uc0ac\uc6d0 \ubaa8\uc9d1","mcom_idx":"6950109","logo_src":"37697_logo_1.gif","personnel_manager_fl":"n","read_cnt":"22615","group_nm":"\uc528\uc81c\uc774","sales_rank":"0","reg_dt":"1615767527","apply_cnt":"0","cat_cd":"402,407,408,409,417","loc_cd":"101000,101210,108000,108080","valuestatement":"n","apply_gb":"homepage","edu_cd":"8","subway_cd":"10453","cert_class":"family-friendly","info_open_fl":"y","opening_dt":"1615784400","com_idx":"37697","grab_source_cd":"","sal_cd":"0","kindness_expired_dt":"","closing_dt":"1617354000","loc_mcd":"101000,108000","item_id":"ai_recommend5,ai_recommend_m5,bold_m2,icon_attention_m2,rank_up6_m2","cat_key":"40201|40203|40207|40226|40234|40701|40702|40706|40707|40708|40802|40805|40806|40808|40812|40904|40913|40915|40916|41701|41702|41703|41704|41706","rec_manage_cd":"C,ITM,ADS,S,ZR","exp_cd":"1","com_photo":"n","stock_gb":"","loc_bcd":"101000,101210,108000,108080","exp_max":"0","rec_idx":"39797629","bbs_gb":"1","company_nm":"\uc528\uc81c\uc774\uc62c\ub9ac\ube0c\ub124\ud2b8\uc6cd\uc2a4(\uc8fc)","category":"eutteum_fix,grand_m,headline_prime,logo_premium_fix,platinum_fix_expand,platinum_m,premium_fix_m","pc_sort_dt":"1616598331","homepage":"www.cjolivenetworks.co.kr","recruit_category_type":"avatar"},{"job_type":"1","company_type":"ex_audit","exp_min":"0","cat_bcd":"1,2,4,5","csn_num":"120-81-13002","description":"\uc77c\ubc18\uacc4\uc5f4, \ud574\uc678\uc804\ubb38|*|\uc9c0\ubc29\uc778\uc7ac, \ucde8\uc5c5\uc9c0\uc6d0\ub300\uc0c1\uc790, \uc804\ubb38\uacc4\uc5f4","company_file_fl":"n","title":"2021\ub144 \uc0c1\ubc18\uae30 SGI\uc11c\uc6b8\ubcf4\uc99d \uc2e0\uc785\uc0ac\uc6d0 \ucc44\uc6a9","mcom_idx":"2482117","logo_src":"179_logo.gif","personnel_manager_fl":"n","read_cnt":"27467","group_nm":"\uc11c\uc6b8\ubcf4\uc99d\ubcf4\ud5d8","sales_rank":"182","reg_dt":"1615866778","apply_cnt":"0","cat_cd":"102,108,114,119,206,402,411,416,501,505","loc_cd":"101230,117000","valuestatement":"n","apply_gb":"homepage","edu_cd":"0","subway_cd":"0","cert_class":"","info_open_fl":"y","opening_dt":"1615820400","com_idx":"179","grab_source_cd":"","sal_cd":"0","kindness_expired_dt":"","closing_dt":"1617008400","loc_mcd":"101000,117000","item_id":"ai_recommend5,ai_recommend_m5,bold_m2,icon_attention_m2,rank_up6_m2","cat_key":"10202|10207|10222|10223|10802|10803|10805|10809|10812|10814|11402|11404|11409|11420|11424|11902|11905|11906|11912|20601|20604|20605|20619|20621|40201|40203|40204|40207|40226|41105|41109|41113|41115|41602|41603|41604|41605|41606|50101|50102|50103|50107|50501|50502|50503|50506","rec_manage_cd":"C,ITM,ADS,S,ZR","exp_cd":"1","com_photo":"n","stock_gb":"","loc_bcd":"101230,117000","exp_max":"0","rec_idx":"39812544","bbs_gb":"0","company_nm":"\uc11c\uc6b8\ubcf4\uc99d\ubcf4\ud5d8(\uc8fc)","category":"eutteum_fix,grand_m,headline_prime,logo_premium_fix,platinum_fix_expand,platinum_m,premium_fix_m","pc_sort_dt":"1616474451","homepage":"www.sgic.co.kr","recruit_category_type":"avatar"},{"job_type":"1","company_type":"goodcompany,family-friendly,ex_audit,public,ex_import","exp_min":"0","cat_bcd":"1,3,4,5,9,11,13","csn_num":"109-81-76596","description":"\ud1a0\ubaa9, \uac74\ucd95, \uae30\uacc4, \uc804\uae30, \ud1b5\uc2e0\uc804\uc790|*|\ud589\uc815(\ubc95\ub960, \uacbd\uc601, \ud68c\uacc4), \uc804\uc0b0\/\uc2dc\uc124(\uc804\uc0b0, \ud1a0\ubaa9, \uac74\ucd95, \uae30\uacc4), \uae30\uc220(\uc804\uae30, \ud1b5\uc2e0\uc804\uc790)|*|\uc18c\ubc29\uc6d0, \uc751\uae09\uad6c\uc870\uc0ac, \ubcf4\uc548\uac80\uc0c9\uac10\ub3c5","company_file_fl":"n","title":"2021\ub144\ub3c4 \uc0c1\ubc18\uae30 \ud55c\uad6d\uacf5\ud56d\uacf5\uc0ac \uc2e0\uc785 \ubc0f \uacbd\ub825\uc9c1\uc6d0 \ucc44\uc6a9","mcom_idx":"2482635","logo_src":"698_airport.gif","personnel_manager_fl":"n","read_cnt":"48388","group_nm":"\uad6d\ud1a0\uad50\ud1b5\ubd80","sales_rank":"577","reg_dt":"1616140700","apply_cnt":"0","cat_cd":"101,102,1103,1109,113,114,1306,302,308,410,510,511,901,903,905","loc_cd":"101000,101040,102000,104000,106000,108000,112000,114000,116000,117000","valuestatement":"n","apply_gb":"homepage","edu_cd":"0","subway_cd":"0","cert_class":"goodcompany,family-friendly","info_open_fl":"y","opening_dt":"1616079600","com_idx":"698","grab_source_cd":"","sal_cd":"0","kindness_expired_dt":"","closing_dt":"1617346800","loc_mcd":"101000,102000,104000,106000,108000,112000,114000,116000,117000","item_id":"rank_up3_m2","cat_key":"10101|10102|10103|10108|10204|10207|10210|10217|11301|11303|11311|11317|11320|11402|11404|11417|11418|11424|30201|30202|30206|30225|30231|30801|30803|30807|30808|30809|30810|30811|30814|30816|30835|30836|30837|30838|41005|41006|41017|41033|41034|51003|51009|51012|51016|51018|51103|51104|51106|51107|51111|90101|90102|90103|90109|90302|90303|90304|90306|90307|90309|90502|90514|90515|90516|90519|110303|110304|110314|110904|110917|130611","rec_manage_cd":"C,ITM,ADS,S,ZR","exp_cd":"3","com_photo":"n","stock_gb":"","loc_bcd":"101000,101040,102000,104000,106000,108000,112000,114000,116000,117000","exp_max":"0","rec_idx":"39842838","bbs_gb":"0","company_nm":"\ud55c\uad6d\uacf5\ud56d\uacf5\uc0ac","category":"eutteum_fix,eutteum_fix_m,focus_fix_m,logo_focus_fix,nuri2,premium_mobile","pc_sort_dt":"1616727955","homepage":"www.airport.co.kr","recruit_category_type":"avatar"},{"job_type":"1,16,2","company_type":"venture,family-friendly","exp_min":"0","cat_bcd":"1,2,4,10","csn_num":"120-87-65763","description":"IT\uac1c\ubc1c|*|\uae30\ud68d,\ub514\uc790\uc778,\ub9c8\ucf00\ud305,MD,CS,\uc6b4\uc601\uc9c0\uc6d0,\uc0ac\uc5c5\uad00\ub9ac,\uc7ac\ubb34,\uc790\uae08,\ubc95\ubb34,\uac10\uc0ac,\uc778\uc0ac,\uad50\uc721,\ucd1d\ubb34","company_file_fl":"n","title":"\ubd80\ubb38\ubcc4 \uacbd\ub825\/\uc2e0\uc785 \uc778\uc7ac\uc601\uc785","mcom_idx":"6614074","logo_src":"36420_logo_1.gif","personnel_manager_fl":"y,81","read_cnt":"1251713","group_nm":"\uc6b0\uc544\ud55c\ud615\uc81c\ub4e4","sales_rank":"0","reg_dt":"1596589485","apply_cnt":"0","cat_cd":"1005,101,102,113,114,119,212,402,404,412","loc_cd":"101000,101010,101060,101180,102220,103000,108000","valuestatement":"n","apply_gb":"homepage","edu_cd":"0","subway_cd":"0","cert_class":"venture,family-friendly","info_open_fl":"y","opening_dt":"1596758400","com_idx":"36420","grab_source_cd":"","sal_cd":"0","kindness_expired_dt":"","closing_dt":"1988118000","loc_mcd":"101000,102000,103000,108000","item_id":"ai_recommend5,ai_recommend_m5,bold_m2,icon_attention_m2,rank_up6_m2","cat_key":"10101|10102|10103|10104|10113|10202|10203|10207|10210|10222|11301|11303|11313|11317|11319|11402|11417|11418|11419|11421|11902|11905|11906|11910|11921|21201|21202|21203|21204|21212|21213|40201|40203|40204|40226|40232|40404|40420|40424|40427|40430|41203|41204|41209|41213|41214|100501|100502|100507|100509","rec_manage_cd":"C,ITM,ADS,S,ZR","exp_cd":"3","com_photo":"n","stock_gb":"","loc_bcd":"101000,101010,101060,101180,102220,103000,108000","exp_max":"0","rec_idx":"38563977","bbs_gb":"0","company_nm":"(\uc8fc)\uc6b0\uc544\ud55c\ud615\uc81c\ub4e4","category":"bigred_m,eutteum_fix,grand_m,headline_prime,logo_premium_fix,platinum_fix_expand,platinum_m,premium_fix_m","pc_sort_dt":"1616374964","homepage":"www.woowahan.com","recruit_category_type":"avatar"}],"company_notify_card":[],"company_request_notify_card_exist_cnt":2,"request_notify_card_gtm_promotion_view":["b2","default1","default2"],"empty_company_request_notify_card":["<li><div class='spacer'><p class='title'>\ub0b4\uc5ed\uc774 \uc5c6\ub124\uc694.<br>\ubbf8\ub9ac \uba74\uc811\ud6c4\uae30 \ud655\uc778\ud574\uc694.<br><a href='\/zf_user\/interview-review' target='_blank' class='my_notification_card_link' data-gtm_creative='card_pool' data-gtm_position='default1'>\uba74\uc811\uacbd\ud5d8\uacf5\uc720 \ubcf4\ub7ec\uac00\uae30<\/a><\/p><\/div><\/li>","<li><div class='spacer'><p class='title'>#\uba74\uc811 \uad00\ub828<br>\uad81\uae08\ud55c \uc810\uc774 \uc788\ub2e4\uba74? <br><a href='\/zf_user\/company-review-qst-and-ans\/sub?keyword=%EB%A9%B4%EC%A0%91&searchType=hashtag' target='_blank' class='my_notification_card_link' data-gtm_creative='card_pool' data-gtm_position='default2'>\ucde8\uc900\uc9c4\ub2f4 \ud655\uc778\ud558\uae30<\/a><\/p><\/div><\/li>","<li><div class='spacer'><p class='title'>\ub0b4 \ud65c\ub3d9\uae30\ubc18<br>\ucd94\ucc9c \uacf5\uace0 \ubcfc\uae4c\uc694?<br><a href='\/zf_user\/persons\/scrap-recruit' target='_parent' class='my_notification_card_link' data-gtm_creative='card_pool' data-gtm_position='default3'>\uc9c0\uc6d0\ud560\ub9cc\ud55c \uacf5\uace0 \ubcf4\uae30<\/a><\/p><\/div><\/li>","<li><div class='spacer'><p class='title'>\uc9c0\uae08 \ud56b\ud55c \uc778\uae30\uacf5\uace0<br>\ub098\ub9cc \uc548\ubcfc\uc218 \uc5c6\uc8e0<br><a href='\/zf_user\/jobs\/hot100' target='_blank' class='my_notification_card_link' data-gtm_creative='card_pool' data-gtm_position='default4'>HOT100 \ud655\uc778\ud558\uae30<\/a><\/p><\/div><\/li>"],"my_notify_card_gtm_promotion_view":["d15","d17","d19","d20","d22","d23"],"apply_notify_card_gtm_promotion_view":["default1","default2","default3","default4"],"empty_apply_notify_card":["<li><div class='spacer'><p class='title'>\ub0b4\uc5ed\uc774 \uc5c6\ub124\uc694.<br>\uc9c0\uc6d0\ud560\ub9cc\ud55c \uacf5\uace0\ub97c \ubcfc\uae4c\uc694?<br><a href='\/zf_user\/persons\/scrap-recruit' target='_parent' class='my_notification_card_link' data-gtm_creative='card_apply' data-gtm_position='default1'>\uc9c0\uc6d0\ud560\ub9cc\ud55c \uacf5\uace0 \ubcf4\uae30<\/a><\/p><\/div><\/li>","<li><div class='spacer'><p class='title'>\uc6d0\ud558\ub294 \uacf5\uace0<br>\ubcf4\uace0\uc2f6\ub2e4\uba74<br><a href='\/zf_user' target='_blank' class='my_notification_card_link' data-gtm_creative='card_apply' data-gtm_position='default2'>\uacf5\uace0 \uac80\uc0c9\ud558\uae30<\/a><\/p><\/div><\/li>","<li><div class='spacer'><p class='title'>\uc228\uace0\ub974\uae30 \ud6c4 \ub2ec\ub824\ub3c4<br>\uad1c\ucc2e\uc544\uc694.<\/p><\/div><\/li>","<li><div class='spacer'><p class='title'>\ub298 \uc5ec\uae30\uc11c<br>\uc751\uc6d0\ud558\uace0 \uc788\uc744\uac8c\uc694.<\/p><\/div><\/li>"],"recruit_notify_card_gtm_promotion_view":["recently","recently","avatar","avatar","avatar","avatar","avatar"],"empty_recruit_notify_card":["<li><div class='spacer'><p class='title'>\ub0b4\uc5ed\uc774 \uc5c6\ub124\uc694.<br>\uc9c0\uae08 \ud56b\ud55c \uacf5\uace0\ubd80\ud130 \ubcf4\ub7ec\uac00\uc694.<br><a href='\/zf_user\/jobs\/hot100' target='_blank' class='my_notification_card_link' data-gtm_creative='card_recruit' data-gtm_position='default1'>HOT100 \ud655\uc778\ud558\uae30<\/a><\/p><\/div><\/li>","<li><div class='spacer'><p class='title'>\uc6d0\ud558\ub294 \uacf5\uace0<br>\uac80\uc0c9\ud574\ubcfc\uae4c\uc694? <br><a href='\/zf_user' target='_blank' class='my_notification_card_link' data-gtm_creative='card_recruit' data-gtm_position='default1'>\uacf5\uace0 \uac80\uc0c9\ud558\uae30<\/a><\/p><\/div><\/li>","<li><div class='spacer'><p class='title'>\uc774\ub825\uc11c \uacf5\uac1c\ud558\uace0<br>\uae30\uc5c5\uc73c\ub85c\ubd80\ud130 \uc81c\uc548 \uc5f0\ub77d\uc744<br>\ubc1b\uc744\uc218\ub3c4 \uc788\uc5b4\uc694.<br><a href='\/zf_user\/member\/resume-manage\/block-setting' target='_parent' class='my_notification_card_link' data-gtm_creative='card_recruit' data-gtm_position='default1'>\uc124\uc815\ud558\ub7ec \uac00\uae30<\/a><\/p><\/div><\/li>","<li><div class='spacer'><p class='title'>\uad00\uc2ec\uae30\uc5c5\ubd80\ud130<br>\ubcf4\ub7ec\uac08\uae4c\uc694?<br><a href='\/zf_user\/member\/favor-company\/list' target='_parent' class='my_notification_card_link' data-gtm_creative='card_recruit' data-gtm_position='default1'>\uad00\uc2ec\uae30\uc5c5 & \ucd94\ucc9c\uae30\uc5c5 \ubcf4\ub7ec\uac00\uae30<\/a><\/p><\/div><\/li>"],"company_notify_card_gtm_promotion_view":["default1","default2","default3","default4"],"empty_company_notify_card":["<li><div class='spacer'><p class='title'>\ub0b4\uc5ed\uc774 \uc5c6\ub124\uc694.<br>\uc6d0\ud558\ub294 \uc870\uac74\uc5d0 \ub9de\ub294 \uae30\uc5c5<br>\uac80\uc0c9\ud574\ubcfc\uae4c\uc694?<br><a href='\/zf_user\/companylab' target='_blank' class='my_notification_card_link' data-gtm_creative='card_knowcom' data-gtm_position='default1'>\uae30\uc5c5\uac80\uc0c9 \ubc14\ub85c\uac00\uae30<\/a><\/p><\/div><\/li>","<li><div class='spacer'><p class='title'>\uc11c\ube44\uc2a4\uc5c5<br>\uc5f0\ubd09 1\uc704 \uae30\uc5c5 \ubcf4\ub7ec\uac00\uc694.<br><a href='\/zf_user\/salaries\/industry\/service-list' target='_blank' class='my_notification_card_link' data-gtm_creative='card_knowcom' data-gtm_position='default2'>\uc5f0\ubd09\uc815\ubcf4 \ubcf4\ub7ec\uac00\uae30<\/a><\/p><\/div><\/li>","<li><div class='spacer'><p class='title'>\uad6c\uc9c1\uc790\ub4e4\uc758 \uace0\ubbfc\uacfc<br>\uc7ac\uc9c1\uc790\ub4e4\uc758 \ub2f5\ubcc0\uc740?<br><a href='\/zf_user\/company-review-qst-and-ans' target='_blank' class='my_notification_card_link' data-gtm_creative='card_knowcom' data-gtm_position='default3'>\ucde8\uc900\uc9c4\ub2f4 \ud655\uc778\ud558\uae30<\/a><\/p><\/div><\/li>","<li><div class='spacer'><p class='title'>\uc774 \uae30\uc5c5 \uc7a5\uc810\ub9cc \ubaa8\uc544!<br>\ud050\ub808\uc774\uc158 \ubcf4\ub7ec\uac00\uc694.<br><a href='\/zf_user\/companylab' target='_blank' class='my_notification_card_link' data-gtm_creative='card_knowcom' data-gtm_position='default4'>\uae30\uc5c5\uc2a4\ud1a0\ub9ac \ubcf4\ub7ec\uac00\uae30<\/a><\/p><\/div><\/li>"]}</script>
						</div>

					</div> <!-- section -->
				
				
				
				<div class="section" id='calendar'>
				</div>
				
				
	
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
