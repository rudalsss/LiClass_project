<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
	.headline-h4{
		color: #555;
	    font-size: 20px;
	    font-weight: 700;
	    line-height: 35px;
	    margin-bottom: 30px;
	}
	.post-title{
		font-size: 28px;
	}
	.pager .next>a:hover {
		background-color: #191919;
		border:#191919;
		color:white;
	}
	.post-meta{
		margin:0px;
	}
	.pager{
		margin:0px;
	}
	.button:hover{
		cursor: pointer;
	}
</style>
<!-- Theme CSS -->
<link href="/resources/client/mypage/mypost/css/clean-blog.min.css" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"> </script>
<!-- Custom Fonts -->
<link href="/resources/client/mypage/mypost/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!-- Main Content -->
<script>
	$(function(){
		
		//답변글 상세보기
		$(".myAnswer").click(function(){
			var qnaNo = $(this).data("num");
			var group = $(this).data("group");
			$.ajax({
			      type : "GET",
			      url : "/myQnaAnswer",
			      data : {
			    	 "qna_no" : qnaNo,
			    	 "qna_group" : group
			      },
			      success : function(answerNO){
			    	 location.href="/client/qnaboard/qnaBoardDetail?qna_no="+answerNO;
			      }
			   });
		});
	});
</script>
    <div class="container">
        <div class="row">
       	 	<h2 class="post-title text-center" style="margin: 50px 0px;">
               My QnA
            </h2>
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
            	 <c:choose>
                     <c:when test="${ not empty myQnaList }">
                        <c:forEach var="qnaVO" items="${myQnaList}" varStatus="status">
			                <div class="post-preview" >
			                    <a>
			                        <h2 class="post-title">
			                           #${status.index+1} ${qnaVO.qna_title}
			                        </h2>
			                        <h4 class="post-subtitle">
			                           <span style="padding-left:30px;" class="review_content">
		                               		${fn:replace(qnaVO.qna_content, replaceChar, "<br/>")}
		                               </span>
			                        </h4>
			                    </a>
			                    <p class="post-meta">Posted by <a href="#"></a> ${qnaVO.qna_date}
				                    <c:if  test="${qnaVO.qna_status != 1 }">
	                                  <span class="badge badge-primary badge-labeled" style="background-color: #08176aad; padding:6px;">답변완료</span>
	                                 </c:if>
	                                 <c:if  test="${qnaVO.qna_status == 1 }">
	                                 	<span class="badge badge-primary badge-labeled" style="background-color: #e48c8cf5; padding:6px;">답변대기</span>
	                                 </c:if>
                                 </p>
			                </div>
			                 <ul class="pager">
			                    <li class="next">
			                    	<c:if  test="${qnaVO.qna_status != 1 }">
			                        	<a class="button myAnswer"  data-num="${qnaVO.qna_no}" data-group="${qnaVO.qna_group}">답변글 상세보기</a>
	                                 </c:if>
	                                 <c:if  test="${qnaVO.qna_status == 1 }">
			                        	<a href="/client/qnaboard/qnaBoardDetail?qna_no=${qnaVO.qna_no}" class="button myQuestion">문의글 상세보기</a>
	                                 </c:if>
			                    </li>
			                </ul>
			                <hr>
                   		</c:forEach>
                	 </c:when>
              </c:choose>
                <!-- Pager -->
               
            </div>
        </div>
    </div>

    <hr>
<!-- jQuery -->
    <script src="/resources/client/mypage/mypost/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/client/mypage/mypost/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- Contact Form JavaScript -->
    <script src="/resources/client/mypage/mypost/js/jqBootstrapValidation.js"></script>
    <script src="/resources/client/mypage/mypost/js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="/resources/client/mypage/mypost/js/clean-blog.min.js"></script>