<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>StarRating</title>
<style>
.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('img/grade_img.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p1"]{width:15px;z-index:10;}
.star-input>.input>label[for="p2"]{width:30px;z-index:9;}
.star-input>.input>label[for="p3"]{width:45px;z-index:8;}
.star-input>.input>label[for="p4"]{width:60px;z-index:7;}
.star-input>.input>label[for="p5"]{width:75px;z-index:6;}
.star-input>.input>label[for="p6"]{width:90px;z-index:5;}
.star-input>.input>label[for="p7"]{width:105px;z-index:4;}
.star-input>.input>label[for="p8"]{width:120px;z-index:3;}
.star-input>.input>label[for="p9"]{width:135px;z-index:2;}
.star-input>.input>label[for="p10"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:20px; font-size:18px;text-align:right; vertical-align:middle;}

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
	
       #StarRating {
        width: 200px;
        padding: 10px;
        float: left;
      }
       #CommentWrite {
        padding: 10px;
        overflow:hidden;
      }
      #jb-content {
        padding: 10px;
        border: 1px solid #bcbcbc;
      }
      
  
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>
<div id="map" style="width:80%;height:350px;"></div>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=24780e4341802fb5886463b2df20361f&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(35.2351536, 129.082684), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new daum.maps.LatLng(35.2351536, 129.082684); 

// 마커를 생성합니다
var marker = new daum.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 마우스 드래그로 지도 이동 가능여부를 설정합니다
map.setDraggable(false);    


// 마우스 휠로 지도 확대,축소 가능여부를 설정합니다
map.setZoomable(false);    


// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    
</script>

<fieldset>
<legend>상세정보</legend>
</fieldset>

<fieldset>
<legend> 화장실 평가 </legend>
		<div id="StarRating">
			<span class="star-input">
			<span class="input">
	    	<input type="radio" name="star-input" value="1" id="p1">
	    	<label for="p1">1</label>
	    	<input type="radio" name="star-input" value="2" id="p2">
	    	<label for="p2">2</label>
	    	<input type="radio" name="star-input" value="3" id="p3">
	    	<label for="p3">3</label>
	    	<input type="radio" name="star-input" value="4" id="p4">
	    	<label for="p4">4</label>
	    	<input type="radio" name="star-input" value="5" id="p5">
	    	<label for="p5">5</label>
	    	<input type="radio" name="star-input" value="6" id="p6">
	    	<label for="p6">6</label>
	    	<input type="radio" name="star-input" value="7" id="p7">
	    	<label for="p7">7</label>
	    	<input type="radio" name="star-input" value="8" id="p8">
	    	<label for="p8">8</label>
	    	<input type="radio" name="star-input" value="9" id="p9">
	    	<label for="p9">9</label>
	    	<input type="radio" name="star-input" value="10" id="p10">
	    	<label for="p10">10</label>    	
  			</span>
  			<output for="star-input"><b>0</b>점</output>						
			</span>
		</div>
		<div id="CommentWrite">
 			<textarea id="commentParentText" class="form-control col-lg-12" style="width:500px" rows="4"></textarea>
 			<button type="button" id="commentParentSubmit" name="commentParentSubmit" class="btn btn-default">등록</button>
 		</div>	
 		<fieldset style="width:95%">
 		<legend> 목록 </legend>
 		<div id="jb-content">
 		list
		<br>
 		list
		<br>
 		list
 		<br>
 		list
 		<br>
 		list
 		<br>
 		list
 		<br>
 		list
 		<br>
 		list
 		<br>
 		list
 		<br>
 		list
	</div>
	</fieldset>
<script src="js/star.js"></script>
</fieldset>
</body>
</html>