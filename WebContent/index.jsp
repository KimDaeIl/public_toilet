<%--
  Created by IntelliJ IDEA.
  User: KimDaeil
  Date: 2017. 7. 13.
  Time: PM 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@page import="work.model.dto.Member"%>
<%@page import="work.model.service.MemberService"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>$Title$</title>
</head>
<body>

	<%
		MemberService service = new MemberService();

		Member member = service.login("user01", "password01");
	%>

	<%=member.getMemberId()%>


</body>
</html>
