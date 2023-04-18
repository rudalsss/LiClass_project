<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<link rel="shortcut icon" href="/resources/images/common/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/common/icon.png" />
		<script src="/resources/include/js/html5shiv.js"></script>
		<script src="/resources/include/js/jquery-3.6.2.min.js"></script>
		<script src="/resources/include/js/common.js"></script>
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css">
		
		<!-- Google Fonts -->
		<link href="https://fonts.gstatic.com" rel="preconnect">
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
		<!-- Vendor CSS Files :::::: assets를 /resources/admin로 변경--> 
		<link href="/resources/admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="/resources/admin/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
		<link href="/resources/admin/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
		<link href="/resources/admin/vendor/quill/quill.snow.css" rel="stylesheet">
		<link href="/resources/admin//vendor/quill/quill.bubble.css" rel="stylesheet">
		<link href="/resources/admin/vendor/remixicon/remixicon.css" rel="stylesheet">
		<link href="/resources/admin/vendor/simple-datatables/style.css" rel="stylesheet">
		<!-- Template Main CSS File -->
		<link href="/resources/admin/css/style.css" rel="stylesheet">
		<!-- =======================================================
		* Template Name: NiceAdmin - v2.5.0
		* Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
		* Author: BootstrapMade.com
		* License: https://bootstrapmade.com/license/
		======================================================== -->
	</head>
	<style type="text/css">
		th, td{
			text-align: center;
		}
		
	</style>
	<script type="text/javascript">
		$(function(){
			//목록버튼
			$("#listBtn").click(function(){
				location.href="/admin/class/classList";
			});
			$( "#listBtn2").click(function(){
				location.href="/admin/class/classList";
			});
			//수정버튼
			$("#updBtn").click(function(){
				location.href="/admin/class/updateForm?c_no="+${liclass.C_NO};
			});
			//삭제버튼
			$("#delBtn").click(function(){
				$.ajax({
					url : "/admin/episode/countEpisode?c_no="+${liclass.C_NO},
					type : "get",
					data : "text",
					error : function(xhr, textStatus, errorThrown){		
						alert( textStatus + "(HTTP-"+ xhr.status + " / " + errorThrown + ")" );
					},
					success:function(data){
						if(data=="회차존재"){
							alert("회차가 존재하는 클래스는 삭제할 수 없습니다. \n회차를 모두 삭제하고 진행해주세요.");
							return;
						}else{
							if(confirm("클래스["+${liclass.C_NO}+"] 를 삭제하시겠습니까?")){
								$("#frm").attr({
									"method":"post",
									"enctype":"multipart/form-data",
									"action":"/admin/class/classDelete"
								});
								$("#frm").submit();
							}
						}
					}	
				});
			});
			
			
			//회차 조회처리
			let c_no = ${liclass.C_NO};
			var idx = 0;
			$.ajax({
				url : "/admin/episode/episodeList?c_no="+c_no,
				type : "get",
				data : "json",
				success : function(data){
					//console.log(data);
					let table = $("<table class='table table-striped'>");
					let tr = $("<tr>").html("<th scope='col'>회차</th> <th scope='col'>회차가격</th> <th scope='col'>회차일정</th> <th scope='col'>회차예약상태</th> <th scope='col'>회차진행상태</th> <th scope='col'>예약인원</th> <th scope='col'>삭제</th>");
					table.append($("<thead>").append(tr));
					let tbody = $("<tbody>");
					if( data.length ==0 ){ //불러올 회차정보가 없다..
						console.log("데이터 없습니다람쥐...");
						let nodata = $("<td colspan='7'>").html("<div class='text-center'><p>등록된 회차가 없습니다.</p></div>");
						tbody.append($("<tr>").append(nodata));
					} else {
						$(data).each(function(){
							let ep_no = this.ep_no;
							idx =  idx + 1;
							let ep_price = this.ep_price;
							let ep_date = this.ep_date;
							let ep_state1 = this.ep_state1;
							let ep_state2 = this.ep_state2;
							let ep_cnt = this.ep_cnt;
							
							
							
							let tr = $("<tr>").attr({"data-no": ep_no, "idx":idx} )
										.append($("<td id='idx'>").html(idx+"회차")).append($("<td>").html(ep_price+"원"))
										.append($("<td>").html(ep_date));
							//예약만석일경우
							if(ep_state1=='인원만석'){
								tr.append($("<td style='color:#EB3232'>").html(ep_state1));
							}else{
								tr.append($("<td>").html(ep_state1));
							}			
							//진행종료일경우
							if(ep_state2=='진행종료'){
								tr.append($("<td style='color:#d2d2d2'>").html(ep_state2));
							}else{
								tr.append($("<td style='color:#288CFF'>").html(ep_state2));
							}
									
							tr.append($("<td>").html(ep_cnt))
								.append($("<td>").html("<button class='epdel btn btn-dark rounded-pill'>회차삭제</button>"));
							tbody.append(tr);
					});
					
					}					
					
					table.append(tbody);
					$("#episode").append(table);
				}, 
				error : function(xhr, textStatus, errorThrown){		
					alert( textStatus + "(HTTP-"+ xhr.status + " / " + errorThrown + ")" );
				}
			}); //ajax종료
			
			//회차등록
			$("#new_ep").click(function(){
				$("#epinsertFrm").attr({
					"method":"get",
					"action":"/admin/episode/writeForm"
				});
				$("#epinsertFrm").submit();
			});
			
			
			/*회차 삭제처리*/
			$(document).on("click", ".epdel", function(){
					//폼에 해당 회차번호를 담는다..
					let ep_no = $(this).parents("tr").attr("data-no"); 
					$("#ep_no").val(ep_no);
					
					let idx = $(this).parents("tr").attr("idx"); 
					console.log(idx);
					
					if( confirm( "클래스의 "+idx+"회차 등록정보를 삭제처리하시겠습니까?") ){
						$("#epfrm").attr({
							"method" : "post",
							"action" : "/admin/episode/deleteEpisode"
						});
						$("#epfrm").submit();
					}	
			});
			
			//사진 수정하러 넘어가기
			$("#imgUdt").click(function(){
				location.href="/admin/image/imageUpdate?c_no="+${liclass.C_NO};
			});
			
		}); //최상위$
	
	
		
	</script>
	<body>
		<!-- 사진삭제를 위한 form(frm) -->
		<form id="frm">
			<input type="hidden" name="c_no" value="${liclass.C_NO}"/>
		</form>
		<!-- 회차삭제를 위한 form -->
		<form id="epfrm">
			<input type="hidden" id="ep_no" name="ep_no"/>
			<input type="hidden" name="c_no" value="${liclass.C_NO}"/>
		</form>
		<!-- 에피소드 등록을 위한 form -->
		<form id="epinsertFrm">
			<input type="hidden" name="c_no" value="${liclass.C_NO}"/>
			<input type="hidden" name="c_title" value="${liclass.C_TITLE}"/>
		</form>
		
	    <div class="pagetitle">
	      <h1>클래스 상세조회</h1>
	      <nav>
	        <ol class="breadcrumb">
	          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
	          <li class="breadcrumb-item">Tables</li>
	          <li class="breadcrumb-item active">General</li>
	        </ol>
	      </nav>
	    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12"> <!-- 여기까지 -->
        
        
        <div class="card">
	            <div class="card-body">
	            <h5 class="card-title">[ Class ${ liclass.C_NO } ] ${liclass.C_TITLE }</h5>
	            <div class="text-right">
	            	<button type="button" id="listBtn2" class="btn btn-dark rounded-pill btn"><i class="bi bi-house-door"></i>&nbsp;목록으로</button>
	            </div>
	            <br>
	           <!-- Bordered Table -->
              <table class="table table-bordered">
                <tbody>
				 <tr>
					<td class="col-md-2 text-center table-primary">클래스 번호</td>
					<td class="col-md-2 text-center table-light">${liclass.C_NO}</td>
					<td class="col-md-2  text-center table-primary">카테고리</td>
					<td class="col-md-2 text-center table-light">
						<c:choose>
	                    	<c:when test="${ liclass.C_CATEGORY eq 0}">공예</c:when>
	                    	<c:when test="${ liclass.C_CATEGORY eq 1}">요리</c:when>
	                    	<c:when test="${ liclass.C_CATEGORY eq 2}">미술</c:when>
	                    	<c:when test="${ liclass.C_CATEGORY eq 3}">플라워</c:when>
	                    	<c:when test="${ liclass.C_CATEGORY eq 4}">뷰티</c:when>
	                    	<c:when test="${ liclass.C_CATEGORY eq 5}">체험 및 기타</c:when>
                    	</c:choose>
					</td>
					<td class="col-md-2 text-center table-primary">지역</td>
					<td class="col-md-2 text-center table-light">${liclass.C_AREA}</td>
				</tr>
				<tr>
					<td class="col-md-2 text-center table-primary">수업인원</td>
					<td class="col-md-2 text-center table-light">${liclass.C_MAXCNT}</td>
					<td class="col-md-2 text-center table-primary">난이도</td>
					<td class="col-md-2 text-center table-light">${liclass.C_LEVEL}</td>
					<td class="col-md-2 text-center table-primary">소요시간</td>
					<td class="col-md-2 text-center table-light">${liclass.C_LEADTIME}</td>
				</tr>
				<tr>
					<td class="col-md-2 text-center table-primary">센터</td>
					<td colspan="2" class="col-md-2 text-center table-light">${ liclass.CT_NAME }</td>
					<td class="col-md-2 text-center table-primary">상세주소</td>
					<td colspan="2" class="col-md-2 text-center table-light">${ liclass.CT_ADDR} / ${liclass.CT_DETAIL_ADDR }</td>
				</tr>
				<tr>
					<td colspan="6" class="col-md-2 table-light">${liclass.C_CONTENT}</td>
				</tr>
				<tr>
					<td colspan="6" class="text-right">
						<button type="button" class="btn btn-secondary rounded-pill btn" id="listBtn">목록</button>
	            		<button type="button" class="btn btn-secondary rounded-pill btn" id="delBtn">삭제</button>
	             		<button type="button" class="btn btn-secondary rounded-pill btn" id="updBtn">수정</button>
					</td>
				</tr>
              </table>
              <!-- End Bordered Table -->
	          
	           </div>
          </div> <!-- 클래스 상세 -->
          
          <div class="card">
		       <div class="card-body" id="img">	
		       		<h5 class="card-title">[ Class ${ liclass.C_NO } ] 이미지 조회 </h5>
		       		<h5><i class="bi bi-check-circle me-1"></i>최대 5개의 이미지를 등록할 수 있으며 첫번째 사진이 썸네일로 사용됩니다.</h5>
		       		<div class="text-right"><button id="imgUdt" class="btn btn-dark rounded-pill btn"><i class="bi bi-folder me-1"></i>&nbsp;이미지 수정</button></div><br>
	           	   <table class="table table-borderless">
	           	   		<tr>
	           	   		<td>
	           	   				<c:choose>
						           	   <c:when test="${ not empty imgList  }">
						           	   		 <c:forEach var="img" items="${imgList}" varStatus="status">
						           	   			<img src="/uploadLiClass/class/thumbnail/${img.thumb_file}" style="height: 133px"/>
						           	   		</c:forEach>
						           	   </c:when>
						           	   <c:otherwise>
						           	   		<div class="text-center"><p>등록된 이미지가 없습니다.</p></div>
						           	   </c:otherwise>
	           	   				</c:choose>
	           	   		</td>
	           	   		</tr>
	           	   </table>
           	  </div>
           </div><!-- 이미지 -->
           
           <div class="card">
		       <div class="card-body" id="episode">
		       <h5 class="card-title">[ Class ${ liclass.C_NO } ] 회차정보 조회 </h5>
		       <div class="text-right"><button id="new_ep" class="btn btn-dark rounded-pill"><i class="bi bi-check-circle"></i> 신규회차 등록</button></div><br>
		        </div>
           </div> <!-- 회차상세 -->
		
		</div><!-- col설정 div -->
      </div><!-- row설정 div -->
    </section>
		
	</body>
</html>