<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="userPayInfo.UserPayInfoDAO" %>
<%@ page import="userPayInfo.UserPayInfoDTO" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cruve - save</title>
</head>
<body>
<%
	String userID=null;
	String phone=null;
	String email=null;
	
	int Result=0;

	if(session.getAttribute("userID")!=null) { 
		userID = (String)session.getAttribute("userID"); 
		} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	if(request.getParameter("phone")!=null)
		phone = request.getParameter("phone");
	if(request.getParameter("email")!=null)
		email = request.getParameter("email");
	
	UserPayInfoDAO payInfo = new UserPayInfoDAO();
	
	Result = payInfo.insert(new UserPayInfoDTO(userID,userID,phone,email));
	if(Result==-1||Result==0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생했습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}
%>
</body>
</html>