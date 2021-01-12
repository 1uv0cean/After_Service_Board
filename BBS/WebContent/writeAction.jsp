<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<%@ page import="bbs.BbsDAO"%>

<!-- bbsdao의 클래스 가져옴 -->

<%@ page import="java.io.PrintWriter"%>

<!-- 자바 클래스 사용 -->

<%

	request.setCharacterEncoding("UTF-8");

	response.setContentType("text/html; charset=UTF-8"); //set으로쓰는습관들이세오.

%>



<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->

<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />

<!-- // Bbs bbs = new Bbs(); -->

<jsp:setProperty name="bbs" property="bbsTitle" /><!-- bbs.setBbsTitle(request) -->

<jsp:setProperty name="bbs" property="bbsContent" />

<%

	System.out.println(bbs);

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >

<title> FingerPrintLogin </title>

</head>

<body>

	<%

		String userName = null;

		if (session.getAttribute("userName") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 

			userName = (String) session.getAttribute("userName");//유저아이디에 해당 세션값을 넣어준다.

		}

		if (userName == null) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('로그인을 하세요.')");

			script.println("location.href = 'login.jsp'");

			script.println("</script>");

		} else {



			if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {

				PrintWriter script = response.getWriter();

				script.println("<script>");

				script.println("alert('입력이 안된 사항이 있습니다')");

				script.println("history.back()");

				script.println("</script>");

			} else {

				BbsDAO BbsDAO = new BbsDAO();

				int result = BbsDAO.write(bbs.getBbsTitle(), userName, bbs.getBbsContent());

				if (result == -1) {

					PrintWriter script = response.getWriter();

					script.println("<script>");

					script.println("alert('글쓰기에 실패했습니다')");

					script.println("history.back()");

					script.println("</script>");

				} else {

					PrintWriter script = response.getWriter();

					script.println("<script>");

					script.println("alert('글이 정상적으로 등록되었습니다')");
					
					script.println("location.href='bbs.jsp'");

					//script.println("history.back()");

					script.println("</script>");

				}



			}



		}

	%>
</body>

</html>


