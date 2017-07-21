<!-- 다음 데이터셋 이용한 키워드 검색 < 부산의 화장실 > -->

<%@page import="work.Util.Util"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>화장실 검색 서비스 또이레!</title>
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

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
.input {
	border-bottom: 2px solid gray;
}

.title {
	font-size: .7em;
	font-weight: bold;
	color: rgb(0, 0, 0);
	padding: 0;
	margin-left: 16px;
}
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>


</head>
<body>
	<body id="page-top">

    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="index.jsp">화장실 검색 서비스 또이레!</a>
            </div>

           
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
	
    <header>
        <div class="header-content">
            <div class="header-content-inner">
<div style="width: 960px; margin: 0 auto; padding-top:10%;">
		<div style="width: 30%; margin: 0 auto;">
			<form action="member?action=signUp" 

method="post">
				<div>
					<div class="title">ID</div>
					<input type="text" 

class="input" name="member_id" placeholder="ID"
						minlength="2" 

maxlength="16" required autofocus
						style="width: 268px; 

margin-top: 6px; padding: 2px 8px; font-size: 1.2em;" />
				</div>
				<div style="margin-top: 16px;">
					<div class="title">PW</div>
					<input type="password" 

class="input" name="member_pw"
						placeholder="PASSWORD" 

minlength="8" maxlength="16" required
						style="width: 268px; 

margin-top: 6px; padding: 2px 8px; font-size: 1.2em;" />

					<input type="password" 

class="input" name="re_pw"
						placeholder="RE-

PASSWORD" minlength="8" maxlength="16" required
						style="width: 268px; 

margin-top: 12px; padding: 2px 8px; font-size: 1.2em;" />
				</div>
				<div style="margin-top: 16px;">

					<div class="title">NICKNAME</div>
					<input type="text" class="input" name="nickname"
						placeholder="NICKNAME" 

minlength="2" maxlength="16" required
						style="width: 268px; 

margin-top: 6px; padding: 2px 8px;; font-size: 1.2em;" />
				</div>
				<input type="submit" value="회원가입"
					style="width: 100%; margin-

top: 16px; padding: 8px; font-weight: bold; color: white; background: 

black;" onclick="return login();" />

			</form>
		</div>
	</div>
			</div>
        </div>
    </header>
    
        <section id="services">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">또이렛은 말이죠</h2>
                    <hr class="primary">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <img style=width:80px; src="img/running.png">
                        <h3>화장실 검색</h3>
                        <p class="text-muted">야외에서 화장실 용무가 급한 분들에게 인근 공중화장실 정보 제공 </p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <img style=width:60px; src="img/wheelchair.png">
                        <h3>장애인 전용 화장실 검색</h3>
                        <p class="text-muted">화장실 이용에 불편을 겪는 장애인들에게 장애인 전용 화장실 정보 제공</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <img style=width:60px; src="img/children.png">
                        <h3>어린이용 화장실 검색</h3>
                        <p class="text-muted">어린 아이가 화장실 이용 편리하도록 어린이용 변기 거치 화장실 검색</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-heart text-primary sr-icons"></i>
                        <h3>화장실 이용 후기와 평가</h3>
                        <p class="text-muted">해당 화장실의 리뷰를 사용자들이 공유함으로써 사용자들에게 다양한 선택폭 제공</p>
                    </div>
                </div>
            </div>
        </div>
    </section>    
    
           <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">화장실 정보 검색 서비스 또이레!</h2>
                    <hr class="primary">
                    <p>Copyrightⓒ 6 Team</p>
                </div>
                <div class="col-lg-4 col-lg-offset-2 text-center">
                    <i class="fa fa-phone fa-3x sr-contact"></i>
                    <p>대표 : 010-4197-0925</p>
                </div>
                <div class="col-lg-4 text-center">
                    <i class="fa fa-envelope-o fa-3x sr-contact"></i>
                    <p><a href="mailto:your-email@your-domain.com">qatta24@naver.com</a></p>
                </div>
            </div>
        </div>
        </section>

    <!-- jQuery -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="vendor/scrollreveal/scrollreveal.min.js"></script>
    <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- Theme JavaScript -->
    <script src="js/creative.min.js"></script>
</body>
</html>
