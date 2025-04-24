<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>금주 분양 매물 정보</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/week_tails.css?v=1">
<style>
#map {
  height: 100%;
}
</style>
</head>
<cr:if test="${not empty msg}">
        <script type="text/javascript">
        console.log("${msg}")
            alert("${msg}");
        </script>
</cr:if>
</head>
<body>
<!-- top -->
<cr:import url="./top.jsp"></cr:import>




<main>
<!-- week_tails -->
	<div class="weektails">
		<p>분양정보</p>
		<div id="weektails">
			<p>${pidx_list.pname}</p>
            <ul>
                <li>종류</li>
                <li>${pidx_list.ptype} | ${pidx_list.psalsetype} </li>
                <li>주소</li>
				<li>${pidx_list.paddress}</li>
                <li>규모</li>
				<li>총 ${pidx_list.punit}세대 | 총 ${pidx_list.pblocks}개동</li>
                <li>시기</li>
				<li>${pidx_list.psaledate} | ${pidx_list.pmoveindate}</li>
                <li>난방구조</li>
				<li>${pidx_list.pheating}</li>
                <li>건설사</li>
				<li>${pidx_list.pbuilder}</li>
                <li>사진정보</li>
				<li><img src="./room/${pidx_list.pmig}"></li>
            </ul>
		</div>
		<div id="map" style="position: relative; overflow: hidden;">
		<cr:choose>
		<cr:when test="${count == 0}">
        <div><button class="btn_css" onclick="reservation()">방문예약</button></div>
        <form action="./reservation.do" method="POST" id="frm">
        <input type="hidden" name="pidx" value="${pidx_list.pidx}">
        <input type="hidden" name="pname" value="${pidx_list.pname}">
       	</form>
       	</cr:when>
  		<cr:when test="${not empty count}">
	    <div><button class="btn_close">방문예약완료</button></div>
	    </cr:when>
		</cr:choose>
	</div>
<!-- week_tails -->
</main>

<!--copyright  -->
<cr:import url="./copyright.jsp"></cr:import>

</body>
<script>
function reservation() {
	frm.submit()
}
</script>

<!-- Google Maps API -->
<script>
// 지도를 초기화하고 주소를 기반으로 위치 표시
async function initMap() {
  // JSTL 변수를 JavaScript 변수로 가져오기
  const propertyAddress = "${pidx_list.paddress}";
  const propertyName = "${pidx_list.pname}";
  
  // 지도 초기화 (한국 중심)
  const map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: 37.5665, lng: 126.9780 }, // 서울 중심 좌표
    zoom: 15,
    mapId: "DEMO_MAP_ID",
  });

  // Places API 라이브러리 로드
  const { Place } = await google.maps.importLibrary("places");
  
  // 주소 검색 요청
  const request = {
    textQuery: propertyAddress,
    fields: ["name", "geometry", "formattedAddress"],
    locationBias: { lat: 37.5665, lng: 126.9780 }, // 한국 중심 좌표 (서울)
    language: 'ko-KR',
    region: 'kr',
  };
  
  try {
    // 위치 검색
    const { places } = await Place.searchByText(request);
    
    if (places && places.length > 0) {
      const place = places[0];
      
      // 지도 중심 이동
      map.setCenter(place.geometry.location);
      
      // 마커 추가
      const marker = new google.maps.Marker({
        position: place.geometry.location,
        map: map,
        title: propertyName
      });
      
      // 정보창 추가
      const infoWindow = new google.maps.InfoWindow({
        content: `
          <div style="padding: 10px; max-width: 200px;">
            <h3 style="margin: 0 0 5px 0;">${propertyName}</h3>
            <p style="margin: 0;">${place.formattedAddress || propertyAddress}</p>
          </div>
        `,
      });
      
      // 마커 클릭시 정보창 표시
      marker.addListener("click", () => {
        infoWindow.open(map, marker);
      });
      
      // 처음에 정보창 자동 표시
      infoWindow.open(map, marker);
    } else {
      console.error("주소를 찾을 수 없습니다: " + propertyAddress);
      // 주소를 찾지 못했을 때 대체 메시지 표시
      document.getElementById("map").innerHTML = 
        `<div style="padding: 20px; text-align: center;">
          <p>주소를 찾을 수 없습니다: ${propertyAddress}</p>
        </div>`;
    }
  } catch (error) {
    console.error("지도 로딩 중 오류가 발생했습니다:", error);
    document.getElementById("map").innerHTML = 
      `<div style="padding: 20px; text-align: center;">
        <p>지도를 로드하는 중 오류가 발생했습니다</p>
      </div>`;
  }
}

// 지도 초기화
window.onload = function() {
  initMap();
};
</script>
<!-- Google Maps API 스크립트 -->
<script>(g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})
        ({key: "AIzaSyAnr-QapDVaBFusgAyjqca6jmdIdnvsbIU", v: "weekly"});</script>

</html>