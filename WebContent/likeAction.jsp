<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="commodity.CommodityDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Curve - LikeAction</title>
</head>
<body>
<%
	String userID=null;
	int writtenID=0;
	int Result=0;

	if(session.getAttribute("userID")!=null)
		userID=(String)session.getAttribute("userID");
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.');");
		script.println("history.back();");
		script.println("</script>");
		return;
	}
	if(request.getParameter("ID")!=null) 
	{
		try {
			writtenID = Integer.parseInt(request.getParameter("ID"));
		}
		catch(Exception e) {}
	}
	else { 
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('ID가 없습니다.');");
		script.println("history.back();");
		script.println("</script>");
		return;
	}
	
	CommodityDAO commodityDAO = new CommodityDAO();
	
	if( commodityDAO.likeCheck(userID, writtenID) == false ) {
		commodityDAO.likeAdd(userID, writtenID);
		commodityDAO.likeCountAdd(writtenID);
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = document.referrer;");
		script.println("</script>");
	} else {
		commodityDAO.likeRemove(userID, writtenID);
		commodityDAO.likeCountRemove(writtenID);
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = document.referrer;");
		script.println("</script>");
	}

%>
</body>
</html>