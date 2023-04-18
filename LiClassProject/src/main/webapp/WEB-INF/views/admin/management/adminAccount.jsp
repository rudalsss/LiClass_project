<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<script type="text/javascript">
    $(function(){

        $("#admin_change_btn").click(function (){
            let admin_pw = "${adminLogin.admin_pw}";
            let admin_pw_input = $("#admin_pw_conf").val();
            if(admin_pw_input == admin_pw){
            $("#basicModal").modal('show');
            } else{
                alert("비밀번호가 일치하지 않습니다.");
            }
        });
        $("#change_pwd_btn").click(function (){
            let admin_no = "${adminLogin.admin_no}";
            let admin_change_pw = $("#admin_change_pw").val();
            let admin_change_pwConf = $("#admin_change_pwConf").val();

            if(admin_change_pw == admin_change_pwConf){

                $("#admin_no").val(admin_no);
                $("#admin_pw").val(admin_change_pw);
                if(confirm("비밀번호를 변경하시겠습니까?")){

                    $("#pw_change_form").attr({
                        "method" : "post",
                        "action" : "/liadmin/changeAdminPwd"
                    });
                    $("#pw_change_form").submit();
                }
            } else{
                alert("비밀번호가 일치하지 않습니다");
            }
        });
    });

</script>

<div class="container">
    <form id="pw_change_form" name="pw_change_form">
        <input type="hidden" name="admin_no" id="admin_no">
        <input type="hidden" name="admin_pw" id="admin_pw">
    </form>
    <h1>관리자 계정 관리</h1>
    <hr />
    <div class="row justify-content">
        <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
            <div class="card mb-3">

                <div class="card-body">

                    <div class="pt-4 pb-2">
                        <h5 class="card-title text-left pb-0 fs-4">비밀번호 변경</h5>
                        <p class="text-left small">다른정보는 수정할 수 없습니다.</p>
                    </div>

                    <form class="row g-3 needs-validation" novalidate="" id="adminAccount">
                        <div class="col-12">
                            <label for="admin_name" class="form-label">관리자 아이디</label>
                            <input type="text" name="admin_id" class="form-control" id="admin_id" required="" disabled value="${adminLogin.admin_id}">
                        </div>

                        <div class="col-12">
                            <label for="admin_name" class="form-label">관리자 이름</label>
                            <div class="input-group has-validation">
                                <input type="text" name="admin_name" class="form-control" id="admin_name" required="" disabled value="${adminLogin.admin_name}">
                            </div>
                        </div>

                        <div class="col-12">
                            <label for="admin_pw_conf" class="form-label">비밀번호</label>
                            <input type="password" name="admin_pw_conf" class="form-control" id="admin_pw_conf" required="">
                        </div>

                        <div class="col-12">
                            <button type="button" class="btn btn-success" id="admin_change_btn">비밀번호 변경</button>
                            <div class="modal fade" id="basicModal" tabindex="-1" style="display: none;" aria-hidden="true">

                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">관리자 비밀번호 변경</h5>
                                        </div>
                                        <div class="modal-body">
                                            <label for="admin_change_pw" class="form-label">비밀번호</label>
                                            <input type="password" name="admin_change_pw" class="form-control" id="admin_change_pw" required="">

                                            <label for="admin_change_pwConf" class="form-label">비밀번호 확인</label>
                                            <input type="password" name="admin_change_pwConf" class="form-control" id="admin_change_pwConf" required="">
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" id="change_pwd_btn">변경하기</button>
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                        <%--모달--%>
                </div>
            </div>
        </div>
    </div>
</div>