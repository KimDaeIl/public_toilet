<!-- ġŲ�� Ŭ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="jquery-3.2.1.js"></script> 

</head>
<body>
<p style="margin-top:-12px">
    ����� �����͸� ���÷��� 
    <em class="link">
       <a href="chicken.json" target="_blank">���⸦ Ŭ���ϼ���!</a>
    </em>
</p>
<div id="map" style="width:70%;height:550px;"></div>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=24780e4341802fb5886463b2df20361f&libraries=clusterer"></script>
<script>
    var map = new daum.maps.Map(document.getElementById('map'), { // ������ ǥ���� div
        center : new daum.maps.LatLng(35.210748, 129.032153), // ������ �߽���ǥ 
        level : 8 // ������ Ȯ�� ���� 
    });
    
    // ��Ŀ Ŭ�����ͷ��� �����մϴ� 
    var clusterer = new daum.maps.MarkerClusterer({
        map: map, // ��Ŀ���� Ŭ�����ͷ� �����ϰ� ǥ���� ���� ��ü 
        averageCenter: true, // Ŭ�����Ϳ� ���Ե� ��Ŀ���� ��� ��ġ�� Ŭ������ ��Ŀ ��ġ�� ���� 
        minLevel: 10 // Ŭ������ �� �ּ� ���� ���� 
    });
 
    // �����͸� �������� ���� jQuery�� ����մϴ�
    // �����͸� ������ ��Ŀ�� �����ϰ� Ŭ�����ͷ� ��ü�� �Ѱ��ݴϴ�
    $.get("chicken.json", function(data) {
        // �����Ϳ��� ��ǥ ���� ������ ��Ŀ�� ǥ���մϴ�
        // ��Ŀ Ŭ�����ͷ��� ������ ��Ŀ ��ü�� ������ �� ���� ��ü�� �������� �ʽ��ϴ�
        var markers = $(data.positions).map(function(i, position) {
            return new daum.maps.Marker({
                position : new daum.maps.LatLng(position.lat, position.lng)
            });
        });

        // Ŭ�����ͷ��� ��Ŀ���� �߰��մϴ�
        clusterer.addMarkers(markers);
    });
</script>
</body>
</html>