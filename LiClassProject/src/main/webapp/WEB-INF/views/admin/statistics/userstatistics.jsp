<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, java.text.*"%>
<%
    Date date = new Date();
    SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat yearDate = new SimpleDateFormat("yyyy");
    SimpleDateFormat monthDate = new SimpleDateFormat("MM");

    String today = simpleDate.format(date);
    String year = yearDate.format(date);
    String month = monthDate.format(date);
%>
<script type="text/javascript">
    $(function (){
        var userTotal = ${userData.ALLUSERS}
        console.log(userTotal)
        var userAvg1 = Math.ceil(${userData.ACTIVEUSER} / userTotal * 1000);
        var userAvg2 = Math.ceil(${userData.INACTIVEUSER} / userTotal * 1000);

        var typeAvg1 = Math.ceil(${userData.EMAILUSER} / userTotal * 1000);
        var typeAvg2 = Math.ceil(${userData.KAKAOUSER} / userTotal * 1000);
        var typeAvg3 = Math.ceil(${userData.NAVERUSER} / userTotal * 1000);


        $("#userBar1").width(userAvg1);
        $("#userBar2").width(userAvg2);

        $("#userType1").width(typeAvg1);
        $("#userType2").width(typeAvg2);
        $("#userType3").width(typeAvg3);

    });

</script>

<section class="section dashboard col-lg-12">
    <div class="row">

        <!-- Left side columns -->
        <%--<div class="col-lg-8">--%>
        <div class="col-lg-10">
            <div class="row">

                <!-- Sales Card -->
                <div class="col-xxl-4 col-md-6">
                    <div class="card info-card sales-card">

                        <div class="filter">
                            <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                <li class="dropdown-header text-start">
                                    <h6>Filter</h6>
                                </li>

                                <li><a class="dropdown-item" href="#">Today</a></li>
                                <li><a class="dropdown-item" href="#">This Month</a></li>
                                <li><a class="dropdown-item" href="#">This Year</a></li>
                            </ul>
                        </div>

                        <div class="card-body">
                            <h5 class="card-title">전체 회원 통계<span>&nbsp | &nbsp<%=today%></span></h5>

                            <div class="d-flex align-items-center">
                                <div class="ps-4">
                                    <%--계정 통계데이터 삽입--%>
                                    <h6><img src="/resources/admin/UsersAll.png">${userData.ALLUSERS}&nbsp;&nbsp;<img src="/resources/admin/UserActive.png">${userData.ACTIVEUSER}&nbsp;&nbsp;<img src="/resources/admin/UserInActive.png">${userData.INACTIVEUSER}</h6>
                                </div>
                            </div>
                            <div class="progress mt-3">
                                <div id="userBar1" class="progress-bar bg-success progress-bar-striped progress-bar-animated" role="progressbar" style="width: 0%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                <div id="userBar2" class="progress-bar  bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width: 0%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>

                    </div>
                </div><!-- End Sales Card -->

                <!-- Revenue Card -->
                <div class="col-xxl-4 col-md-6">
                    <div class="card info-card revenue-card">

                        <div class="filter">
                            <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                <li class="dropdown-header text-start">
                                    <h6>Filter</h6>
                                </li>

                                <li><a class="dropdown-item" href="#">Today</a></li>
                                <li><a class="dropdown-item" href="#">This Month</a></li>
                                <li><a class="dropdown-item" href="#">This Year</a></li>
                            </ul>
                        </div>

                        <div class="card-body">
                            <h5 class="card-title">가입자 유형 통계<span>&nbsp | &nbsp <%=today%></span></h5>

                            <div class="d-flex align-items-center">

                                <div class="ps-4">
                                    <%--매출 통계 데이터 삽입--%>
                                    <h6><img src="/resources/admin/Email-user.png">${userData.EMAILUSER}&nbsp;&nbsp;<img src="/resources/admin/kakao-user.png"> ${userData.KAKAOUSER}&nbsp;&nbsp;<img src="/resources/admin/naver-user.png"> ${userData.NAVERUSER}</h6>
                                </div>
                            </div>
                            <div class="progress mt-3">
                                <div id="userType1" class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: 0%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                <div id="userType2" class="progress-bar  bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width: 0%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                <div id="userType3" class="progress-bar  bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width: 0%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>

                    </div>
                </div><!-- End Revenue Card -->

                <!-- Reports -->
                <div class="col-12">
                    <div class="card">

                        <div class="filter">
                            <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                <li class="dropdown-header text-start">
                                    <h6>Filter</h6>
                                </li>

                                <li><a class="dropdown-item" href="#">Today</a></li>
                                <li><a class="dropdown-item" href="#">This Month</a></li>
                                <li><a class="dropdown-item" href="#">This Year</a></li>
                            </ul>
                        </div>

                        <div class="card-body">
                            <h5 class="card-title">전체 회원 통계 <span>/ <%=today%></span></h5>

                            <!-- Line Chart -->
                            <%--차트 통계데이터 기반으로 삽입--%>
                            <canvas id="doughnut" <%--style="max-height: 400px;"--%> height="150"></canvas>

                        </div>
                    </div>
                </div><!-- End Reports -->
            </div>
        </div><!-- End Left side columns -->
    </div>
</section>
<script>
    //활성화 계정 통계 차트

    //예약 통계 차트

    var ctx = document.getElementById("doughnut");
    var doughnut = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: [
                '활성화 계정',
                '탈퇴 계정',

            ],
            datasets: [{
                label: 'My First Dataset',
                data: [${userData.ACTIVEUSER}, ${userData.INACTIVEUSER}],
                backgroundColor: [
                    'rgb(46,180,12)',
                    'rgb(239,41,68)',
                    'rgb(255, 205, 86)'
                ],
                hoverOffset: 4
            }]
        }
    });

</script>