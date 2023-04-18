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
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	<style type="text/css">
		.badge{ cursor: pointer; }
		.ri-add-circle-fill{ cursor: pointer; }
	</style>
	<script type="text/javascript">
		$(function(){
			//목록으로 
			$("#listBtn").click(function(){
				location.href="/admin/class/classList";
			});
			//클래스 화면으로 
			$("#classBtn").click(function(){
				location.href="/admin/class/classDetail?c_no="+${param.c_no};
			});
			
			/********* <<<사진삭제>>> *********/
			$(".delBtn").click(function(){ /* [ form : updFrm ] c_img_no, c_img_file, thumb_file, c_no */
				if(confirm("해당 사진을 삭제하시겠습니까?")){
					let forms = $(this).parents("form#updFrm");
					console.log(forms);
					console.log(forms.serialize());
					$.ajax({
						url : "/admin/image/imageDelete",
						type : "post",
						dataType: "text",
						data : forms.serialize(),
						error : function(xhr, textStatus, errorThrown){		
							alert( textStatus + "(HTTP-"+ xhr.status + " / " + errorThrown + ")" );
						},
						success : function(data){
							if(data=="사진삭제"){
								alert("삭제가 완료되었습니다.");
								location.href="/admin/image/imageUpdate?c_no="+${param.c_no};
							}
						}
					}); //ajax의 종료
				}
			});
		
			/********* <<<사진추가>>> *********/
			//첨부파일 가짜 경로 잘라서 이름 출력
			$("#addfile").change(function(){
				$("#addImgVal").html("");
				console.log("초기첨부값 :"+$("#addfile").val());							
				let img = $("#addfile").val().substring(12,);		
				//console.log( $("#addImg").val() );
				//console.log(img);
				$("#addImgVal").append(img).append("&nbsp;<span id='ex'><i class='bi bi-x-square-fill'></i></span>");
			});
			// x누르면 이름, 파일 모두 초기화
			$(document).on("click", "#ex", function(){
					$("#addImgVal").html("");
					$("#addImg").val("");
					console.log( "file에 담긴값 :"+$("#addImg").val());
			});
			
			let imgCnt = 0;
			//클래스의 사진이 5개가 넘는다면 추가작업 불가
			$.ajax({
				url : "/admin/image/imageCnt?c_no="+${param.c_no},
				type : "get",
				dataType : "text",
				error : function(xhr, textStatus, errorThrown){		
					alert( textStatus + "(HTTP-"+ xhr.status + " / " + errorThrown + ")" );
				},
				success : function(data){
					imgCnt = data;
					console.log("현재 이미지 : "+imgCnt);
				}
			});
			
			// 추가버튼클릭
			$(".addBtn").click(function(){ /* [ form : addFrm ] c_no, file(mulipartfile) 2개의 값만 넘어간다.. */
				if( imgCnt == 5 ){
					alert("클래스 이미지는 최대 5개까지 등록이 가능합니다.\n 삭제 혹은 수정을 이용해주세요.");
					return;
				} else {
					if( $("#addfile" ).val()=="" ){	
						alert("등록할 이미지 파일을 먼저 선택해주세요.");
						return;
					} else {
						var formData = new FormData( $("#addFrm")[0] ); 
						$.ajax({
							url : "/admin/image/imageAdd",
							type : "post",
							dataType: "text",
							data : formData,
							cache: false,
							contentType : false,
							processData : false,
							error : function(xhr, textStatus, errorThrown){		
								alert( textStatus + "(HTTP-"+ xhr.status + " / " + errorThrown + ")" );
							},
							success : function(data){
								if(data=="사진등록"){
									alert("사진이 등록되었습니다.");
									location.href="/admin/image/imageUpdate?c_no="+${param.c_no};
								}
							} 
						}); //ajax의 종료
					}
				} 
			});
							/*-------------------------------------------- [ ajax로 file 폼 전송하기 ] ---------------------------------------
							  폼내용의 직렬화 (serialize)는 input, textarea, select와 같은 개별 요소에서만 처리가능함
							  폼의 input type=file을 전송가능하게 하려면 formData객체를 이용해야함
							  FormData 객체란 단순한 객체가 아니며 XMLHttpRequest 전송을 위하여 설계된 특수한 객체 형태/ json구조(key + value)
							  
							  또한 이를 전송할때 ajax의 속성 cache , contentType , processData 를 모두 false 로 세팅해야  함
							  이는 VO 객체에 private MultipartFile fileAttach; 를 추가하여 Form 데이터 한 번 전송으로 파일과 Form 데이터를 함께 수신하는 방법임
							
							  사실 가장 간편한 방법은 form submit이지만 화면이동없이 처리하기 위해서는 이렇게 해야한다...
							  ---------------------------------------------------------------------------------------------------------------------------------------*/
							  
			/*********  <<<수정하기(변경하기) >>> *********/
			$(".updBtn").click(function(){  /* [ form : updFrm ] c_img_no, c_img_file, thumb_file, c_no, file(Multipartfile) */
				let file = $('input[name="file"]').val();
				console.log(file);
				if( file=="" ){	
					alert("대체할 이미지 파일을 먼저 선택해주세요");
					return;
				} else {
					let forms = $(this).parents("form#updFrm");
					var formData = new FormData( forms[0] );
					$.ajax({
						url : "/admin/image/imageChange",
						type : "post",
						dataType: "text",
						data : formData,
						cache: false,
						contentType : false,
						processData : false,
						error : function(xhr, textStatus, errorThrown){		
							alert( textStatus + "(HTTP-"+ xhr.status + " / " + errorThrown + ")" );
						},
						success : function(data){
							if(data=="사진변경"){
								alert("사진이 변경되었습니다.");
								location.href="/admin/image/imageUpdate?c_no="+${param.c_no};
							}
						} 
					}); //ajax 종료
				}
			});
			
			
			
		}); //최상위$
	</script>
	</head>
	<body>
	    <div class="pagetitle">
	      <h1>클래스 이미지 수정 </h1>
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
        
        <div class="text-right">
	        <button type="button" id="listBtn" class="btn btn-dark rounded-pill"><i class="bi bi-house-door"></i>&nbsp;홈으로</button>
	        <button type="button" id="classBtn" class="btn btn-dark rounded-pill"><i class="bi bi-journal-text"></i>&nbsp;이전화면</button>
	    </div>
        
        <c:forEach var="img" items="${imgList}" varStatus="status">
        	<div class="col-lg-3" style="margin-top:10px;">
		          <div class="card"><!-- Card with an image on top -->
		          <img src="/uploadLiClass/class/${ img.c_img_file}" class="card-img-top">
		            <div class="card-body">
		              <h6 class="card-title" style="font-size: 15px">[ class ${param.c_no} ] 이미지<c:out value="${status.count}" /></h6>
		              <!-- <p class="card-text">파일명 : ${ img.c_img_file}</p> -->
		              
		              	<form id="updFrm">
		              			<input type="hidden" name="c_img_file" value="${ img.c_img_file}" />
		              			<input type="hidden" name="thumb_file" value="${ img.thumb_file}" />
		              			<input type="hidden" name="c_no" value="${param.c_no}" />
		              			<input type="hidden" name="c_img_no" value="${img.c_img_no}"/>
		              			<!--개별수정 버튼 -->
							    <div class="row mb-3 text-right" style="display:block">
				                    <input class="form-control updImg" type="file" name="file" style="height:23px;width:180px;display:inline;font-size: 10px">
				                   <br><br>
				                    <span class="badge bg-secondary updBtn" style="font-size:12px;display:inline"><i class="bi bi-pencil-square"></i>&nbsp; update</span>
				                    <span class="badge bg-secondary delBtn" style="font-size:13px;display:inline"><i class="bi bi-trash-fill"></i>&nbsp; delete</span>
				                </div>
				               <!--개별삭제 버튼 -->
		              	</form>
		             
		            </div>
		          </div><!-- End Card with an image on top -->
			</div>
        </c:forEach>
        
        <div class="col-lg-3 text-center">
        	<form id="addFrm" enctype="multipart/form-data">
        		<input type="hidden" name="c_no" value="${param.c_no}"/>
        		<!-- 추가버튼 -->
	          	<label for="addfile"><i class="ri-add-circle-fill" style="font-size:120px; color:#c0c0c0"></i></label>
	          	<!-- 등록파일출력 -->
	          	<p style="font-size: 13px; color:#708090; font-weight:bold">
	          		업로드할 파일 : <span  id="addImgVal"></span>
	          	</p>
	          	<!-- 등록버튼 -->
	          	<h1><span class="badge bg-dark text-light addBtn"><i class="bi bi-hand-index-thumb"></i>&nbsp;add image</span></h1>
	          	
	          	<input type="file" class="form-control" id="addfile" name="file" style="display:none" accept=".gif, .jpg, .png, .jpeg">
	         </form>
        </div>
        
        		</div><!-- col설정 div -->
		      </div><!-- row설정 div -->
		    </section>
	</body>
</html>