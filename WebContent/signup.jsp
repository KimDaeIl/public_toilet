<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style>


body,html{
width:100%;
height:100%;}
input {
	box-shadow: none;
	border: none;
}

.input {
	border-bottom: 2px solid gray;
}

.title {
	font-size: .7em;
	font-weight: bold;
	color: rgb(189, 189, 189);
	padding: 0;
	margin-left: 16px;
}
</style>

<script type="text/javascript">

</script>
</head>

<body>

	<div style="width: 960px; margin: 0 auto; padding-top:10%;">
		<div style="width: 30%; margin: 0 auto;">
			<form action="member?action=signUp" method="post">
				<div>
					<div class="title">ID</div>
					<input type="text" class="input" name="member_id" placeholder="ID"
						minlength="2" maxlength="16" required autofocus
						style="width: 268px; margin-top: 6px; padding: 2px 8px; font-size: 1.2em;" />
				</div>
				<div style="margin-top: 16px;">
					<div class="title">PW</div>
					<input type="password" class="input" name="member_pw"
						placeholder="PASSWORD" minlength="8" maxlength="16" required
						style="width: 268px; margin-top: 6px; padding: 2px 8px; font-size: 1.2em;" />

					<input type="password" class="input" name="re_pw"
						placeholder="RE-PASSWORD" minlength="8" maxlength="16" required
						style="width: 268px; margin-top: 12px; padding: 2px 8px; font-size: 1.2em;" />
				</div>
				<div style="margin-top: 16px;">

					<div class="title">NICKNAME</div>
					<input type="text" class="input" name="nickname"
						placeholder="NICKNAME" minlength="2" maxlength="16" required
						style="width: 268px; margin-top: 6px; padding: 2px 8px;; font-size: 1.2em;" />
				</div>
				<input type="submit" value="로그인"
					style="width: 100%; margin-top: 16px; padding: 8px; font-weight: bold; color: white; background: black;" onclick="return login();" />

			</form>
		</div>
	</div>
</body>
</html>