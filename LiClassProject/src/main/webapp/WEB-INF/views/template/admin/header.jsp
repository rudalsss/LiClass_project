<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
        <a href="/management/dashboard" class="logo d-flex align-items-center">
            <img src="/resources/admin/dashboard-logo.png" alt="">
            <span class="d-none d-lg-block">Li Class</span>
        </a>
        <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

<%--    <div class="search-bar"> 검색창 안써서 비활성화
        <form class="search-form d-flex align-items-center" method="POST" action="#">
            <input type="text" name="query" placeholder="Search" title="Enter search keyword">
            <button type="submit" title="Search"><i class="bi bi-search"></i></button>
        </form>
    </div><!-- End Search Bar -->--%>

    <nav class="header-nav ms-auto">
        <ul class="d-flex align-items-center">

            <li class="nav-item dropdown pe-3">

                <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                    <img src="/resources/include/adminpage/assets/img/admin-profile.png" alt="Profile" class="rounded-circle">
                    <c:if test="${not empty adminLogin}">
                    <span class="d-none d-md-block dropdown-toggle ps-2">${adminLogin.admin_id}</span>
                    <input type="hidden" id="admin_no" name="admin_no" value=${adminLogin.admin_no}>
                    </c:if>
                    <c:if test="${empty adminLogin}">
                        <script type="text/javascript">
                            location.href="/liadmin/login"
                        </script>

                    </c:if>
                </a><!-- End Profile Iamge Icon -->

                <%--관리자 프로필 파트--%>
                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                    <li class="dropdown-header">

                        <h6>${adminLogin.admin_id}</h6>
                        <span>${adminLogin.admin_name}</span>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>


                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="/liadmin/logout">
                            <i class="bi bi-box-arrow-right"></i>
                            <span>Sign Out</span>
                        </a>
                    </li>

                </ul><!-- End Profile Dropdown Items -->
                <%--관리자 프로필 파트--%>
            </li><!-- End Profile Nav -->
        </ul>
    </nav><!-- End Icons Navigation -->
</header><!-- End Header -->
