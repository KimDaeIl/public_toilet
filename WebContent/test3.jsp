p<!-- ���� �����ͼ� �̿��� Ű���� �˻� < �λ��� ȭ��� > -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
    <title>CSS Tutorial | Layout</title>
    <style>
    .map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'����',sans-serif;font-size:12px;}
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
        margin-bottom: 10px;
        border: 1px solid #bcbcbc;
      }
      #jb-content {
        width: 900px;
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #bcbcbc;
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
  		<p align="right"><a href = "#" style="text-decoration:none">�α���</a> &nbsp;&nbsp;
		<a href = "#" style="text-decoration:none">ID/PW ã��</a>&nbsp;&nbsp;
		<a href = "#" style="text-decoration:none">ȸ�� ���</a>&nbsp;</TH>
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
                    Ű���� : <input type="text" value="�λ��� ȭ���" id="keyword" size="15"> 
                    <button type="submit">�˻��ϱ�</button> 
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
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    	mapOption = {
        center: new daum.maps.LatLng(35.2351536, 129.082684), // ������ �߽���ǥ
        level: 3 // ������ Ȯ�� ����
    	};  

		// ������ �����մϴ�    
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		// �Ϲ� ������ ��ī�̺�� ���� Ÿ���� ��ȯ�� �� �ִ� ����Ÿ�� ��Ʈ���� �����մϴ�
		var mapTypeControl = new daum.maps.MapTypeControl();

		// ������ ��Ʈ���� �߰��ؾ� �������� ǥ�õ˴ϴ�
		// daum.maps.ControlPosition�� ��Ʈ���� ǥ�õ� ��ġ�� �����ϴµ� TOPRIGHT�� ������ ���� �ǹ��մϴ�
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

		// ���� Ȯ�� ��Ҹ� ������ �� �ִ�  �� ��Ʈ���� �����մϴ�
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

		// ��� �˻� ��ü�� �����մϴ�
		var ps = new daum.maps.services.Places();  
	
		// �˻� ��� ����̳� ��Ŀ�� Ŭ������ �� ��Ҹ��� ǥ���� ���������츦 �����մϴ�
		var infowindow = new daum.maps.InfoWindow({zIndex:1});
	
		// Ű����� ��Ҹ� �˻��մϴ�
		searchPlaces();
	
		// Ű���� �˻��� ��û�ϴ� �Լ��Դϴ�
		function searchPlaces() {
	
	    var keyword = document.getElementById('keyword').value;
	
	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('Ű���带 �Է����ּ���!');
	        return false;
	    }
	
	    // ��Ұ˻� ��ü�� ���� Ű����� ��Ұ˻��� ��û�մϴ�
	    ps.keywordSearch(keyword, placesSearchCB); 
		}
	
		// ��Ұ˻��� �Ϸ���� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
		function placesSearchCB(status, data, pagination) {
	   		if (status === daum.maps.services.Status.OK) {
	
	        // ���������� �˻��� �Ϸ������
	        // �˻� ��ϰ� ��Ŀ�� ǥ���մϴ�
	        displayPlaces(data.places);
	
	        // ������ ��ȣ�� ǥ���մϴ�
	        displayPagination(pagination);
	
	    } else if (status === daum.maps.services.Status.ZERO_RESULT) {
	
	        alert('�˻� ����� �������� �ʽ��ϴ�.');
	        return;
	
	    } else if (status === daum.maps.services.Status.ERROR) {
	
	        alert('�˻� ��� �� ������ �߻��߽��ϴ�.');
	        return;
	
	    }
	}
	
		// �˻� ��� ��ϰ� ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
		function displayPlaces(places) {
	
	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new daum.maps.LatLngBounds(), 
	    listStr = '';
	    
	    // �˻� ��� ��Ͽ� �߰��� �׸���� �����մϴ�
	    removeAllChildNods(listEl);
	
	    // ������ ǥ�õǰ� �ִ� ��Ŀ�� �����մϴ�
	    removeMarker();
	    
	    for ( var i=0; i<places.length; i++ ) {
	
	        // ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
	        var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
	            marker = addMarker(placePosition, i), 
	            itemEl = getListItem(i, places[i], marker); // �˻� ��� �׸� Element�� �����մϴ�
	
	        // �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
	        // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
	        bounds.extend(placePosition);
	
	        // ��Ŀ�� �˻���� �׸� mouseover ������
	        // �ش� ��ҿ� ���������쿡 ��Ҹ��� ǥ���մϴ�
	        // mouseout ���� ���� ���������츦 �ݽ��ϴ�
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
	
	    // �˻���� �׸���� �˻���� ��� Elemnet�� �߰��մϴ�
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;
	
	    // �˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
	    map.setBounds(bounds);
	}
	
		// �˻���� �׸��� Element�� ��ȯ�ϴ� �Լ��Դϴ�
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
		
		// ��Ŀ�� �����ϰ� ���� ���� ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
		function addMarker(position, idx, title) {
		    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // ��Ŀ �̹��� url, ��������Ʈ �̹����� ���ϴ�
		    	imageSize = new daum.maps.Size(60, 60),  // ��Ŀ �̹����� ũ��
	     	    imgOptions =  {
	            spriteSize : new daum.maps.Size(36, 691), // ��������Ʈ �̹����� ũ��
	            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // ��������Ʈ �̹��� �� ����� ������ �»�� ��ǥ
	            offset: new daum.maps.Point(13, 37) // ��Ŀ ��ǥ�� ��ġ��ų �̹��� �������� ��ǥ
	        },
	        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new daum.maps.Marker({
	            position: position, // ��Ŀ�� ��ġ
	            image: markerImage 
	        });
	
	    marker.setMap(map); // ���� ���� ��Ŀ�� ǥ���մϴ�
	    markers.push(marker);  // �迭�� ������ ��Ŀ�� �߰��մϴ�
	
	    return marker;
	}
	
		// ���� ���� ǥ�õǰ� �ִ� ��Ŀ�� ��� �����մϴ�
		function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
		}
	
		// �˻���� ��� �ϴܿ� ��������ȣ�� ǥ�ô� �Լ��Դϴ�
		function displayPagination(pagination) {
	    var paginationEl = document.getElementById('pagination'),
	        fragment = document.createDocumentFragment(),
	        i; 
	
	    // ������ �߰��� ��������ȣ�� �����մϴ�
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
	
		// �˻���� ��� �Ǵ� ��Ŀ�� Ŭ������ �� ȣ��Ǵ� �Լ��Դϴ�
		// ���������쿡 ��Ҹ��� ǥ���մϴ�
		function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
	
	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}
	
	 // �˻���� ����� �ڽ� Element�� �����ϴ� �Լ��Դϴ�
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}
	</script>
      </div>
      <div id="jb-footer">
         <div align="right"><img src ="toilet door.png" height=120px;> </p>
      </div>
    </div>
  </body>
</html>