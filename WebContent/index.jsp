<!-- ���� �����ͼ� �̿��� Ű���� �˻� < �λ��� ȭ��� > -->

<%@page import="work.model.dto.Member"%>
<%@page import="work.Util.Util"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>CSS Tutorial | Layout</title>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>

<!-- Plugin CSS -->
<link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

<!-- Theme CSS -->
<link href="css/creative.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '����', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}

#jb-container {
	width: 940px;
	margin: 0px auto;
	padding: 20px;
	border: 1px solid #bcbcbc;
}

#jb-header {
	background-color: #ebeef3;
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
	background-color: #f9fafc;
	clear: both;
	padding: 10px;
	border: 1px solid #bcbcbc;
}

a.no-uline {
	text-decoration: none
}
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function makeCity() {

		$.ajax({
			type : "post",
			url : "toilet",
			data : {
				"action" : "getCities"
			},
			timeout : 5000,
			dataType : "json",
			success : function(args) {
				console.log(args);
				updateCitySeclt(args);
			},
			error : function(request, status, error) {

				if (request.status == "200") {
					alert("no data")
				} else {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			}
		});

	}
	function updateCitySeclt(data) {

		var select = $('#city');
		select.html('');
		select.append("<option value='none'>��</option>");
		for (var i = 0; i < data.length; i++) {
			var obj = data[i];
			var option = "<option value='";
		option+=obj.id;
		option +="'>";
			option += obj.name;
			option += "</option>";

			select.append(option);
		}
	}

	function makeBorough(data) {

		if (data == 'none') {
			return;
		}

		$.ajax({
			type : "post",
			url : "toilet",
			data : {
				"action" : "getBoroughs",
				"city" : data
			},
			timeout : 5000,
			dataType : "json",
			success : function(args) {
				updateBoroughSelect(args);
			},
			error : function(request, status, error) {

				if (request.status == "200") {
					alert("no data")
				} else {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			}
		});
	}

	function updateBoroughSelect(data) {
		var select = $('#borough');
		select.html('');
		select.append("<option value='none'>��</option>");
		for (var i = 0; i < data.length; i++) {
			var obj = data[i];
			var option = "<option value='";
			option+=obj.id;
			option +="'>";
			option += obj.name;
			option += "</option>";

			select.append(option);
		}
	}

	function display(data) {
		if (data == 'none') {
			return;
		}

		$.ajax({
			type : "post",
			url : "toilet",
			data : {
				"action" : "getToilets",
				"gu" : data
			},
			timeout : 5000,
			dataType : "json",
			success : function(args) {
				displayPlaces(args);

				console.log(args);
			},
			error : function(request, status, error) {

				if (request.status == "200") {
					alert("no data")
				} else {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			}
		});

	}

	window.onload = function() {
		makeCity();

	}
</script>

</head>
<body id="page-top">

	<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> Menu <i
					class="fa fa-bars"></i>
			</button>
			<a class="navbar-brand page-scroll" href="#page-top">ȭ��� �˻� ����
				���̷�!</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<%
					Member member = (Member) session.getAttribute("member");
					if (Util.isNull(member)) {
				%>
				<li><a class="page-scroll" href="login.jsp">�α���</a></li>
				<li><a class="page-scroll" href="signup.jsp">ȸ������</a></li>
				<%
					} else {
				%>
				<li><a class="page-scroll" href=member?action=logout
					style="text-decoration: none">�α׾ƿ�</a></li>
				<li><a class="page-scroll" href="bye.jsp"
					style="text-decoration: none">Ż��</a></li>
				<%
					}
				%>
				<li><a class="page-scroll" href="#services">��ɼҰ�</a></li>
				<li><a class="page-scroll" href="#contact">Contact</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

	<header>
	<div class="header-content">
		<div class="header-content-inner">
			<div class="map_wrap">
				<div id="map"
					style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

				<div id="menu_wrap" class="bg_white">
					<div class="option">
						<div>
							<!--                 <form onsubmit="searchPlaces(); return false;"> -->
							<!--                     Ű���� : <input type="text" value="�λ��� ȭ���" id="keyword" size="15">  -->
							<!--                     <button type="submit">�˻��ϱ�</button>  -->
							<!--                 </form> -->
							<select id="city" onchange="makeBorough(this.value)"
								style="width: 45%;"></select> <select id="borough"
								onchange="display(this.value)" style="width: 45%;"></select>
						</div>
					</div>
					<hr>
					<ul id="placesList"></ul>
					<div id="pagination"></div>
				</div>
			</div>



		</div>

		<script
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=37c8f95512dbf41c55bbcd9e4c59dac2&libraries=services"
			type="text/javascript"></script>
		<script>
			var markers = [];
			var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
			mapOption = {
				center : new daum.maps.LatLng(35.2351536, 129.082684), // ������ �߽���ǥ
				level : 3
			// ������ Ȯ�� ����
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
			var infowindow = new daum.maps.InfoWindow({
				zIndex : 1
			});

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

				var listEl = document.getElementById('placesList'), menuEl = document
						.getElementById('menu_wrap'), fragment = document
						.createDocumentFragment(), bounds = new daum.maps.LatLngBounds(), listStr = '';

				// �˻� ��� ��Ͽ� �߰��� �׸���� �����մϴ�
				removeAllChildNods(listEl);

				// ������ ǥ�õǰ� �ִ� ��Ŀ�� �����մϴ�
				removeMarker();

				for (var i = 0; i < places.length; i++) {

					// ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
					var placePosition = new daum.maps.LatLng(places[i].lat,
							places[i].lon), marker = addMarker(placePosition, i), itemEl = getListItem(
							i, places[i], marker); // �˻� ��� �׸� Element�� �����մϴ�

					// �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
					// LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
					bounds.extend(placePosition);

					// ��Ŀ�� �˻���� �׸� mouseover ������
					// �ش� ��ҿ� ���������쿡 ��Ҹ��� ǥ���մϴ�
					// mouseout ���� ���� ���������츦 �ݽ��ϴ�

					(function(marker, place) {
						daum.maps.event.addListener(marker, 'mouseover',
								function() {
									displayInfowindow(marker, place);
								});

						daum.maps.event.addListener(marker, 'mouseout',
								function() {
									infowindow.close();
								});

						daum.maps.event
								.addListener(
										marker,
										'click',
										function() {
		<%if (Util.isNull(member)) {%>
			window.location.href = "review?action=getReviews&toiletNum="
													+ place.id;
		<%} else {%>
			window.location.href = "review?action=getReviews&toiletNum="
													+ place.id
													+ "&memberId="
													+
		<%=member.getId()%>
			;
		<%}%>
			});

						itemEl.onmouseover = function() {
							displayInfowindow(marker, title);
						};

						itemEl.onmouseout = function() {
							infowindow.close();
						};
					})(marker, places[i]);

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

				var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
						+ (index + 1)
						+ '"></span>'
						+ '<div class="info">'
						+ '   <h5>' + places.name + '</h5>';

				itemStr += '    <span>' + places.cityName + ' '
						+ places.boroughName + '</span>';

				if (places.phone != "null") {
					itemStr += '  <span class="tel">' + places.phone
							+ '</span>' + '</div>';
				} else if (places.phone2 != "null") {
					itemStr += '  <span class="tel">' + places.phone2
							+ '</span>' + '</div>';
				} else {
					itemStr += '  <span class="tel">' + +'</span>' + '</div>';
				}

				el.innerHTML = itemStr;
				el.className = 'item';

				return el;
			}

			// ��Ŀ�� �����ϰ� ���� ���� ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
			function addMarker(position, idx, title) {
				var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // ��Ŀ �̹��� url, ��������Ʈ �̹����� ���ϴ�
				imageSize = new daum.maps.Size(36, 37), // ��Ŀ �̹����� ũ��
				imgOptions = {
					spriteSize : new daum.maps.Size(36, 691), // ��������Ʈ �̹����� ũ��
					spriteOrigin : new daum.maps.Point(0, (idx * 46) + 10), // ��������Ʈ �̹��� �� ����� ������ �»�� ��ǥ
					offset : new daum.maps.Point(13, 37)
				// ��Ŀ ��ǥ�� ��ġ��ų �̹��� �������� ��ǥ
				}, markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
						imgOptions), marker = new daum.maps.Marker({
					position : position, // ��Ŀ�� ��ġ
					image : markerImage
				});

				marker.setMap(map); // ���� ���� ��Ŀ�� ǥ���մϴ�
				markers.push(marker); // �迭�� ������ ��Ŀ�� �߰��մϴ�

				return marker;
			}

			// ���� ���� ǥ�õǰ� �ִ� ��Ŀ�� ��� �����մϴ�
			function removeMarker() {
				for (var i = 0; i < markers.length; i++) {
					markers[i].setMap(null);
				}
				markers = [];
			}

			// �˻���� ��� �ϴܿ� ��������ȣ�� ǥ�ô� �Լ��Դϴ�
			function displayPagination(pagination) {
				var paginationEl = document.getElementById('pagination'), fragment = document
						.createDocumentFragment(), i;

				// ������ �߰��� ��������ȣ�� �����մϴ�
				while (paginationEl.hasChildNodes()) {
					paginationEl.removeChild(paginationEl.lastChild);
				}

				for (i = 1; i <= pagination.last; i++) {
					var el = document.createElement('a');
					el.href = "#";
					el.innerHTML = i;

					if (i === pagination.current) {
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
			function displayInfowindow(marker, place) {
				var content = '<div style="padding:5px;z-index:1;"><h3>'
						+ place.name;

				if (place.openTime != 'null') {
					content += '</h3>' + place.openTime + '<br/></div>';

				} else {
					content += '</h3><br/></div>';

				}

				infowindow.setContent(content);
				infowindow.open(map, marker);
			}

			// �˻���� ����� �ڽ� Element�� �����ϴ� �Լ��Դϴ�
			function removeAllChildNods(el) {
				while (el.hasChildNodes()) {
					el.removeChild(el.lastChild);
				}
			}
		</script>
	</div>
	</div>
	</header>

	<section id="services">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2 class="section-heading">���̷��� ������</h2>
				<hr class="primary">
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-6 text-center">
				<div class="service-box">
					<img style="width: 80px;" src="img/running.png">
					<h3>ȭ��� �˻�</h3>
					<p class="text-muted">�߿ܿ��� ȭ��� �빫�� ���� �е鿡�� �α� ����ȭ��� ���� ����</p>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 text-center">
				<div class="service-box">
					<img style="width: 60px;" src="img/wheelchair.png">
					<h3>����� ���� ȭ��� �˻�</h3>
					<p class="text-muted">ȭ��� �̿뿡 ������ �޴� ����ε鿡�� ����� ���� ȭ��� ���� ����</p>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 text-center">
				<div class="service-box">
					<img style="width: 60px;" src="img/children.png">
					<h3>��̿� ȭ��� �˻�</h3>
					<p class="text-muted">� ���̰� ȭ��� �̿� ���ϵ��� ��̿� ���� ��ġ ȭ��� �˻�</p>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 text-center">
				<div class="service-box">
					<i class="fa fa-4x fa-heart text-primary sr-icons"></i>
					<h3>ȭ��� �̿� �ı�� ��</h3>
					<p class="text-muted">�ش� ȭ����� ���並 ����ڵ��� ���������ν� ����ڵ鿡�� �پ��� ������
						����</p>
				</div>
			</div>
		</div>
	</div>
	</section>

	<section id="contact">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 text-center">
				<h2 class="section-heading">ȭ��� ���� �˻� ���� ���̷�!</h2>
				<hr class="primary">
				<p>Copyright�� 6 Team</p>
			</div>
			<div class="col-lg-4 col-lg-offset-2 text-center">
				<i class="fa fa-phone fa-3x sr-contact"></i>
				<p>��ǥ : 010-4197-0925</p>
			</div>
			<div class="col-lg-4 text-center">
				<i class="fa fa-envelope-o fa-3x sr-contact"></i>
				<p>
					<a href="mailto:your-email@your-domain.com">qatta24@naver.com</a>
				</p>
			</div>
		</div>
	</div>
	</section>

	<!-- jQuery -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="vendor/scrollreveal/scrollreveal.min.js"></script>
	<script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

	<!-- Theme JavaScript -->
	<script src="js/creative.min.js"></script>
</body>
</html>
