<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

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
		select.append("<option value='none'>시</option>");
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
		select.append("<option value='none'>구</option>");
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
				displayUpdate(args);
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

	function displayUpdate(data) {
		var div = $('#display');
		div.html('');
		var str = "";
		for (var i = 0; i < data.length; i++) {
			var obj = data[i];
			str += obj.id + "," + obj.name + "<br/>";

		}

		div.html(str);

	}

	window.onload = function() {
		makeCity();

	}
</script>
</head>
<body>

	<select id="city" onchange="makeBorough(this.value)"></select>
	<br />
	<select id="borough" onchange="display(this.value)"></select>
	<br />

	<div id="display" />

</body>
</html>