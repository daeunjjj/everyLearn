<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/dashboard.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>대시보드</h1>
            <div id="line"></div>
            <div class="main-wrap">
                <h2>알림</h2>
                <div class="todo-area">
                    <a href="/el/admin/member/teacher/list?pno=1&&category=status" class="todo-items">
                        <div>강사신청</div>
                        <span>${map.teacherRequestCnt}</span>
                    </a>
                    <a href="/el/admin/member/corporate/list?pno=1&category=status_yn&keyword=N" class="todo-items">
                        <div>기업신청</div>
                        <span>${map.corpRequestCnt}</span>
                    </a>
                    <a href="/el/admin/request/list?pno=1&category=check_yn&keyword=N" class="todo-items">
                        <div>요청</div>
                        <span>${map.requestCnt}</span>
                    </a>
                    <a href="/el/admin/report/list?pno=1&category=handle_yn&keyword=N" class="todo-items">
                        <div>신고</div>
                        <span>${map.reportCnt}</span>
                    </a>

                </div>
                <div class="stats-area">
                    <div class="chart-area">
                        <div>회원별 연령대</div>
                        <canvas class="chart" id="pieChart" width="500" height="500"></canvas>
                    </div>
                    <div class="chart-area">
                        <div class="chart-top">
                            <div></div>
                            <div>카테고리별 인기 강의</div>
                            <select name="category" id="category">
                                <option value="1">드로잉</option>
                                <option value="2">요리/베이킹</option>
                                <option value="3">운동</option>
                                <option value="4">음악</option>
                                <option value="5">IT</option>
                                <option value="6">언어</option>
                                <option value="7">금융/제테크</option>
                            </select>
                        </div>
                        <canvas class="chart" id="barChart"  width="500" height="500"></canvas>
                    </div>

                </div>
            </div>
        </main>
    </div>
    <script>
        const pieCtx = document.getElementById('pieChart').getContext('2d');
        // const pieChart = new Chart(pieCtx, {
        //     type: 'pie',
        //     data: {
        //         labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple'],
        //         datasets: [{
        //             label: '# of Votes',
        //             data: [39, 19, 3, 5, 2],
        //             backgroundColor: [
        //                 'rgba(255, 99, 132, 0.2)',
        //                 'rgba(54, 162, 235, 0.2)',
        //                 'rgba(255, 206, 86, 0.2)',
        //                 'rgba(75, 192, 192, 0.2)',
        //                 'rgba(153, 102, 255, 0.2)',
        //                 'rgba(255, 159, 64, 0.2)'
        //             ],
        //             borderColor: [
        //                 'rgba(255, 99, 132, 1)',
        //                 'rgba(54, 162, 235, 1)',
        //                 'rgba(255, 206, 86, 1)',
        //                 'rgba(75, 192, 192, 1)',
        //                 'rgba(153, 102, 255, 1)',
        //                 'rgba(255, 159, 64, 1)'
        //             ],
        //             borderWidth: 1
        //         }]
        //     },
        //     options: {
        //         scales: {
        //             y: {
        //                 beginAtZero: true
        //             }
        //         }
        //     }
        // });

        // const barCtx = document.getElementById('barChart').getContext('2d');
        // const barChart = new Chart(barCtx, {
        //     type: 'bar',
        //     data: {
        //         labels: ['원드래곤의 스프링 기초편', '원드래곤의 스프링 기초편', 'Yellow', 'Green', 'Purple'],
        //         datasets: [{
        //             label: 'Best Class',
        //             data: [12, 39, 3, 5, 2],
        //             backgroundColor: [
        //                 'rgba(255, 99, 132, 0.2)',
        //                 'rgba(54, 162, 235, 0.2)',
        //                 'rgba(255, 206, 86, 0.2)',
        //                 'rgba(75, 192, 192, 0.2)',
        //                 'rgba(153, 102, 255, 0.2)',
        //                 'rgba(255, 159, 64, 0.2)'
        //             ],
        //             borderColor: [
        //                 'rgba(255, 99, 132, 1)',
        //                 'rgba(54, 162, 235, 1)',
        //                 'rgba(255, 206, 86, 1)',
        //                 'rgba(75, 192, 192, 1)',
        //                 'rgba(153, 102, 255, 1)',
        //                 'rgba(255, 159, 64, 1)'
        //             ],
        //             borderWidth: 1
        //         }]
        //     },
        //     options: {
        //         scales: {
        //             y: {
        //                 beginAtZero: true
        //             }
        //         }
        //     }
        // });

        $(document).ready(function(){
            getPieChart();
        });

        function getPieChart(){
            let ageList = [];
            let cntList = [];

            $.ajax({
                url : "/el/admin/dashboard/age-chart",
                method : "get",
                success : function(data){
                    const list = JSON.parse(data);;

                    for(let i = 0; i < list.length; i++){
                        ageList.push(list[i].label + "대");
                        cntList.push(list[i].data);
                    }

                    console.log(ageList);
                    console.log(cntList);


                    // 그래프
                    new Chart(pieCtx, {
                    type: 'pie',
                    data: {
                        labels: ageList,
                        datasets: [{
                            label: '회원 수',
                            data: cntList,
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
                },
                error : function(){
                    alert("파이 통신 실패");
                }
            });
        }
    </script>
</body>
</html>