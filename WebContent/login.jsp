<!-- 이동식 마커와 설명 코드 **사이드바 삭제 버젼** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>CSS Tutorial | Layout</title>
<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
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
	margin: 120px auto 0 auto;
	padding: 20px;
	border: 1px solid #bcbcbc;
}

#jb-header {
	background-color: #ebeef3;
	padding: 10px;
	text-align: center;
	margin-bottom: 10px;
	border: 1px solid #bcbcbc;
}

#jb-content {
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

body, html {
	height: 100%;
	margin: 0;
	padding: 0;
}

body {
	background-image: url('img/back.jpg');
}

#container {
	height: 100%;
	position: relative;
}

#wrapper {
	margin: 0 auto;
	padding: 10%;
	vertical-align: middle;
	width: 40%;
	background-color: rgba(211, 211, 211, .8);
}

.content {
	margin: 0 auto;
	width: 98%;
	height: 5%;
	margin-top: 2px;
	margin-bottom: 2px;
	padding: 1%;
}

.border {
	border: 2px solid rgba(50, 40, 58, .7);
}

input {
	box-shadow: none;
}

.input {
	font-size: 1.3em;
	height: 100%;
	width: 80%;
	border: none;
	font-weight: bold;
}

input::-webkit-input-placeholder {
	color: rgba(50, 40, 58, .5);
}

.input_back_color {
	background-color: rgba(0, 0, 0, 0);
}
</style>
</head>
<body>
	<div id="jb-container">
		<div id="jb-content">
			<div id="container">
				<div id="wrapper">
					<div style="text-align: center;">
						<h1>Toilet!!</h1>
					</div>
					<form action="member?action=login" method="post">
						<div class="content border">
							<img src="img/login.png"
								style="margin-left: 8px; max-width: 100%; height: auto;" /> <input
								class="input input_back_color" style="padding-left: 10px;"
								type="text" name="member_id" placeholder="ID" autofocus/>
						</div>
						<div class="content border">
							<img src="img/pw.png" style="margin-left: 8px;" /> <input
								class="input input_back_color" style="padding-left: 10px;"
								type="password" name="member_pw" placeholder="PASSWORD" />
						</div>
						<div style="margin: 32px 0 8px 0;">
							<a href="javascript:alert('All reason.')"
								style="font-style: none; font-size: 0.5em; font-weight: bold; color: black; margin-bottom: 10px;">no
								login?</a>
						</div>
						<div class="border_none" style="height: 7%;">
							<input type="submit"
								style="width: 100%; height: 100%; padding-top: 12px; padding-bottom: 12px; background-color: rgba(50, 40, 58, .8); color: white; border: 0; font-weight: bold; font-size: 1em"
								value="Login">
							</button>
						</div>
					</form>


				</div>
			</div>
</body>
</html>
