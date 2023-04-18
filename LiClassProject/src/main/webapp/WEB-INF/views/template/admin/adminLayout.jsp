<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title><tiles:getAsString name="title"/></title>
    <meta content="" name="description">
    <meta content="" name="keywords">
    <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"/>
    <script type="text/javascript" src="/resources/include/js/jquery-3.6.2.min.js"/>
    <script src="/resources/include/dist/js/bootstrap.js"></script>
    <link href="/resources/include/css/styles.css" rel="stylesheet"/>

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

    <!-- =======================================================
    * Template Name: NiceAdmin - v2.5.0
    * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->
</head>
<body>
    <header id="header" class="header fixed-top d-flex align-items-center">
    <tiles:insertAttribute name="header"/>
    </header>
    <aside id="sidebar" class="sidebar">
    <tiles:insertAttribute name="side"/>
    </aside>

    <main id="main" class="main">
        <tiles:insertAttribute name="main"/>
    </main>

    <footer id="footer" class="footer">
        <tiles:insertAttribute name="footer"/>
    </footer>
</body>
</html>
