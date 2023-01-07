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
                        <!-- 파이차트 -->
                        <canvas class="chart" id="pieChart" width="420" height="400"></canvas>
                    </div>
                    <div class="chart-area">
                        <div class="chart-top">
                            <div></div>
                            <div>카테고리별 인기 강의</div>
                            <!-- 옵션 태그 바뀔 때 함수 실행 할 수 있게.. -->
                            <select name="category" id="category" onchange="changeChart(this);">
                                <option value="0">전체</option>
                                <option value="1">드로잉</option>
                                <option value="2">요리/베이킹</option>
                                <option value="3">운동</option>
                                <option value="4">음악</option>
                                <option value="5">IT</option>
                                <option value="6">언어</option>
                                <option value="7">금융/제테크</option>
                            </select>
                        </div>
                        <!-- 바차트 -->
                        <canvas class="chart" id="barChart"  width="500" height="450"></canvas>
                    </div>

                </div>
            </div>
        </main>
    </div>
    <script>
        
        // 페이지 띄우자마자 에이잭스 실행
        $(document).ready(function(){
            getPieChart();
            getBarChart();
        });

        function getPieChart(){
    
            let ageList = []; //data에 담아 줄 배열
            let cntList = []; //labels에 담아 줄 배열

            $.ajax({
                url : "/el/admin/dashboard/age-chart",
                method : "get",
                success : function(data){
                    const list = JSON.parse(data);

                    for(let i = 0; i < list.length; i++){
                        ageList.push(list[i].label + "대");
                        cntList.push(list[i].data);
                    }

                    console.log(ageList);
                    console.log(cntList);


                    // 그래프
                    const pieCtx = document.getElementById('pieChart').getContext('2d');
                    pieChart = new Chart(pieCtx, {
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
                        //maintainAspectRatio :false
                    }
                });
                },
                error : function(){
                    alert("파이 통신 실패");
                }
            });
        }

        // chart 내용, 업데이트를 위해 전역변수 선언
        let barChart;       // 바 차트 담아주기


        // 기본 바 차트 (전체)
        function getBarChart(){
            let cntList = [];   // data에 담아 줄 배열                      
            let classList = []; // labels에 담아 줄 배열
            $.ajax({
                url : "/el/admin/dashboard/class-chart",
                method : "get",
                data : { "cateNo" : 0 },
                success : function(data){
                    const list = JSON.parse(data);
                    console.log(list);

                    if(list==null){
                        alert("데이터가 없습니다.");
                    } else {
                            for(let i = 0; i < list.length; i++){
                            cntList.push(list[i].data);
                            classList.push(list[i].label);
                        }
                    }


                    console.log(cntList);
                    console.log(classList);

                    //그래프
                    var barCtx = document.getElementById('barChart').getContext('2d');
                    barChart = new Chart(barCtx, {
                    type: 'bar',
                    data: {
                        labels: classList,
                        datasets: [{
                            label: '학생 수',
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
                       // maintainAspectRatio :false
                    }
                });

                },
                error : function(){
                    alert("바차트 통신 실패");

                }
            });
        }
        // 셀렉트 옵션 바뀌었을 때
        function changeChart(cateNo){
            console.log(cateNo.value);

            let cntList = [];   // 새로운 data에 담아 줄 배열                      
            let classList = []; // 새로운 labels에 담아 줄 배열

            $.ajax({
                url : "/el/admin/dashboard/class-chart",
                method : "get",
                data : { "cateNo" : cateNo.value },
                success : function(data){
                    const list = JSON.parse(data);
                    console.log(list);

                    if(list==null){
                        alert("데이터가 없습니다.");
                    } else {
                            for(let i = 0; i < list.length; i++){
                            cntList.push(list[i].data);
                            classList.push(list[i].label);
                        }
                    }
                    
                    console.log("새로운" + cntList);
                    console.log("새로운" + classList);

                    // 차트에 새로운 데이터 업데이트 해주기
                    //barChart.data.datasets[0].label = 
                    barChart.data.datasets[0].data = cntList;
                    barChart.data.labels = classList;
                    barChart.update();
                
                },
                error : function(){
                    alert('바차트 통신 오류');
                }

            });


 
        }
    </script>
</body>
</html>