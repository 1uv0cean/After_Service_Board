<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 뷰포트 -->

<meta name="viewport" content="width=device-width" initial-scale="1">

<!-- 스타일시트 참조  -->

<link rel="stylesheet" href="css/bootstrap.css">

<title> IT 지원실 </title>

</head>

<body>

	<%

		//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값

		String userName = null;

			if (session.getAttribute("userName") != null) {

				userName = (String) session.getAttribute("userName");

			}


	%>





	<!-- 네비게이션  -->

	<nav class="navbar navbar-default">

		<div class="navbar-header">

			<button type="button" class="navbar-toggle collapsed"

				data-toggle="collapse" data-target="bs-example-navbar-collapse-1"

				aria-expaned="false">

				<span class="icon-bar"></span> <span class="icon-bar"></span> <span

					class="icon-bar"></span>

			</button>

				<a class="navbar-brand" href="main.jsp"><b><span style="color:#337AB7">IT 지원실</span></b></a>

		</div>

		<div class="collapse navbar-collapse"

			id="#bs-example-navbar-collapse-1">

			<ul class="nav navbar-nav">

				<li><a href="bbs.jsp">A/S요청</a>

			</ul>




			<%

				//라긴안된경우

				if (userName == null) {

			%>

			<ul class="nav navbar-nav navbar-right">

				<li class="dropdown"><a href="#" class="dropdown-toggle"

					data-toggle="dropdown" role="button" aria-haspopup="true"


 
					aria-expanded="false">접속하기<span class="caret"></span></a>

					<ul class="dropdown-menu">

						<li><a href="login.jsp">로그인</a></li>

						<li><a href="join.jsp">회원가입</a></li>

					</ul></li>

			</ul>

			<%

				} else {

			%>

			<ul class="nav navbar-nav navbar-right">

				<li class="dropdown"><a href="#" class="dropdown-toggle"

					data-toggle="dropdown" role="button" aria-haspopup="true"

					aria-expanded="false">회원관리<span class="caret"></span></a>

					<ul class="dropdown-menu">

						<li><a href="logoutAction.jsp">로그아웃</a></li>

					</ul></li>

			</ul>

			<%

				}

			%>

		</div>

	</nav>
 
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>


<script src="http://maps.googleapis.com/maps/api/js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyBt6ajCsvRe7ZLJZWLwyE85oNMngXL5ZCo" ></script>

<script>
function initialize() {



  var LatLng = new google.maps.LatLng(37.447316, 126.658368);

  var mapProp = {

    center: LatLng, // 위치

    zoom:17, // 어느정도까지 세세하게 볼 것인지.

    mapTypeId:google.maps.MapTypeId.ROADMAP

  };

  var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);





  var marker = new google.maps.Marker({

	position: LatLng,

	map: map,

	

  });

}

google.maps.event.addDomListener(window, 'load', initialize);

</script>

</head>

 

<body>

<div id="googleMap" style="width:1280px;height:520px"></div>
 
</body>

 

</html>
</body>
</html>
</body>
</html>