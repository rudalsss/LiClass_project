<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<script type="text/javascript">
		$(function(){
			/*이전상세화면으로*/
			$("#listBtn").click(function(){
				location.href="/admin/class/classDetail?c_no="+${ param.c_no };
			});
			
			//취소버튼
			$("#cancel").click(function(){
				$("#frm").each(function(){
					this.reset();
				});
			});
			
			/*등록버튼*/
			$("#insert").click(function(){
				let ep_date = $("#ep_date1").val()+" "+$("#ep_date2").val();
				$("#ep_date").val(ep_date);
				console.log($("#ep_date").val());
				
				//유효성검사
				if( !chkSel("#ep_date1", "날짜를") ) return;
				else if( !chkSel("#ep_date2", "시간을") )return;
				else if( !chkData("#ep_price","수강료를") )return;
				else {
					$.ajax({
						url : "/admin/episode/dateChk",
						type : "post",
						data : $("#frm").serialize(),
						dataType : "text",
						error: function(){
							alert("통신문제 발생 추후에 다시 시도해주세요..");
						},
						success : function(data){
							if(data=="중복발생"){
								alert("날짜및시간이 이전에 존재하는 회차와 중복됩니다! 다시설정해주세요!");
								$("#ep_date2").focus();
							} else if(data=="중복없음") {
								$("#frm").attr({
									"method":"post",
									"action":"/admin/episode/insertEpisode"
								});
								$("#frm").submit();
							}
						}
					}); //ajax의 종료
					
				}
			});
			
		});
		</script>
	</head>
	<body>
		
	    <div class="pagetitle">
	      <h1>신규회차 등록</h1>
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
        <div class="col-lg-12">
        	
        	<div class="card">
            <div class="card-body">
              <h5 class="card-title">New Class Episode of ${ episodeVO.c_no }</h5>
              <div class="text-right">
              	<button type="button" class="btn btn-secondary rounded-pill" id="listBtn">이전으로</button>
              </div><br>
              <!-- General Form Elements -->
              <form id="frm" >
              	<input type="hidden" name="ep_date" id="ep_date"/> <!-- 찐 날짜값 -->
              	<input type="hidden" name="c_no" value="${ episodeVO.c_no }"/>
              	<input type="hidden" name="c_title" value="${ episodeVO.c_title }"/>
              	
                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">날짜</label>
                  <div class="col-sm-10">
                    <input type="date" name="ep_date1" id="ep_date1" class="form-control">
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">시간</label>
                  <div class="col-sm-10">
                    <input type="time" name="ep_date2" id="ep_date2" class="form-control">
                  </div>
                </div>
                 <div class="row mb-5">
                  	<label for="inputText" class="col-sm-2 col-form-label">회차 수강료</label>
                  	 <div class="col-sm-10">
                  		<input id="ep_price" name="ep_price" type="number" class="form-control" placeholder="금액만 입력">
                  	</div>
                  </div>
                
                <div class="text-right">
                <button type="button" class="btn btn-secondary rounded-pill" id="cancel">취소</button>
				<button type="button" class="btn btn-secondary rounded-pill" id="insert">등록하기</button>
				</div>
			</form>
            </div><!-- card body -->
          </div><!-- card-->
          </div>
      </div>
    </section>
	</body>
</html>