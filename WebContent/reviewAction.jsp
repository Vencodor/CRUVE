<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="review.ReviewDTO" %>
<%@ page import="review.ReviewDAO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Curve - Review</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String userID=null;
	String description=null;
	int rate=0;
	int writtenID=0;
	
	int Result=0;

	if(session.getAttribute("userID")!=null)
		userID=(String)session.getAttribute("userID");
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	if(request.getParameter("description")!=null)
		description=request.getParameter("description");
	if(request.getParameter("rate")!=null)
		rate=Integer.parseInt(request.getParameter("rate"));
	if(request.getParameter("writtenID")!=null)
		writtenID=Integer.parseInt(request.getParameter("writtenID"));
	
	if(description==null || rate==0 || writtenID==0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력되지 않은 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	ReviewDAO reviewDAO = new ReviewDAO();
	
	Result=reviewDAO.write(new ReviewDTO(userID,writtenID,description,rate,null,0));
	if(Result==0||Result==-1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생했습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = document.referrer;");
		script.println("</script>");
		script.close();
	}
%>
</body>
</html>