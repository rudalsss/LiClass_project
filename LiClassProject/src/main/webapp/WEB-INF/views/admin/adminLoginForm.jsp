<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<html>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>관리자 페이지</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="/resources/include/adminpage/assets/img/favicon.png" rel="icon">
  <link href="/resources/include/adminpage/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/resources/include/adminpage/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/resources/include/adminpage/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/resources/include/adminpage/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="/resources/include/adminpage/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="/resources/include/adminpage/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="/resources/include/adminpage/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="/resources/include/adminpage/assets/vendor/simple-datatables/style.css" rel="stylesheet">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

  <!-- Template Main CSS File -->
  <link href="/resources/include/adminpage/assets/css/style.css" rel="stylesheet">

  <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
  <script type="text/javascript" src="/resources/include/js/common.js"></script>
  <!-- =======================================================
  * Template Name: NiceAdmin - v2.5.0
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  <script type="text/javascript">
    $(function(){
      let errorMsg = "${errorMsg}";
      if(errorMsg != ""){
        alert(errorMsg);
        errorMsg = "";
      }
      $("#loginBtn").click(function() {
        if (!chkData("#admin_id", "아이디를")) return;
        else if (!chkData("#admin_pw", "비밀번호를")) return;
        else {
          $("#loginForm").attr({
            "method": "post",
            "action": "/liadmin/login"
          });
          $("#loginForm").submit();
        }
      });
    });

  </script>
</head>

<body>

  <div class="container">
    <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">

      <div class="container">
        <div class="row justify-content-center">

          <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

            <div class="d-flex justify-content-center py-4">
            </div><!-- End Logo -->
            <div class="card mb-3">
              <div class="card-body">
                <div class="pt-4 pb-2">

                  <h5 class="card-title text-center pb-0 fs-4"><img src="/resources/admin/LiClass-adminLogo.png" alt=""></h5>
                </div>

                <form class="row g-3 needs-validation" id="loginForm" novalidate >

                  <div class="col-12">
                    <label for="admin_pw" class="form-label">AdminID</label>
                    <div class="input-group has-validation">
                      <input type="text" name=admin_id id="admin_id" class="form-control" required>
                      <div class="invalid-feedback">아이디를 입력해주세요.</div>
                    </div>
                  </div>

                  <div class="col-12">
                    <label for="admin_pw" class="form-label">Password</label>
                    <input type="password" name="admin_pw" id="admin_pw" class="form-control" required>
                    <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
                  </div>

                  <div class="col-12">
                  </div>
                  <div class="col-12">
                    <button class="btn btn-primary w-100" type="submit" id="loginBtn">Login</button>
                  </div>
                </form>

              </div>
            </div>

            <div class="credits">
              <!-- All the links in the footer should remain intact. -->
              <!-- You can delete the links only if you purchased the pro version. -->
              <!-- Licensing information: https://bootstrapmade.com/license/ -->
              <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
              Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
            </div>

          </div>
        </div>
      </div>

    </section>

  </div>

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->

</body>
<script src="/resources/include/adminpage/assets/vendor/apexcharts/apexcharts.min.js"></script>
<script src="/resources/include/adminpage/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/include/adminpage/assets/vendor/chart.js/chart.umd.js"></script>
<script src="/resources/include/adminpage/assets/vendor/echarts/echarts.min.js"></script>
<script src="/resources/include/adminpage/assets/vendor/quill/quill.min.js"></script>
<script src="/resources/include/adminpage/assets/vendor/simple-datatables/simple-datatables.js"></script>
<script src="/resources/include/adminpage/assets/vendor/tinymce/tinymce.min.js"></script>
<script src="/resources/include/adminpage/assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="/resources/include/adminpage/assets/js/main.js"></script>
</html>