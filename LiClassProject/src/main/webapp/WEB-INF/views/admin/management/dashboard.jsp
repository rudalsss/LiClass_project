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
        var userTotal = ${userState.INACTIVEUSER} + ${userState.ACTIVEUSER}
        //var salesTotal = ${allSales.ALLSALES}
        var reserveTotal =${userReserve.RESERVECHECK} + ${userReserve.RESERVECANCEL}

        var userAvg1 = Math.ceil(${userState.ACTIVEUSER} / userTotal * 1000);
        var userAvg2 = Math.ceil(${userState.INACTIVEUSER} / userTotal * 1000);
       // var salesAvg1 = Math.ceil(${allSales.ALLSALES} / salesTotal * 1000);
//        var salesAvg2 = Math.ceil(${allSales.ALLSALES} / userTotal * 1000);
        var reserveAvg1 = Math.ceil(${userReserve.RESERVECHECK} / reserveTotal * 1000);
        var reserveAvg2 = Math.ceil(${userReserve.RESERVECANCEL} / reserveTotal * 1000);


        $("#userBar1").width(userAvg1);
        $("#userBar2").width(userAvg2);
     //   $("#salesBar1").width(salesAvg1);
//        $("#salesBar2").width(salesAvg2);
        $("#reserveBar1").width(reserveAvg1);
        $("#reserveBar2").width(reserveAvg2);


        /* 문의사항 제목 클릭 시 상세페이지 이동을 위한 처리 이벤트 */
        $(".goDetail").click(function(){
            let qna_no = $(this).parents("tr").attr("data-num");
            $("#qna_no").val(qna_no);
            //상세페이지로 이동하기 위해 form 추가 (id : detailForm)
            $("#detailForm").attr({
                "method" : "get",
                "action" : "/management/qnaboard/qnaBoardDetail"
            });
            $("#detailForm").submit();
        });
    });

</script>


    <div class="pagetitle">
        <h1>LiClass 대시보드</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/management/dashboard">Home</a></li>
                <li class="breadcrumb-item active">Dashboard</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
        <div class="row">

            <!-- Left side columns -->
            <%--<div class="col-lg-8">--%>
            <div class="col-lg-12">
                <div class="row">

                    <!-- Sales Card -->
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card sales-card">
                            <div class="card-body" >
                                <h5 class="card-title"><a href="/admin/statistics/userstatistics">활성화 계정</a><span>| <%=today%>&nbsp 기준</span></h5>

                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <%--<i class="bi bi-cart"></i>--%><i class="bi bi-people"></i>
                                    </div>
                                    <div class="ps-3">
                                        <%--계정 통계데이터 삽입--%>
                                        <h6>&nbsp;${userState.ACTIVEUSER} / ${userState.INACTIVEUSER}</h6>
                                            <%--<span class="text-muted small pt-2 ps-1">전일대비</span>--%>
                                            <%--<span class="text-success small pt-1 fw-bold">8%</span><i class="bi bi-caret-up"></i>--%>
                                    </div>

                                </div>

                                <div class="progress mt-3">
                                    <div id="userBar1" class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: 0%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                    <div id="userBar2" class="progress-bar  bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width: 0%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>

                        </div>
                    </div><!-- End Sales Card -->

                    <!-- Revenue Card -->
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card revenue-card">
                            <div class="card-body" >
                                <h5 class="card-title"><a href="/admin/statistics/salesstatistics">전체 매출 통계</a><span>| <%=today%>&nbsp 기준</span></h5>

                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-currency-dollar"></i>
                                    </div>
                                    <div class="ps-3">
                                        <%--매출 통계 데이터 삽입--%>
                                        <h6>&#8361; ${allSales.ALLSALES}</h6>
                                            <%--<span class="text-muted small pt-2 ps-1">전일대비</span>--%>
                                           <%-- <span class="text-success small pt-1 fw-bold">8%</span><i class="bi bi-caret-up"></i>--%>
                                            <%--<canvas id="SalesChart" height="40"></canvas>--%>
                                    </div>
                                </div>
                                <div class="progress mt-3">
                                    <div id="salesBar1"class="progress-bar bg-success progress-bar-striped progress-bar-animated" role="progressbar" style="width: 87%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                    <div id="salesBar2"class="progress-bar bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width: 13%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div><!-- End Revenue Card -->
                    <!-- Customers Card -->
                    <div class="col-xxl-4 col-xl-12">

                        <div class="card info-card customers-card">

                            <div class="card-body" >
                                <h5 class="card-title"><a href="/admin/statistics/reservestatistics">전체 예약 통계</a> <span>| <%=today%>&nbsp 기준</span></h5>

                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-calendar2-check"></i>
                                    </div>
                                    <div class="ps-3">
                                        <%--예약 통계데이터 삽입--%>
                                        <h6>&nbsp;${userReserve.RESERVECHECK} / ${userReserve.RESERVECANCEL}</h6>
                                       <%-- <span class="text-muted small pt-2 ps-1">전일대비</span>--%>
                                        <%--<span class="text-success small pt-1 fw-bold">8%</span><i class="bi bi-caret-up"></i>--%>
                                    </div>
                                </div>
                                <div class="progress mt-3">
                                    <div id="reserveBar1" class="progress-bar bg-warning progress-bar-striped progress-bar-animated" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                    <div id="reserveBar2" class="progress-bar bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>

                        </div>

                    </div><!-- End Customers Card -->

                    <!-- Reports -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Reports <span>/ <%=today%>></span></h5>

                                <!-- Line Chart -->
                                <%--차트 통계데이터 기반으로 삽입--%>
                                <div id="reportsChart"><canvas id="ReportChart" width="60%" height="15"></canvas></div>
                                <script>

                                </script>
                            </div>
                        </div>
                    </div><!-- End Reports -->
                    <div class="col-12">
                        <form id="detailForm">
                            <input type="hidden" id="qna_no" name="qna_no"/>
                        </form>
                        <div class="card top-selling overflow-auto">
                            <div class="card-body pb-0">
                                <h5 class="card-title"><a href="/management/noticeboard/noticeBoard">최근 공지사항</a><span>  |  <%=today%></span></h5>
                                <table class="table table-borderless">
                                    <thead>
                                    <tr>
                                        <th scope="col">구분</th>
                                        <th scope="col">글제목</th>
                                        <th scope="col">작성자</th>
                                        <th scope="col">등록일</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                        <c:when test="${not empty noticeList}">
                                             <c:forEach var="notice" items="${noticeList}" varStatus="status">
                                                <tr data-num="${notice.qna_no}">
                                                    <td>${notice.qna_category}</td>
                                                    <td class="goDetail">${notice.qna_title}</td>
                                                    <td>${notice.admin_name}</td>
                                                    <td>${notice.qna_date}</td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="5" class="tac text-center">등록된 게시글이 존재하지 않습니다.</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div><!-- End Top Selling -->
                    <div class="col-12">
                        <div class="card top-selling overflow-auto">
                            <div class="card-body pb-0">
                                <h5 class="card-title"><a href="/management/qnaboard/qnaBoard">최근 문의사항</a><span>  |  <%=today%></span></h5>

                                <table class="table table-borderless">
                                    <thead>
                                    <tr>
                                        <th scope="col">구분</th>
                                        <th scope="col">글제목</th>
                                        <th scope="col">작성자</th>
                                        <th scope="col">등록일</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                        <c:when test="${not empty qnaList}">
                                            <c:forEach var="qna" items="${qnaList}" varStatus="status">
                                                <tr data-num="${qna.qna_no}">
                                                    <td>${qna.qna_category}</td>
                                                    <td class="goDetail">${qna.qna_title}</td>
                                                    <td>${qna.user_name}</td>
                                                    <td>${qna.qna_date}</td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="5" class="tac text-center">등록된 게시글이 존재하지 않습니다.</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div><!-- End Top Selling -->

                </div>
            </div><!-- End Left side columns -->
        </div>
        <script>
            //리포트 통계 차트
            var ctx = document.getElementById("ReportChart");
            var ReportChart = new Chart(ctx, {
                type: 'horizontalBar',
                data: {
                    labels: ['계정', '매출', '예약'],
                    datasets: [{
                        label: '어제',
                        data: [${userState.INACTIVEUSER}, 3, ${userReserve.RESERVECANCEL}],
                        backgroundColor: "rgb(204,229,255)",
                        borderColor: "rgb(204,229,255)",
                    },
                        {
                            label: '오늘',
                            data: [${userState.ACTIVEUSER}, 7, ${userReserve.RESERVECHECK}],
                            backgroundColor: "rgb(255,229,204)",
                            borderColor: "rgb(255,229,204)",
                        }]
                },
                options: {
                    responsive: true,
                    title: {
                        display: false,
                        text: 'Report',
                    },
                    tooltips: {
                        mode: 'index',
                        intersect: true,
                    },
                    hover: {
                        mode: 'nearest',
                        intersect: true
                    },
                    scales: {
                        yAxes: [{
                            display: true,
                            scaleLabel: {
                                display: false,
                                labelString: 'x축'
                            },
                            gridLines :{
                                display: false,
                            },
                        }],
                        xAxes: [{
                            display: true,
                            ticks: {
                                display :false,
                                autoSkip: false
                            },
                            gridLines :{
                                display: false,
                            },
                            scaleLabel: {
                                display: false,
                                labelString: 'y축'
                            },

                        }]
                    },
                    legend:{
                        display : false
                    }
                }
            });
        </script>
    </section>