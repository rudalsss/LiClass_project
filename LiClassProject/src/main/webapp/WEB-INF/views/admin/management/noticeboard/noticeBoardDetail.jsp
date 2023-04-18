<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css">
<script type="text/javascript">

    $(function (){
        $("#updateFormBtn").click(function(){
            console.log("dddd")
            $("#f_data").attr({
               "method" : "post",
               "action" : "/management/noticeboard/updateForm"
            });
            $("#f_data").submit();
        });
        $("#noticeDeleteBtn").click(function(){
            if(confirm("정말 삭제하시겠습니까?")){
                $("#f_data").attr({
                    "method" : "post",
                    "action" : "/management/noticeboard/noticeDelete"
                });
                $("#f_data").submit();
            }

        });
    });


</script>
<div class="pagetitle">
    <h1>공지사항 상세조회</h1>
    <hr />
</div><!-- End Page Title -->
<div class="contentContainer container">
    <form name="f_data" id="f_data" method="post">
        <input type="hidden" name="qna_no" id="qna_no" value="${detail.qna_no}"/>
    </form>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading clearfix">
                    <h3 class="panel-title pull-left" style="line-height: 2.5;">${detail.qna_title}</h3>
                    <div class="pull-right">
                        <button type="button" class="btn btn-primary" id="updateFormBtn">수정</button>
                        <button type="button" class="btn btn-danger" id="noticeDeleteBtn">삭제</button>
                    </div>
                </div>
                <div class="panel-body">
                    <p><strong>작성자: </strong>${adminLogin.admin_name}</p>
                    <p><strong>작성일: </strong>${detail.qna_date}
                        <c:if test="${not empty detail.qna_date_fix}">
                        (<strong>수정일: </strong>${detail.qna_date_fix})
                    </c:if></p>
                    <hr>
                    <div class="panel-group" id="accordion">
                        <div class="panel panel-default">
                            <div id="collapse1" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    <p>${detail.qna_content}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>