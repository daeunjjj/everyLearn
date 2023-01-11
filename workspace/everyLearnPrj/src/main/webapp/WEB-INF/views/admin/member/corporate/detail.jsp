<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리런 - 기업회원</title>
<link rel="stylesheet" href="/el/resources/css/admin/menu.css">
<link rel="stylesheet" href="/el/resources/css/admin/member/corporate/detail.css">
<link rel="stylesheet" href="/el/resources/css/admin/member/common/detail.css">
</head>
<body>
	<div class="wrap">
        <%@include file="/WEB-INF/views/admin/menu.jsp" %>
        <main>
            <h1>기업회원</h1>
            <div id="line"></div>
           	<div class="main-wrap">
                <div class="info-wrap">
                    <h2>기업정보</h2>
                    <div class="info-area">
                        <div class="info-top">
                            <div class="flex-items">
                                <div>기업이름</div>
                                <div>${map.corpMember.companyName }</div>
                            </div>
                            <div class="flex-items">
                                <div>대표자명</div>
                                <div>${map.corpMember.name }</div>
                            </div>
                            <div class="flex-items">
                                <div>직군</div>
                                <div>${map.corpMember.sector }</div>
                            </div>
                            <div class="flex-items">
                                <div>주소</div>
                                <div>${map.corpMember.companyAddress }</div>
                            </div>
                            <div class="flex-items">
                                <div>전화번호</div>
                                <div>${map.corpMember.phone }</div>
                            </div>
                            <div class="flex-items">
                                <div>이메일</div>
                                <div>${map.corpMember.id }</div>
                            </div>
                            <div class="flex-items">
                                <div>사업자번호</div>
                                <div>${map.corpMember.companyNum }</div>
                            </div>
                            <div class="flex-items">
                                <div>직원수</div>
                                <div>${map.corpMember.empNum }</div>
                            </div>
                            <div class="flex-items">
                                <div>연매출</div>
                                <div>${map.corpMember.sales }</div>
                            </div>
                            <div class="flex-items">
                                <div>홈페이지</div>
                                <div>
	                                <a href="${map.corpMember.homepage }" target="_blank">${map.corpMember.homepage }</a>                                
                                </div>
                            </div>
                            <div class="flex-items">
                                <div>회사소개</div>
                                <div>${map.corpMember.introduce}</div>
                            </div>
                        </div>
                        <div class="map-area">
                            <div id="map" style="width:100%;height:100%;"></div>
                        </div>
                    </div>
                   <c:if test="${!empty map.voList }">
	                   <div class="detail-list-wrap">
	                        <h3>채용목록</h3>
	                        <div class="detail-list-area">
	                            <div>직군</div>
	                            <div>제목</div>
	                            <div>마감일</div>
	                            <div>수정날짜</div>
	                            <div>찜개수</div>
	                            <div>관리</div>
	                        </div>
	                        <div>
	                            <ul>
									<c:forEach items="${map.voList }" var="list">
										<li class="detail-list-area">
		                                    <div>${list.category }</div>
		                                    <div>${list.title }</div>
		                                    <div class="deadline">${list.deadline }</div>
		                                    <div>${list.modifyDate}</div>
	                                        <div>${list.wishCnt}</div>
 										<div>
		                                    <form action="/el/admin/member/corporate/emp-board/delete" method="post" onsubmit="return deleteCheck();">
		                                    	<input name="eno" value="${list.no}" hidden>
		                                    	<input name="no" value="${map.corpMember.no}" hidden>
		                                        <c:if test="${list.deleteYN eq 'N' }">
		                                        	<button type="submit">공개중</button>	
		                                        </c:if>
	                                     	    <c:if test="${list.deleteYN eq 'Y' }">
		                                        	<button type="button" disabled="disabled" id="non-click">삭제</button>	
		                                        </c:if>                                      
		                                    </form>
	                                    </div>
		                                </li>
									</c:forEach>
	                            
	                            </ul>
	                        </div>
	                    </div>
                   </c:if>
                    <div class="resume-bottom">
                        <form method="post">
                            <div class="btn-area">
                                <input name="no" value="${map.corpMember.no}" hidden>
							<c:if test="${map.corpMember.deleteYn eq 'N' }">
								<button type="submit" formaction="/el/admin/member/corporate/delete" id="refusal-btn" name="result" value="delete">승인취소</button>
                                <c:if test="${map.corpMember.statusYn eq 'N' }">
                                    <button type="submit" formaction="/el/admin/member/corporate/approval" id="approval-btn" >승인</button>                        
                                </c:if>
							</c:if>
                            </div>
                        </form>
                    </div>
                </div>
           	</div>


        </main>
    </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=398deca262e64e258d8911a7ae6a1fe3&libraries=services"></script>
    <script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };  
    
    // 지도를 생성합니다    
    var map = new kakao.maps.Map(mapContainer, mapOption); 
    
    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();
    
    const address = '${map.corpMember.companyAddress }';
    const name = '${map.corpMember.companyName }';

    // 주소로 좌표를 검색합니다
    geocoder.addressSearch(address, function(result, status) {
    
        // 정상적으로 검색이 완료됐으면 
         if (status === kakao.maps.services.Status.OK) {
    
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    
            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });
    
            // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;">'+name+'</div>'
            });
            infowindow.open(map, marker);
    
            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        } 
    });

    function deleteCheck() {
            
        if(!confirm("정말 삭제하시겠습니까?")){
            return false;
        } else{
            return true;
        }
        
    }

    const status = '${map.corpMember.statusYn}';

    if(status == 'Y'){
        $('#refusal-btn').text('승인취소');
    } else{
        $('#refusal-btn').text('거절');
    }

    </script>
</body>
</html>