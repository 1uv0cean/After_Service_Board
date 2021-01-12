<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.1.1.min.js" ></script> 
<script src="js/bootstrap.js"></script> 
<head>
<meta charset="UTF-8">
<meta name = "viewport" content ="width=deviec-width", initial-scale = "1">
<link rel="stylesheet" href="css/bootstrap.css"> <!-- 디자인을 위해서 bootstrap 이용 -->
<title> IT 지원실 </title>
</head>
<body>
	<nav class="navbar navbar-default"> <!-- 네비게이션(웹사이트의 전반적인 구성을 보여주는 역할) 구현 -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-colloapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span> <!-- 휴대폰처럼 작은 화면에서 우측상단에 아이콘 바가 생기도록 함 -->
		
			</button>
			<a class="navbar-brand" href="main.jsp"><b><span style="color:#337AB7">IT 지원실</span></b></a> 		
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="bbs.jsp">A/S요청</a>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" 
						data-toggle="dropdown" role="button" aria-haspup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a> <!-- 드랍다운 메뉴 생성 -->
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li> <!-- active: 현재 클릭이 되었다는 것을 표시 -->
						<li><a href="join.jsp">회원가입</a></li>
			</ul>
			
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="loginAction.jsp">
					<h3 style="text-align: center;">로그인</h3>
					<div class="form-group">
						 <input type="text" class="form-control" placeholder="학번 / 사번" name="userName" maxlength="20">		
						 </div>
					<div class="form-group">
						 <input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20"></div>
						 			
					<input type="submit" class="btn btn-primary form-control" value="로그인">
					</div></form>
		</div>
	</div>
	


</body>
</html>