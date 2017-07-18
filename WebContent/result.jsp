<%@page import="work.model.dto.Toilet"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		ArrayList list = (ArrayList) request.getAttribute("resultList");
		out.print("	[");
	%>


	<%=list.get(0)%>
	<%
		for (int i = 1; i < list.size(); i++) {
	%>
	,
	<%
		out.print(list.get(i).toString());
	%>

	<%
		}
		out.print("]");
	%>

</body>
</html>