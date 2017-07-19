<!-- 이동식 마커와 설명 코드 **사이드바 삭제 버젼** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
    <title>CSS Tutorial | Layout</title>
    <style>
    .map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
	.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
	.map_wrap {position:relative;width:100%;height:500px;}
	#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
	.bg_white {background:#fff;}
	#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
	#menu_wrap .option{text-align: center;}
	#menu_wrap .option p {margin:10px 0;}  
	#menu_wrap .option button {margin-left:5px;}
	#placesList li {list-style: none;}
	#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
	#placesList .item span {display: block;margin-top:4px;}
	#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	#placesList .item .info{padding:10px 0 10px 55px;}
	#placesList .info .gray {color:#8a8a8a;}
	#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
	#placesList .info .tel {color:#009900;}
	#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
	#placesList .item .marker_1 {background-position: 0 -10px;}
	#placesList .item .marker_2 {background-position: 0 -56px;}
	#placesList .item .marker_3 {background-position: 0 -102px}
	#placesList .item .marker_4 {background-position: 0 -148px;}
	#placesList .item .marker_5 {background-position: 0 -194px;}
	#placesList .item .marker_6 {background-position: 0 -240px;}
	#placesList .item .marker_7 {background-position: 0 -286px;}
	#placesList .item .marker_8 {background-position: 0 -332px;}
	#placesList .item .marker_9 {background-position: 0 -378px;}
	#placesList .item .marker_10 {background-position: 0 -423px;}
	#placesList .item .marker_11 {background-position: 0 -470px;}
	#placesList .item .marker_12 {background-position: 0 -516px;}
	#placesList .item .marker_13 {background-position: 0 -562px;}
	#placesList .item .marker_14 {background-position: 0 -608px;}
	#placesList .item .marker_15 {background-position: 0 -654px;}
	#pagination {margin:10px auto;text-align: center;}
	#pagination a {display:inline-block;margin-right:10px;}
	#pagination .on {font-weight: bold; cursor: default;color:#777;}
    
      #jb-container {
        width: 940px;
        margin: 0px auto;
        padding: 20px;
        border: 1px solid #bcbcbc;
      }
      #jb-header {
      	background-color:#ebeef3;
        padding: 10px;
        text-align: center;
        margin-bottom: 10px;
        border: 1px solid #bcbcbc;
      }
      #jb-content {
        width: 900px;
        padding: 20px;
        margin-bottom: 20px;
        border: 0px solid #bcbcbc;
      }
      #jb-footer {
     	background-color:#f9fafc;
        clear: both;
        padding: 10px;
        border: 1px solid #bcbcbc;
      }
      a.no-uline { text-decoration:none }
    </style>
  </head>
  <body>	
  		<div class="menu_area" style="text-align:right;">
		<a class="normal" href="toiletlogin.jsp">로그인</a>
		<a class="normal" href="join.jsp">회원가입</a>
		<a class="normal" href="memberIdAndPw.jsp">아이디/비밀번호 찾기</a>
</div>
    <div id="jb-container">
      <div id="jb-header">
		<h3>tOilet</h3>
      </div>
    <div id="jb-content">
      	<div class="map_wrap">
    	<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    	<div id="menu_wrap" class="bg_white">
       <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                   	부산광역시 : <select name='division'>
		    		<option value='' selected>-- 구 --</option>
		    		<option value='gangseo'>강서구</option>
		    		<option value='geumjeong'>금정구</option>
		    		<option value='gijang'>기장군</option>
		    		<option value='south'>남구</option>
		    		<option value='east'>동구</option>
		    		<option value='dongrae'>동래구</option>
		    		<option value='busanjin'>부산진구</option>
		    		<option value='north'>북구</option>
		    		<option value='sasang'>사상구</option>
		    		<option value='saha'>사하구</option>
		    		<option value='west'>서구</option>
		    		<option value='suyeong'>수영구</option>
		    		<option value='yeonje'>연제구</option>
		    		<option value='central'>중구</option>
		    		<option value='youngdo'>영도구</option>
		    		<option value='haeundae'>해운대구</option>
                    </form> 
                
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    	</div>
	</div>
      

		<script src="//apis.daum.net/maps/maps3.js?apikey=24780e4341802fb5886463b2df20361f&libraries=services" type="text/javascript"></script>
		<script>
		var markers =[];
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    	mapOption = {
        center: new daum.maps.LatLng(35.2351536, 129.082684), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    	};  

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new daum.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		
		var positions = [
		    {
		        title: '자연대 연구실험동', 
		        latlng: new daum.maps.LatLng(35.2351536, 129.082684)
		    },
		    {
		        title: '제2도서관', 
		        latlng: new daum.maps.LatLng(35.2357536, 129.081384)
		    }
		];

		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "marker.png"; 
		    
		for (var i = 0; i < positions.length; i ++) {
		    
		// 마커 이미지의 이미지 크기 입니다
		var imageSize = new daum.maps.Size(60, 60); 
		   
		// 마커 이미지를 생성합니다    
		var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
		    
		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		    map: map, // 마커를 표시할 지도
		    position: positions[i].latlng, // 마커를 표시할 위치
		    title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		    image : markerImage // 마커 이미지 
		 	 });
			}

		// 장소 검색 객체를 생성합니다
		var ps = new daum.maps.services.Places();  
	
		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new daum.maps.InfoWindow({zIndex:1});
	
		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(status, data, pagination) {
	   		if (status === daum.maps.services.Status.OK) {
	
	    // 정상적으로 검색이 완료됐으면
	    // 검색 목록과 마커를 표출합니다
	    displayPlaces(data.places);
	
	    // 페이지 번호를 표출합니다
	    displayPagination(pagination);
	
	    } else if (status === daum.maps.services.Status.ZERO_RESULT) {
	
	        alert('검색 결과가 존재하지 않습니다.');
	        return;
	
	    } else if (status === daum.maps.services.Status.ERROR) {
	
	        alert('검색 결과 중 오류가 발생했습니다.');
	        return;
	
	    }
	}
	
		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {
	
	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new daum.maps.LatLngBounds(), 
	    listStr = '';
	    
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);
	
	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    for ( var i=0; i<places.length; i++ ) {
	
	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
	            marker = addMarker(placePosition, i), 
	            itemEl = getListItem(i, places[i], marker); // 검색 결과 항목 Element를 생성합니다
	
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);
	
	        // 마커와 검색결과 항목에 mouseover 했을때
	        // 해당 장소에 인포윈도우에 장소명을 표시합니다
	        // mouseout 했을 때는 인포윈도우를 닫습니다
	        (function(marker, title) {
	            daum.maps.event.addListener(marker, 'mouseover', function() {
	                displayInfowindow(marker, title);
	            });
	
	            daum.maps.event.addListener(marker, 'mouseout', function() {
	                infowindow.close();
	            });
	
	            itemEl.onmouseover =  function () {
	                displayInfowindow(marker, title);
	            };
	
	            itemEl.onmouseout =  function () {
	                infowindow.close();
	            };
	        })(marker, places[i].title);
	
	        fragment.appendChild(itemEl);
	    }
	
	    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;
	
	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    map.setBounds(bounds);
	}
	
		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {
	
	    var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' +
	                '   <h5>' + places.title + '</h5>';
	
	    if (places.newAddress) {
	        itemStr += '    <span>' + places.newAddress + '</span>' +
	                    '   <span class="jibun gray">' +  places.address  + '</span>';
	    } else {
	        itemStr += '    <span>' +  places.address  + '</span>'; 
	    }
                 
	      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
	                '</div>';           
	
	    el.innerHTML = itemStr;
	    el.className = 'item';
	
	    return el;
	}
		
		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
		    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
	     	    imgOptions =  {
	            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new daum.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });
	
	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	
	    return marker;
	}
	
		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
		}
	
		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
	    var paginationEl = document.getElementById('pagination'),
	        fragment = document.createDocumentFragment(),
	        i; 
	
	    // 기존에 추가된 페이지번호를 삭제합니다
	    while (paginationEl.hasChildNodes()) {
	        paginationEl.removeChild (paginationEl.lastChild);
	    }
	
	    for (i=1; i<=pagination.last; i++) {
	        var el = document.createElement('a');
	        el.href = "#";
	        el.innerHTML = i;
	
	        if (i===pagination.current) {
	            el.className = 'on';
	        } else {
	            el.onclick = (function(i) {
	                return function() {
	                    pagination.gotoPage(i);
	                }
	            })(i);
	        }
	
	        fragment.appendChild(el);
	    }
	    paginationEl.appendChild(fragment);
	}
	
		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
	
	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}
	
	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}
	</script>
      </div>
      
      <div id="jb-footer">
         <div align="right"><img src ="toilet door.png" height=240px;> </p>
      </div>
    </div>
  </body>
</html>
