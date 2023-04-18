<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css">
<script type="text/javascript">
    $(function(){
        /* 저장 버튼 클릭 시 처리 이벤트 */
        $("#answerInsertBtn").click(function(){

            if(!chkData("#qna_title", "제목을")) return;
            else if(!chkData("#qna_content", "본문을")) return;
            $("#writeForm").attr({
                "method" : "post",
                "action" : "/management/qnaboard/qnaAnswerInsert"
            });
            $("#writeForm").submit();
        })

        /* 뒤로가기 버튼 클릭 시 처리 이벤트 */
        $("#qnaBoardListBtn").click(function(){
            location.href="/management/qnaboard/qnaBoard";
        });
    });
</script>

<div class="contentContainer container">
    <h2>본문글</h2>
    <hr/>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading clearfix">
                    <h3 class="panel-title pull-left" style="line-height: 2.5;"><strong>[${answerData.qna_category}]</strong>&nbsp${answerData.qna_title}</h3>
                </div>
                <div class="panel-body">
                    <p><strong>작성자: </strong>${answerData.user_name}</p>
                    <p><strong>작성일: </strong>${answerData.qna_date}</p>
                    <hr>
                    <div id="collapse2" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <p>${answerData.qna_content}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="container">
    <h2>답변 작성</h2>
    <hr/>
    <form class="form-horizontal" id="writeForm">
        <input type="hidden" id="qna_category" name="qna_category" value="${answerData.qna_category}">
        <input type="hidden" id="qna_no" name="qna_no" value="${answerData.qna_no}">
        <input type="hidden" id="qna_group" name="qna_group" value="${answerData.qna_group}">
        <input type="hidden" id="qna_indent" name="qna_indent" value="${answerData.qna_indent}">
        <input type="hidden" id="qna_step" name="qna_step" value="${answerData.qna_step}">
        <input type="hidden" id="user_no" name="user_no" value="${answerData.user_no}">

        <input type="hidden" id="admin_no" name="admin_no" value="${adminLogin.admin_no}">
        <input type="hidden" id="admin_name" name="admin_name" value="${adminLogin.admin_name}">

        <div class="form-group">
            <label for="title">제목:</label>
            <input type="text" id="qna_title" name="qna_title" class="form-control" id="title" placeholder="제목을 입력하세요">
        </div>
        <div class="form-group">
            <label for="content">본문:</label>
            <textarea class="form-control" id="qna_content" name="qna_content" rows="8" id="content"></textarea>
        </div>
        <div class="text-right">
        <button type="button" class="btn btn-primary" id="answerInsertBtn">등록</button>
        <button class="btn btn-secondary" type="button" id="qnaBoardListBtn">뒤로가기</button>
        </div>
    </form>
</div>