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
	<script type="text/javascript">
		$(function(){
			//목록버튼
			$("#listBtn").click(function(){
				location.href="/admin/class/classList";
			});
			//취소버튼
			$("#cancel").click(function(){
				$("#frm").each(function(){
					//console.log($("#frm").serialize());
					this.reset();
				});
			});
			//등록버튼
			$("#insert").click(function(){
				var name = "c_level";
				//console.log( $("input[name="+name+"]:radio:checked").length );
				console.log( $("input[name=fileList]").val()=="" );
				
				if( !chkData("#c_title","클래스명을") ) return;
				else if( !chkSel("#ct_bizno","센터를") ) return;
				else if( !chkData("#c_area","클래스지역을") ) return;
				else if( !chkSel("#c_category","카테고리를") ) return;
				else if( !chkData("#c_leadtime","소요시간을") ) return;
				else if( !chkData("#c_maxcnt","최대인원을") ) return;
				else if( !chkRadio("c_level","클래스 난이도를") ) return;
				else if( !chkData("#c_content","클래스 설명을") ) return;
				else if( !chkSel( "input[name=fileList]", "1개이상의 클래스 이미지를" ) ) return;
				else {
					
					if( !chkNum("#c_maxcnt", "최대인원") ) return;
					else if( !chkNum("#c_leadtime", "소요시간") ) return;
					else {
						$("#frm").attr({
							"method":"post",
							"enctype":"multipart/form-data",
							"action":"/admin/class/classInsert"
						});
						$("#frm").submit();
					}
				} 
			});
			
			$.ajax({
				url : "/management/center/centerlist2",
				type : "get",
				dataType: "json",
				success : function(data){
					$(data).each(function(){
						let ct_bizno = this.ct_bizno;
						let ct_name = this.ct_name;
						let op = $("<option>").attr("value", ct_bizno ).html(ct_name);
						$("#ct_bizno").append(op);
					});
				},
				error : function(xhr, textStatus, errorThrown){		
					alert( textStatus + "(HTTP-"+ xhr.status + " / " + errorThrown + ")" );
				}
				
			});
		
		});
	</script>
	</head>
	<body>
		
	    <div class="pagetitle">
	      <h1>클래스 등록</h1>
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
              <h5 class="card-title">New Class</h5>
              <div class="text-right">
              	<button type="button" class="btn btn-secondary rounded-pill" id="listBtn">목록으로</button>
              </div><br>
              <!-- General Form Elements -->
              <form id="frm" >
                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">클래스명</label>
                  <div class="col-sm-10">
                    <input type="text" id="c_title" name="c_title" class="form-control" >
                  </div>
                </div>
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">클래스 센터</label>
                  <div class="col-sm-10">
                    <select class="form-select" name="ct_bizno" id="ct_bizno" aria-label="Default select example">
                      <option value="">---클래스를 개설할 센터를 선택해주세요---</option>
                    </select>
                  </div>
                </div>
                <div class="row mb-5">
                  <label for="inputText" class="col-sm-2 col-form-label">클래스 지역</label>
                  <div class="col-sm-10">
                    <input type="text" id="c_area" name="c_area" class="form-control" placeholder="ex) 경기 수원시">
                  </div>
                </div>
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">카테고리</label>
                  <div class="col-sm-10">
                    <select class="form-select" name="c_category" id="c_category" aria-label="Default select example">
                      <option value="">---카테고리를 선택해주세요---</option>
                      <option value="0">공예</option>
                      <option value="1">요리</option>
                      <option value="2">미술</option>
                      <option value="3">플라워</option>
                      <option value="4">뷰티</option>
                      <option value="5">체험및 기타</option>
                    </select>
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="c_leadtime" class="col-sm-2 col-form-label">소요시간</label>
                  <div class="col-sm-10">
                    <input type="number" id="c_leadtime" name="c_leadtime" class="form-control" placeholder="0" min="1">
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="c_maxcnt" class="col-sm-2 col-form-label">최대인원</label>
                  <div class="col-sm-10">
                    <input type="number"  id="c_maxcnt"  name="c_maxcnt" class="form-control" placeholder="0" min="0">
                  </div>
                </div>  
                <fieldset class="row mb-3">
                  <legend class="col-form-label col-sm-2 pt-0"><strong>클래스 난이도</strong></legend>
                  <div class="col-sm-10">
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="c_level" id="radio1" value="상">
                      <label class="form-check-label" for="radio1">
                        상
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="c_level" id="radio2" value="중">
                      <label class="form-check-label" for="radio2">
                        중
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="c_level" id="radio3" value="하">
                      <label class="form-check-label" for="radio3">
                        하
                      </label>
                    </div>
                   </div>
                </fieldset>
                <div class="row mb-5">
                  <label for="inputPassword" class="col-sm-2 col-form-label">클래스 설명</label>
                  <div class="col-sm-10">
                    <textarea class="form-control" name="c_content" id="c_content" style="height: 400px" placeholder="클래스를 소개해주세요."></textarea>
                  </div>
                </div>
                
                <div class="row mb-3">
                <div class="row mb-3 text-right">
                	<h5><i class="bi bi-check-circle me-1"></i>최대 5개의 이미지를 등록할 수 있으며 첫번째 사진이 썸네일로 사용됩니다.</h5>
                </div>
                  <label for="inputNumber" class="col-sm-2 col-form-label">사진파일1(썸네일)</label>
                  <div class="col-sm-10">
                    <input class="form-control" type="file" id="formFile1" name="fileList" accept=".gif, .jpg, .png, .jpeg">
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="inputNumber" class="col-sm-2 col-form-label">사진파일2</label>
                  <div class="col-sm-10">
                    <input class="form-control" type="file" id="formFile2" name="fileList" accept=".gif, .jpg, .png, .jpeg">
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="inputNumber" class="col-sm-2 col-form-label">사진파일3</label>
                  <div class="col-sm-10">
                    <input class="form-control" type="file" id="formFile3" name="fileList" accept=".gif, .jpg, .png, .jpeg">
                  </div>
                </div>
                 
                <div class="row mb-3">
                  <label for="inputNumber" class="col-sm-2 col-form-label">사진파일4</label>
                  <div class="col-sm-10">
                    <input class="form-control" type="file" id="formFile4" name="fileList" accept=".gif, .jpg, .png, .jpeg">
                  </div>
                </div>
                
                <div class="row mb-3">
                  <label for="inputNumber" class="col-sm-2 col-form-label">사진파일5</label>
                  <div class="col-sm-10">
                    <input class="form-control" type="file" id="formFile5" name="fileList" accept=".gif, .jpg, .png, .jpeg">
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