<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Curve - 처리</title>
</head>
<body>
<%
	String userID=null;

	if(session.getAttribute("userID")!=null)
		userID=(String)session.getAttribute("userID");
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='sign_in.jsp';");
		script.println("</script>");
		script.close();
	}

	boolean emailOpen=false;
	int Result=0;
	
	if(request.getParameter("emailOpen")!=null)
		emailOpen=true;
	
	UserDAO userDAO = new UserDAO();
	
	if(emailOpen == true) Result = userDAO.setUserEmailOpen(userID,true);
	else Result = userDAO.setUserEmailOpen(userID,false);
	
	if(Result==-1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생했습니다.');");
		script.println("location.href='setting.jsp';");
		script.println("</script>");
		script.close();
	}
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='setting.jsp';");
		script.println("</script>");
		script.close();
	}
%>
</body>
</html>