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
	<script type="text/javascript">
		$(function(){
			//목록버튼
			$("#listBtn").click(function(){
				location.href="/admin/class/classList";
			});
			//취소버튼
			$("#cancelBtn").click(function(){
				location.href="/admin/class/classDetail?c_no="+${updateData.c_no};
			});
			//수정완료버튼
			$("#updBtn").click(function(){
				 if( !chkData("#c_area","클래스지역을") ) return;
				else if( !chkData("#c_leadtime","소요시간을") ) return;
				else if( !chkData("#c_level","난이도를") ) return;
				else if( !chkData("#c_maxcnt","최대인원을") ) return;
				else if( !chkData("#c_content","클래스 설명을") ) return;
				else {
						$("#frm").attr({
							"method":"post",
							"enctype":"multipart/form-data",
							"action":"/admin/class/classUpdate"
						});
						$("#frm").submit();
				}
			});
			
			$("input[type='file']").on("change", function(){
				let a = $(this).val();
				console.log(a);
				let span = $(this).next();
				console.log(span);
				span.html(a);
			});
					
			
		}); //최상위 $
	
	
		
	</script>
	<body>
		
	    <div class="pagetitle">
	      <h1>클래스 수정</h1>
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
	            <h5 class="card-title">[ Class ${updateData.c_no} ] ${updateData.c_title} 수정하기</h5>
	           <!-- Bordered Table -->
	           <form id="frm">
	           		<input type="hidden" name="c_no" value="${updateData.c_no}" />
	           
              <table class="table table-bordered">
                <tbody>
				 <tr>
					<td class="col-md-2 text-center table-primary">클래스 번호</td>
					<td class="col-md-2 text-center table-light">${updateData.c_no}</td>
					<td class="col-md-2  text-center table-primary">카테고리</td>
					<td class="col-md-2 text-center table-light">
						<select class="form-select" name="c_category" id="c_category" aria-label="Default select example">
                      		<option value="">---카테고리를 선택해주세요---</option>
                     		<option value="0">공예</option>
                      		<option value="1">요리</option>
                      		<option value="2">미술</option>
                      		<option value="3">플라워</option>
                      		<option value="4">뷰티</option>
                      		<option value="5">체험및 기타</option>
                    	</select>
					</td>
					<td class="col-md-2 text-center table-primary">지역</td>
					<td class="col-md-2 text-center table-light">
						<input type="text" id="c_area" name="c_area" value="${updateData.c_area}" class="form-control">
					</td>
				</tr>
				<tr>
					<td class="col-md-2 text-center table-primary">수업인원</td>
					<td class="col-md-2 text-center table-light">
						<input type="number"  id="c_maxcnt"  name="c_maxcnt" value="${updateData.c_maxcnt}" class="form-control" min="0">
					</td>
					<td class="col-md-2 text-center table-primary">난이도(* 상/중/하 만 입력)</td>
					<td class="col-md-2 text-center table-light">
						<input type="text"  id="c_level"  name="c_level" value="${updateData.c_level}" class="form-control">
					</td>
					<td class="col-md-2 text-center table-primary">소요시간</td>
					<td class="col-md-2 text-center table-light">
						<input type="number"  id="c_leadtime"  name="c_leadtime" value="${updateData.c_leadtime}" class="form-control" min="0">
					</td>
				</tr>
				<tr>
					<td class="col-md-2 text-center table-primary">센터고유 번호</td>
					<td colspan="5" class="col-md-2 text-center table-light">${updateData.ct_bizno}</td>
				</tr>
				<tr>
					<td colspan="6">
						<textarea class="form-control" name="c_content" id="c_content" style="height: 400px">${updateData.c_content}</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<table class="table table-borderless">
		           	   		<tr>
		           	   				<c:choose>
							           	   <c:when test="${ not empty imgList  }">
							           	   <td>
							           	   		 <c:forEach var="img" items="${imgList}" varStatus="status">
							           	   			<img src="/uploadLiClass/class/thumbnail/${img.thumb_file}" style="height: 133px"/>
							           	   		</c:forEach>
							           	   	</td>
							           	   </c:when>
							           	   <c:otherwise>
							           	   <td>
							           	   		<div class="text-center"><p>등록된 이미지가 없습니다.</p></div>
							           	   	</td>
							           	   </c:otherwise>
		           	   				</c:choose>
		           	   		</tr>
		           	   </table>
					</td>
				</tr>
				<tr>
					<td colspan="6" class="text-right">
						<button type="button" class="btn btn-secondary rounded-pill" id="listBtn">목록</button>
	            		<button type="button" class="btn btn-secondary rounded-pill" id="cancelBtn">취소</button>
	             		<button type="button" class="btn btn-secondary rounded-pill" id="updBtn">수정완료</button>
					</td>
				</tr>
              </table>
              </form>
              <!-- End Bordered Table -->
	          
	           </div>
          </div> <!-- 클래스 상세 -->
          
            <!--
           <div class="card">
		       <div class="card-body">
		       	<h1>회차입니당</h1>
		        </div>
           </div> 회차상세 -->
		
		</div>
      </div>
    </section>
		
	</body>
</html>