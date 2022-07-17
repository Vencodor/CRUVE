<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="user.UserDAO" %>
<%@ page import="com.oreilly.servlet.MultipartRequest"  %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CURVE</title>
</head>
<body>
<%
	String userID=null;
	String uploadPath = request.getServletContext().getRealPath("ProfileImages");
	int size=15*1024*1024; //byte 파일 15MB로 제한
	
	if(session.getAttribute("userID")!=null)
		userID=(String)session.getAttribute("userID");
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='sign_in.jsp';");
		script.println("</script>");
		script.close();
	}
	
	MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"utf-8",new DefaultFileRenamePolicy());
	
	UserDAO userDAO = new UserDAO();
	
	String userName=null;
	String shortContent=null;
	String content=null;
	String profileImage=null;
	
	String facebook=null;
	String github=null;
	String twitter=null;
	String youtube=null;
	
	int Result=0;
	
	if(multi.getFilesystemName("profileImage")!=null) {
		String filePath = "C:\\Users\\kimdo\\OneDrive\\바탕 화면\\JAVA\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\GBIP - FrontEnd\\ProfileImages\\";
		profileImage = multi.getFilesystemName("profileImage");
		
		filePath += userDAO.getProfileImage(userID);
		File f = new File(filePath);
		if(f.exists()) f.delete();
	}
	
	if(multi.getParameter("userName")!=null)
		userName=multi.getParameter("userName");
	
	if(multi.getParameter("shortContent")!=null)
		shortContent=multi.getParameter("shortContent");
	
	if(multi.getParameter("content")!=null)
		content=multi.getParameter("content");
	
	if(multi.getParameter("facebook")!=null)
		facebook=multi.getParameter("facebook");
	
	if(multi.getParameter("github")!=null)
		github=multi.getParameter("github");
	
	if(multi.getParameter("twitter")!=null)
		twitter=multi.getParameter("twitter");
	
	if(multi.getParameter("youtube")!=null)
		youtube=multi.getParameter("youtube");
	
	//userName!=null&&shortContent!=null&&
	if((profileImage!=userDAO.getProfileImage(userID)||userName!=userDAO.getUserName(userID)||shortContent!=userDAO.getProfileShortContent(userID)
	||content!=userDAO.getProfileContent(userID)||facebook!=userDAO.getFacebook(userID)||github!=userDAO.getGithub(userID)
	||twitter!=userDAO.getTwitter(userID)||youtube!=userDAO.getYoutube(userID))) {
		Result = userDAO.setProfile(userID, userName, shortContent, content, profileImage ,facebook ,twitter ,github ,youtube);
		
		if(Result!=-1&&Result!=0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='setting.jsp';");
			script.println("</script>");
			script.close();
		}
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('DB오류가 발생했습니다.');");
			script.println("location.href='setting.jsp';");
			script.println("</script>");
			script.close();
		}
	}
	else {
		System.out.println(userName+shortContent);
	}
%>
</body>
</html>