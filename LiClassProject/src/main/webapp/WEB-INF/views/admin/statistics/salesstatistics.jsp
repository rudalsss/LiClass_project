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
        var salesCountTotal = ${salesCount.ALLPAYMENT}
        var salesCountAvg1 = Math.ceil(${salesCount.PAYMENTCONF} / salesCountTotal * 1000);
        var salesCountAvg2 = Math.ceil(${salesCount.PAYMENTCANCEL} / salesCountTotal * 1000);

        var quarter1Avg = Math.ceil(${salesCount.Q1} / salesCountTotal * 1000);
        var quarter2Avg = Math.ceil(${salesCount.Q2} / salesCountTotal * 1000);
        var quarter3Avg = Math.ceil(${salesCount.Q3} / salesCountTotal * 1000);
        var quarter4Avg = Math.ceil(${salesCount.Q4} / salesCountTotal * 1000);

        var level1Avg = Math.ceil(${levelCountList[1]} / salesCountTotal * 1000);
        var level2Avg = Math.ceil(${levelCountList[0]} / salesCountTotal * 1000);
        var level3Avg = Math.ceil(${levelCountList[2]} / salesCountTotal * 1000);

        $("#salesBar1").width(salesCountAvg1);
        $("#salesBar2").width(salesCountAvg2);

        $("#quarterBar1").width(quarter1Avg);
        $("#quarterBar2").width(quarter2Avg);
        $("#quarterBar3").width(quarter3Avg);
        $("#quarterBar4").width(quarter4Avg);

        $("#levelBar1").width(level1Avg);
        $("#levelBar2").width(level2Avg);
        $("#levelBar3").width(level3Avg);




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
                        <div class="card-body">
                            <h5 class="card-title">전체 매출<span>&nbsp | &nbsp<%=today%></span></h5>
                            <div class="d-flex align-items-center">

                                <div class="ps-3">
                                    <%--전체 매출 데이터 삽입--%>
<%--                                    <h6 style="font-size: 20px;">총 매출 : ${allSaleList[0]-allSaleList[1]} <br /> 환불 금액 : ${allSaleList[1]}
                                    </h6>--%>
                                    <h6>&nbsp;&nbsp;<img src="/resources/admin/payment-success.png">&nbsp;${salesCount.PAYMENTCONF}&nbsp;&nbsp;&nbsp; <img src="/resources/admin/payment-cancel.png">&nbsp;${salesCount.PAYMENTCANCEL}
                                    </h6>
                                </div>
                            </div>
                            <div class="progress mt-4">
                                <div id="salesBar1" class="progress-bar bg-success progress-bar-striped progress-bar-animated" role="progressbar" style="width: 0%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                <div id="salesBar2" class="progress-bar  bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width: 0%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>

                    </div>
                </div><!-- End Sales Card -->

                <!-- Revenue Card -->
                <div class="col-xxl-4 col-md-6">
                    <div class="card info-card revenue-card">
                        <div class="card-body">
                            <h5 class="card-title">분기별 매출<span>&nbsp | &nbsp <%=today%></span></h5>

                            <div class="d-flex align-items-center">

                                <div class="ps-3">
                                    <%--분기별매출 현황--%>

                                    <h6><img src="/resources/admin/calendar.png">${salesCount.Q1}&nbsp;/&nbsp;${salesCount.Q2}&nbsp;/&nbsp;${salesCount.Q3}&nbsp;/&nbsp;${salesCount.Q4}</h6>
                                </div>
                            </div>
                            <div class="progress mt-4 ">
                                <div id="quarterBar1" class="progress-bar  bg-primary progress-bar-striped progress-bar-animated" role="progressbar" style="width: 0%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                <div id="quarterBar2" class="progress-bar  bg-success progress-bar-striped progress-bar-animated" role="progressbar" style="width: 0%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                <div id="quarterBar3" class="progress-bar  bg-warning progress-bar-striped progress-bar-animated" role="progressbar" style="width: 0%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                <div id="quarterBar4" class="progress-bar  bg-dark-light progress-bar-striped progress-bar-animated" role="progressbar" style="width: 0%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>

                            </div>
                        </div>
                    </div>
                </div><!-- End Revenue Card -->
                <!-- Customers Card -->
                <div class="col-xxl-4 col-xl-12">

                    <div class="card info-card customers-card">
                        <div class="card-body">
                            <h5 class="card-title">난이도별 매출<span>&nbsp | &nbsp <%=today%></span></h5>
                            <div class="d-flex align-items-center">
                                <div class="ps-3">
                                    <%--난이도별 매출 데이터 입력--%>
                                    <h6><img src="/resources/admin/stairs-step.png">&nbsp;${levelCountList[1]}&nbsp;/&nbsp;${levelCountList[0]}&nbsp;/&nbsp;${levelCountList[2]}</h6>
                                </div>
                            </div>
                            <div class="progress mt-4">
                                <div id="levelBar1" class="progress-bar bg-success progress-bar-striped progress-bar-animated" role="progressbar" style="width: 0%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                <div id="levelBar2" class="progress-bar  bg-primary progress-bar-striped progress-bar-animated" role="progressbar" style="width: 0%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                <div id="levelBar3" class="progress-bar  bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width: 0%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                    </div>

                </div><!-- End Customers Card -->

                <!-- Reports -->
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Reports <span>/ <%=today%>></span></h5>
                            <%--분기별 매출 출력--%>

                            <!-- Line Chart -->
                            <%--차트 통계데이터 기반으로 삽입--%>
                            <canvas id="barChart" <%--style="max-height: 400px;"--%> height="150"></canvas>
                            <%--난이도별 매출 출력--%>
                        </div>
                    </div>
                </div><!-- End Reports -->
            </div>
        </div><!-- End Left side columns -->
    </div>
</section>
<script>
    const allSales_data = ${allSaleList[0]-allSaleList[1]}
    const allSales_data2 = ${allSaleList[1]}
    const quarter_data_1 = ${salesList[0]}
    const quarter_data_2 = ${salesList[1]}
    const quarter_data_3 = ${salesList[2]}
    const quarter_data_4 = ${salesList[3]}
    const level_data_1 = ${levelList[1]}
    const level_data_2 = ${levelList[0]}
    const level_data_3 = ${levelList[2]}

    var ctx = document.getElementById("barChart");
    var barChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['전체 매출', '분기별 매출', '난이도별 매출'],
            datasets: [{
                label: '',
                data: [allSales_data, quarter_data_1, level_data_2],
                backgroundColor: "rgb(153,204,255)",
                borderColor: "rgb(153,204,255)",

            },
                {
                    label: '',
                    data: [0, quarter_data_2, level_data_1],
                    backgroundColor: "rgb(229,204,255)",
                    borderColor: "rgb(229,204,255)",
                },
                {
                    label: '',
                    data: [0, quarter_data_3, level_data_3],
                    backgroundColor: "rgb(255,229,204)",
                    borderColor: "rgb(255,229,204)",
                },
                {
                    label: '',
                    data: [0, quarter_data_4, 0],
                    backgroundColor: "rgb(153,153,255)",
                    borderColor: "rgb(153,153,255)",
                }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            },
            responsive: true,
            title: {
                display: false,
                text: 'Report',
            },
            legend:{
                display : false
            }
        }
    });


</script>