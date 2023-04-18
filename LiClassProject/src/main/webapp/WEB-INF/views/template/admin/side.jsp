<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!-- ======= Sidebar ======= -->
<%--<aside id="sidebar" class="sidebar">--%>

    <ul class="sidebar-nav" id="sidebar-nav">

        <li class="nav-item">
            <a class="nav-link" href="/management/dashboard">
                <i class="bi bi-grid"></i>
                <span>대시보드</span>
            </a>
        </li><!-- End Dashboard Nav -->

        <%--회원관리 탭--%>
        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-person"></i><span>회원관리</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav" style="visibility: inherit;">
                <li>
                    <a href="/liadmin/adminAccount">
                        <i class="bi bi-circle"></i><span>관리자 계정관리</span>
                    </a>
                </li>
                <li>
                    <a href="/clientmanagement/clientList">
                        <i class="bi bi-circle"></i><span>회원관리</span>
                    </a>
                </li>
                <li>
                    <a href="/admin/statistics/userstatistics">
                        <i class="bi bi-circle"></i><span>회원통계</span>
                    </a>
                </li>
            </ul>
        </li>
        <!--회원 관리탭 끝-->

        <%--매출 관리탭--%>
        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-cash-coin"></i><span>매출</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav" style="visibility: inherit;">
                <li>
                    <a href="/admin/statistics/salesstatistics">
                        <i class="bi bi-circle"></i><span>매출통계</span>
                    </a>
                </li>
            </ul>
        </li>
        <!--매출 관리탭 끝-->

        <%--예약 관리탭--%>
        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-calendar2-plus"></i><span>예약</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav" style="visibility: inherit;">
                <li>
                    <a href="/admin/statistics/reservestatistics">
                        <i class="bi bi-circle"></i><span>예약 통계</span>
                    </a>
                </li>

            </ul>
        </li>
        <!--예약 관리탭 끝-->

        <%--클래스 관리 탭--%>
        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-palette"></i><span>클래스</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="charts-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav" style="visibility: inherit;">
                <li>
                    <a href="/admin/class/classList">
                        <i class="bi bi-circle"></i><span>클래스 관리</span>
                    </a>
                </li>
            </ul>
        </li>
        <!-- 클래스 관리 탭 끝 -->

        <%--게시판 관리 탭--%>
        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-clipboard-data"></i><span>게시판</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav" style="visibility: inherit;">
                <li>
                    <a href="/management/noticeboard/noticeBoard">
                        <i class="bi bi-circle"></i><span>공지게시판 관리</span>
                    </a>
                </li>
                <li>
                    <a href="/management/qnaboard/qnaBoard">
                        <i class="bi bi-circle"></i><span>문의게시판 관리</span>
                    </a>
                </li>
                <li>
                    <a href="/management/studio/studioList">
                        <i class="bi bi-circle"></i><span>홍보게시판 관리</span>
                    </a>
                </li>
                <li>
                    <a href="/management/center/centerList">
                        <i class="bi bi-circle"></i><span>강사게시판 관리</span>
                    </a>
                </li>
            </ul>
        </li>
        <!--게시판 관리탭 끝-->
    </ul>

<%--</aside>--%>
<!-- End Sidebar-->
