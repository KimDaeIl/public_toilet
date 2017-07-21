<%@page import="work.model.dto.Member"%>
<%@page import="work.Util.Util"%>
<%@page import="work.model.dto.Toilet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="work.model.dto.ReviewList"%>
<%@page import="work.model.dto.Review"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bf547e4161c817404a7363bfb1567e6a&libraries=services"
	type="text/javascript"></script>

</head>

<style>
<!--
* {
	margin: 0;
	padding: 0;
}

ul {
	margin: 0 auto;
	width: 100%;
}

.toilet_info {
	list-style: none;
	display: inline-block;
	margin: 0 auto;
	color: black;
}

.review_item {
	list-style: none;
	/* 	background: white; */
	padding: 4px;
	position: relative;
	float: none;
	border-bottom: 1px dotted gray;
	padding: 16px;
}

a {
	text-decoration: none;
	color: gray;
	font-size: 2em;
	font-weight: bold;
}

.vertical {
	vertical-align: middle;
}
-->
</style>







<style>
.star-input>.input, .star-input>.input>label:hover, .star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
	display: inline-block;
	vertical-align: middle;
	background: url('img/grade_img.png') no-repeat;
}

.star-input {
	display: inline-block;
	white-space: nowrap;
	width: 200px;
	height: 44px;
	margin-top: 16px;
	margin-left: 8px;
}

.star-input>.input {
	display: inline-block;
	width: 150px;
	background-size: 150px;
	height: 28px;
	white-space: nowrap;
	overflow: hidden;
	position: relative;
}

.star-input>.input>input {
	position: absolute;
	width: 1px;
	height: 1px;
	opacity: 0;
}

star-input>.input.focus {
	outline: 1px dotted #ddd;
}

.star-input>.input>label {
	width: 30px;
	height: 0;
	padding: 28px 0 0 0;
	overflow: hidden;
	float: left;
	cursor: pointer;
	position: absolute;
	top: 0;
	left: 0;
}

.star-input>.input>label:hover, .star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
	background-size: 150px;
	background-position: 0 bottom;
}

.star-input>.input>label:hover ~label {
	background-image: none;
}

.star-input>.input>label[for="p1"] {
	width: 15px;
	z-index: 10;
}

.star-input>.input>label[for="p2"] {
	width: 30px;
	z-index: 9;
}

.star-input>.input>label[for="p3"] {
	width: 45px;
	z-index: 8;
}

.star-input>.input>label[for="p4"] {
	width: 60px;
	z-index: 7;
}

.star-input>.input>label[for="p5"] {
	width: 75px;
	z-index: 6;
}

.star-input>.input>label[for="p6"] {
	width: 90px;
	z-index: 5;
}

.star-input>.input>label[for="p7"] {
	width: 105px;
	z-index: 4;
}

.star-input>.input>label[for="p8"] {
	width: 120px;
	z-index: 3;
}

.star-input>.input>label[for="p9"] {
	width: 135px;
	z-index: 2;
}

.star-input>.input>label[for="p10"] {
	width: 150px;
	z-index: 1;
}

.star-input>output {
	display: inline-block;
	width: 20px;
	font-size: 18px;
	text-align: right;
	vertical-align: middle;
}

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

#StarRating {
	width: 200px;
	float: left;
}

#CommentWrite {
	padding: 10px;
	overflow: hidden;
}

#jb-content {
	padding: 10px;
	border: 1px solid #bcbcbc;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	var myReview;
	function requestReviewPage(page, num) {
		$.ajax({
			type : "post",
			url : "review",
			data : {
				"action" : "getReviewPage",
				"page" : page,
				"toiletNum" : num
			},
			timeout : 5000,
			dataType : "json",
			success : function(args) {
				updateReplyContainer(args);
			},
			error : function(request, status, error) {

				if (request.status == "200") {
					alert("no data");
				} else {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			}
		});

	}

	function updateReplyContainer(data) {
		var pageNum = data.page;
		var toiletId = data.toilet.id;
		data = data.list;

		console.log(data);

		var rContainer = $("#reply_container");
		if (data.length > 0) {
			rContainer.html('');

			var replyContainer = '';
			var temp = '';
			for (var i = 0; i < data.length; i++) {
				temp = data[i];
				replyContainer += "<li class='review_item' style=''><div style='width: 20%; float: left; display: inline-block;'><span><span style='display: inline-block; clear: right; margin-right: 4xp'>";
				replyContainer += temp.score;
				replyContainer += "</span><span style='display: inline-block;'>";

				var starCount = (temp.score + 1) / 2;
				for (var j = 1; j <= starCount; j++) {
					replyContainer += "<img src='img/star.png' />";
				}
				replyContainer += "</span> </span></div><div style='width: 80%; display: inline-block; clear: right;'><h3>";
				replyContainer += temp.review;
				console.log(temp.review);
				replyContainer += "</h3><div style='margin-top: 8px;'></div><span>";
				replyContainer += temp.memberNickname;
				replyContainer += "&nbsp;|&nbsp;";
				replyContainer += temp.regDate;
				replyContainer += "</span></div></li>";
			}
			console.log(replyContainer);
			rContainer.html(replyContainer);

			updateControllerContainer(pageNum, toiletId, data.length >= 15);
		} else {
			alert('마지막 페이지입니다.');
		}

	}

	function updateControllerContainer(page, toiletId, hasMore) {
		var previou = $("#previous");
		var next = $("#next");
		var pageNum = $("#page_num");

		pageNum.text(page);
		previou.attr("href", page > 1 ? "javascript:requestReviewPage("
				+ (page - 1) + "," + toiletId + ")" : "javascript:void(0)");
		next.attr("href", hasMore ? "javascript:requestReviewPage("
				+ (page + 1) + "," + toiletId + ")" : "javascript:void(0)");

	}

	function writeMembersReview(toilet,memberId) {
		var score=$(".star-input>output>b").text();
		var review=$("#input_review").val();
		
		if(review.length>=10){
			window.location.href='review?action=addReview&toilet_id='+toilet+'&writer_id='+memberId+'&review='+review+'&score='+score;
		}else{
			alert('리뷰는 10~100자입니다.<br/>현재 리뷰 글자 수 >>'+review.length);
		}
		
	}
	
	function updateReview(toilet,memberId, score){
		var newScore=$(".star-input>output>b").text();
		var review=$("#input_review").val();

		alert("<"+score+">점에서 <"+newScore+">점으로 수정합니다.");
		newScore=newScore-score;
		window.location.href='review?action=updateReview&toilet_id='+toilet+'&writer_id='+memberId+'&review='+review+'&score='+newScore;
	
	}
</script>
<body>

	<%
		ReviewList reviewList = (ReviewList) request.getAttribute("review");
		if (reviewList == null) {

			response.sendRedirect("index.jsp");
			return;
		}

		System.out.println(session.getAttribute("member"));
		boolean isLoggedIn = session.getAttribute("member") != null;
		Member member = null;

		if (isLoggedIn) {
			member = (Member) session.getAttribute("member");
		}

		System.out.println(isLoggedIn);
		ArrayList<Review> reviews = reviewList.getList();
		Toilet toilet = reviewList.getToilet();
	%>

	<%
		System.out.println(reviewList.toString());
	%>

	<div id="container" style="width: 960px; margin: 0 auto;">
		<div id="map"
			style="margin: 16px 0 0 0; width: 960px; height: 593px; background: red;">

		</div>
		<div id="detail_info"
			style="margin: 4px 0 48px 0; padding: 4px; border-bottom: 2px dotted gray;">
			<span><h3>시설명</h3>&nbsp&nbsp&nbsp&nbsp<%=toilet.getName()%></span><br />
			<br /> <span><h3>시설정보</h3>&nbsp&nbsp&nbsp&nbsp<%=Util.isEqualsNull(toilet.getOpenTime()) ? "" : toilet.getOpenTime()%>
				&nbsp|&nbsp <%=Util.isEqualsNull(toilet.getPhone()) ? toilet.getPhone2() : toilet.getPhone()%>
			</span><br /> <br />

			<ul style="overflow: auto; width: 960px; white-space: nowrap;">
				<h3>시설현황</h3>
				<%
					if (toilet.getIsCommon() == 'Y') {
				%>
				<li class="toilet_info"><img alt="" src="img/is_common.png"
					style="width: 90px; margin: 0 auto; display: block;" />
					<div style="text-align: center; margin-top: 4px;">
						<b>공용</b>
					</div></li>
				<%
					}
				%>

				<%
					if (toilet.getCountManFeces() > 0) {
				%>
				<li class="toilet_info"><img alt="" src="img/man_feces.png"
					style="width: 90px; margin: 0 auto; display: block;" />
					<div style="text-align: center; margin-top: 4px;">
						<b><%=toilet.getCountManFeces()%></b>
					</div></li>
				<%
					}
				%>

				<%
					if (toilet.getCountManUrine() > 0) {
				%>
				<li class="toilet_info"><img alt="" src="img/man_urine.png"
					style="width: 90px; margin: 0 auto; display: block;" />
					<div style="text-align: center; margin-top: 4px;">
						<b><%=toilet.getCountManUrine()%></b>
					</div></li>
				<%
					}
				%>

				<%
					if (toilet.getCountManFecesForHandicapped() > 0) {
				%>
				<li class="toilet_info"><img alt=""
					src="img/man_feces_handicapped.png"
					style="width: 90px; margin: 0 auto; display: block;" />
					<div style="text-align: center; margin-top: 4px;">
						<b><%=toilet.getCountManFecesForHandicapped()%></b>
					</div></li>
				<%
					}
				%>

				<%
					if (toilet.getCountManUrineForHandicapped() > 0) {
				%>
				<li class="toilet_info"><img alt=""
					src="img/man_urine_handipcapped.png"
					style="width: 90px; margin: 0 auto; display: block;" />
					<div style="text-align: center; margin-top: 4px;">
						<b><%=toilet.getCountManUrineForHandicapped()%></b>
					</div></li>
				<%
					}
				%>

				<%
					if (toilet.getCountManChildFeces() > 0) {
				%>
				<li class="toilet_info"><img alt=""
					src="img/man_child_feces.png"
					style="width: 90px; margin: 0 auto; display: block;" />
					<div style="text-align: center; margin-top: 4px;">
						<b><%=toilet.getCountManChildFeces()%></b>
					</div></li>
				<%
					}
				%>

				<%
					if (toilet.getCountManChildUrine() > 0) {
				%>
				<li class="toilet_info"><img alt=""
					src="img/man_child_urine.png"
					style="width: 90px; margin: 0 auto; display: block;" />
					<div style="text-align: center; margin-top: 4px;">
						<b><%=toilet.getCountManChildUrine()%></b>
					</div></li>
				<%
					}
				%>

				<%
					if (toilet.getCountLadyFeces() > 0) {
				%>
				<li class="toilet_info"><img alt="" src="img/lady_feces.png"
					style="width: 90px; margin: 0 auto; display: block;" />
					<div style="text-align: center; margin-top: 4px;">
						<b><%=toilet.getCountLadyFeces()%></b>
					</div></li>
				<%
					}
				%>

				<%
					if (toilet.getCountLadyFecesForHandicapped() > 0) {
				%>
				<li class="toilet_info"><img alt=""
					src="img/lady_feces_handicapped.png"
					style="width: 90px; margin: 0 auto; display: block;" />
					<div style="text-align: center; margin-top: 4px;">
						<b><%=toilet.getCountLadyFecesForHandicapped()%></b>
					</div></li>
				<%
					}
				%>

				<%
					if (toilet.getCountLadyChildFeces() > 0) {
				%>
				<li class="toilet_info"><img alt=""
					src="img/lady_child_feces.png"
					style="width: 90px; margin: 0 auto; display: block;" />
					<div style="text-align: center; margin-top: 4px;">
						<b><%=toilet.getCountLadyChildFeces()%></b>
					</div></li>
				<%
					}
				%>
			</ul>
		</div>

		<div style="background: white; clear: both; margin-bottom: 16px;">

			<div id="StarRating">
				<span class="star-input"> <span class="input"> <input
						type="radio" name="star-input" value="1" id="p1"> <label
						for="p1">1</label> <input type="radio" name="star-input" value="2"
						id="p2"> <label for="p2">2</label> <input type="radio"
						name="star-input" value="3" id="p3"> <label for="p3">3</label>
						<input type="radio" name="star-input" value="4" id="p4"> <label
						for="p4">4</label> <input type="radio" name="star-input" value="5"
						id="p5"> <label for="p5">5</label> <input type="radio"
						name="star-input" value="6" id="p6"> <label for="p6">6</label>
						<input type="radio" name="star-input" value="7" id="p7"> <label
						for="p7">7</label> <input type="radio" name="star-input" value="8"
						id="p8"> <label for="p8">8</label> <input type="radio"
						name="star-input" value="9" id="p9"> <label for="p9">9</label>
						<input type="radio" name="star-input" value="10" id="p10">
						<label for="p10">10</label>
				</span> <output for="star-input"> <b>0</b></output>
				</span>
			</div>
			<textarea id="input_review" rows="" cols=""
				style="width: 696px; height: 58px; float: left;" minlength="10"
				maxlength="100" <%if (!isLoggedIn) {%> <%="readonly"%> <%}%>></textarea>
			<button type="button" style="height: 60px; width: 60px;" id="submit"
				<%if (!isLoggedIn) {%> <%="disabled"%> <%} else {%>
				onclick="writeMembersReview(<%=toilet.getId()%>,<%=member.getId()%>)"
				<%}%>>등록</button>

		</div>


		<hr style="background: black; height: 1px; clear: both;" />
		<div style="background: white; clear: both;">
			<ul id="reply_container">
				<%
					for (Review r : reviews) {

						if (isLoggedIn) {
							if (r.getMemberId() == member.getId()) {
				%>
				<script type="text/javascript">
					$("#input_review").text("<%=r.getReview()%>");
					$("#submit").text("업데이트");
					//toilet,memberId, score
					$("#submit").attr("onclick","updateReview(<%=toilet.getId()%>,<%=member.getId()%>,<%=r.getScore()%>)");
					
				</script>

				<%
					}
						}
				%>
				<li class="review_item" style="">
					<div style="width: 20%; float: left; display: inline-block;">
						<span><span
							style="display: inline-block; clear: right; margin-right: 4xp"><%=r.getScore()%></span>
							<span style="display: inline-block;"> <%
 	int count = (r.getScore() + 1) / 2;

 		for (int i = 1; i <= count; i++) {
 %> <img src="img/star.png" /> <%
 	}
 %>
						</span> </span>
					</div>
					<div style="width: 80%; display: inline-block; clear: right;">

						<h3><%=r.getReview()%></h3>
						<div style="margin-top: 8px;">
							<span> <%=r.getMemberNickname()%>&nbsp|&nbsp<%=r.getRegDate()%>
							</span>
						</div>

					</div>
				</li>
				<%
					}
				%>
			</ul>
		</div>

		<div style="text-align: center;">
			<a id="previous" class="vertical"
				href=<%if (reviewList.getPage() > 1) {%>
				<%="\"javascript:requestReviewPage(" + (reviewList.getPage() - 1) + "," + toilet.getId() + ")\""%>
				<%} else {%> <%="\"javascript:void(0)\""%> <%}%>
				style="padding: 8px 16px;">&lt</a> <em class="vertical"><b
				id="page_num"><%=reviewList.getPage()%></b></em> <a id="next"
				class="vertical" href=<%if (reviewList.getList().size() == 15) {%>
				<%="\"javascript:requestReviewPage(" + (reviewList.getPage() + 1) + "," + toilet.getId() + ")\""%>
				<%} else {%> <%="\"javascript:void(0)\""%> <%}%>
				style="padding: 8px 16px;">&gt</a>
		</div>
	</div>


	<script src="js/star.js"></script>
	<script type="text/javascript">
		var markerPosition = new daum.maps.LatLng(
	<%=toilet.getLat()%>
		,
	<%=toilet.getLon()%>
		);
		console.log(markerPosition);
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 

		mapOption = {
			center : markerPosition, // 지도의 중심좌표
			level : 2
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption);

		map.setDraggable(false);
		map.setZoomable(false);

		// 마커가 표시될 위치입니다 

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
			position : markerPosition
		});

		marker.setMap(map);
	</script>
</body>
</html>