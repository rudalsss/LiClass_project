<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css">
<script type="text/javascript">

    $(function (){
        $("#qnaAnswerBtn").click(function(){
            let qna_no = $(this).attr("data-num");
            $("#qna_no").val(qna_no);
            console.log("dddd")
            $("#f_data").attr({
               "method" : "post",
               "action" : "/management/qnaboard/qnaAnswerForm/"
            });
            $("#f_data").submit();
        });
        $("#qnaDeleteBtn").click(function(){
            if(confirm("정말 삭제하시겠습니까?")){
                $("#f_data").attr({
                    "method" : "post",
                    "action" : "/management/qnaboard/qnaBoardDelete"
                });
                $("#f_data").submit();
            }
        });
        $("#qnaAnswerUpdateBtn").click(function (){
            let qna_no = $(this).attr("data-num");
            $("#qna_no").val(qna_no);
            console.log(qna_no);
           $("#f_data").attr({
               "method" : "post",
               "action" : "/management/qnaboard/answerUpdateForm"
           });
           $("#f_data").submit();
        });
    });


</script>


<div class="pagetitle">
    <h1>문의사항 상세조회</h1>
    <hr />
</div><!-- End Page Title -->
    <div class="contentContainer container">
        <form name="f_data" id="f_data" method="post">
            <input type="hidden" name="qna_no" id="qna_no"/>
        </form>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading clearfix">
                    <h3 class="panel-title pull-left" style="line-height: 2.5;"><strong>[${detail.qna_category}]</strong>&nbsp;${detail.qna_title}</h3>

                    <div class="pull-right">
                        <c:choose>
                        <c:when test="${empty answerDetail && detail.qna_category == '문의'}">
                            <button type="button" class="btn btn-success" id="qnaAnswerBtn" data-num="${detail.qna_no}">답변</button>
                        </c:when>
                        <c:when test="${empty answerDetail && detail.qna_category == '답변'}">
                            <button type="button" class="btn btn-success" id="qnaAnswerUpdateBtn" data-num="${detail.qna_no}">수정</button>
                        </c:when>
                        </c:choose>
                        <button type="button" class="btn btn-danger " id="qnaDeleteBtn">삭제</button>
                    </div>
                </div>
                <div class="panel-body">
                    <c:choose>
                        <c:when test="${detail.qna_category == '답변'}">
                            <p><strong>작성자: </strong>${detail.admin_name}</p>
                        </c:when>
                        <c:otherwise>
                            <p><strong>작성자: </strong>${detail.user_name}</p>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                    <c:when test="${not empty detail.qna_date_fix}">
                        <p><strong>작성일</strong>&nbsp;:&nbsp;${detail.qna_date} (<strong>수정일</strong>&nbsp;:&nbsp;${detail.qna_date_fix})</p>
                    </c:when>
                    <c:otherwise>
                    <p><strong>작성일</strong>&nbsp;:&nbsp;${detail.qna_date}
                        </c:otherwise>
                        </c:choose>
                    <hr>
                    <div id="collapse2" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <p>${detail.qna_content}</p>
                        </div>
                    </div>
                    <c:choose>
                        <c:when test="${detail.qna_group == answerDetail.qna_group}">
                    <div class="panel-group" id="accordion">
                        <div class="panel panel-default">
                            <div class="panel-heading clearfix">
                                <h4 class="panel-title pull-left" style="line-height: 2.5;"><strong>[${answerDetail.qna_category}]</strong> &nbsp${answerDetail.qna_title}</h4>
                                <div class="pull-right">
                                    <button type="button" class="btn btn-primary" id="qnaAnswerUpdateBtn" data-num="${answerDetail.qna_no}">수정</button>
                                </div>
                            </div>
                            <div class="panel-body">
                            <p><strong>작성자: </strong>${answerDetail.admin_name}</p>
                            <c:choose>
                                <c:when test="${not empty answerDetail.qna_date_fix}">
                                     <p><strong>작성일</strong>&nbsp;:&nbsp;${answerDetail.qna_date} (<strong>수정일</strong>&nbsp;:&nbsp;${answerDetail.qna_date_fix})</p>
                                </c:when>
                                <c:otherwise>
                                         <p><strong>작성일</strong>&nbsp;:&nbsp;${answerDetail.qna_date}
                                </c:otherwise>
                            </c:choose>
                            <hr>
                            <div id="collapse1" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    <p>${answerDetail.qna_content}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                        </c:when>
                    </c:choose>
                   </div>
                </div>
            </div>
        </div>
    </div>
</div>