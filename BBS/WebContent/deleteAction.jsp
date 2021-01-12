<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<%@ page import="bbs.BbsDAO"%>

<%@ page import="bbs.Bbs"%>

<%@ page import="java.io.PrintWriter"%>

<%

	request.setCharacterEncoding("UTF-8");

	//response.setContentType("text/html; charset=UTF-8");

%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title> 17.com </title>

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

		} 

		int bbsID = 0;

		if(request.getParameter("bbsID") != null){

			bbsID = Integer.parseInt(request.getParameter("bbsID"));

		}

		if(bbsID == 0) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('유효하지 않은 글 입니다')");

			script.println("location.href='bbs.jsp'");

			script.println("</script>");

		}

		Bbs bbs = new BbsDAO().getBbs(bbsID);

		if(!userName.equals(bbs.getUserName())) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('권한이 없습니다')");

			script.println("location.href='bbs.jsp'");

			script.println("</script>");			

		}

		else{

			BbsDAO bbsDAO = new BbsDAO();

			int result = bbsDAO.delete(bbsID);

			if (result == -1) {

				PrintWriter script = response.getWriter();

				script.println("<script>");

				script.println("alert('글 삭제에 실패했습니다')");

				script.println("history.back()");

				script.println("</script>");

			} else {

				PrintWriter script = response.getWriter();

				script.println("<script>");
				
				script.println("alert('글이 정상적으로 삭제되었습니다')");

				script.println("location.href='bbs.jsp'");

				script.println("</script>");

			}

		}

	%>

</body>

</html>

