<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.oreilly.servlet.MultipartRequest"  %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="commodity.CommodityDAO" %>
<%@ page import="commodity.CommodityDTO" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.Base64" %>
<%@ page import="util.Code32" %>
<%@ page import="java.util.Base64.Encoder" %>
<%@ page import="util.ImageBLOB" %>
<%@ page import="java.io.File" %>
<%@ page import="follow.FollowDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
	String userID=null;

	if(session.getAttribute("userID")!=null)
		userID = (String)session.getAttribute("userID");
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("location.href='userLogin.jsp'");
		script.println("</script>");
		script.close();
	}

	String uploadPath = request.getServletContext().getRealPath("CommodityFile");
	String ImageUploadPath = request.getServletContext().getRealPath("CoverImage");
	int size=60*1024*1024; //byte 파일 20MB로 제한

	String title=null;
	String subtitle=null;
	String description=null;
	String category=null;
	String coverImage=null;
	String file=null;
	String buyerDescription=null;
	
	String[] categorys = {};
	
	int price=0;
	
	int Result=0;
	
	int imageSize = 1024*1024*2;
	int fileSize = 1024*1024*40;
	
	
	MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"utf-8",new DefaultFileRenamePolicy());
	CommodityDAO commodityDAO = new CommodityDAO();
	
	file = multi.getFilesystemName("file");
	coverImage = multi.getFilesystemName("coverImage");
	if(multi.getParameter("title")!=null)
		title = multi.getParameter("title");
	if(multi.getParameter("subtitle")!=null)
		subtitle = multi.getParameter("subtitle");
	if(multi.getParameter("description")!=null)
		description = multi.getParameter("description");
	if(multi.getParameter("category")!=null)
		category = multi.getParameter("category");
	if(multi.getParameter("buyerDescription")!=null)
		buyerDescription = multi.getParameter("buyerDescription");
	
	categorys = category.split("-");
	
	try {
		if(multi.getParameter("price")!=null)
		price = Integer.parseInt(multi.getParameter("price"));
	} catch(Exception e) {}
	
	if(file==null||coverImage==null||subtitle==null||title==null||description==null||category==null||buyerDescription==null){
		System.out.println(file+"|"+title+"|"+coverImage+"|"+price+"|"+description+"|"+category+"|"+buyerDescription+"|");
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력안된 사항이 존재합니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	Code32 code = new Code32();
	
	String Wcode = code.Code();
	String endStr = null;
	
	if(file != null){
		File upfile1 = new File(uploadPath+"/"+file);
		File upfile2 = new File(uploadPath+"/"+Wcode+"z"+file.substring(file.lastIndexOf(".")));
		upfile1.renameTo(upfile2);
	}
		
	if(coverImage != null){
		File upfile1 = new File(uploadPath+"/"+coverImage);
		File upfile2 = new File(ImageUploadPath+"/"+Wcode+coverImage.substring(coverImage.lastIndexOf(".")));
		upfile1.renameTo(upfile2);
		
		endStr = coverImage.substring(coverImage.lastIndexOf("."));
		if(!(endStr.equals(".jpg")||endStr.equals(".jpeg")||endStr.equals(".bmp")||endStr.equals(".png")||endStr.equals(".gif"))) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('올바르지 않은 확장자입니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		}
		if(upfile2.length()>imageSize) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미지 파일의 크기가 너무 큽니다. (2MB 초과)');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		}
	}
		
	Result = commodityDAO.write(new CommodityDTO(0,Wcode,userID,title,subtitle,description
			,categorys[0],categorys[1],price,Wcode+coverImage.substring(coverImage.lastIndexOf(".")),Wcode+"z"+file.substring(file.lastIndexOf(".")),0,null,null,0,buyerDescription,0,null,null,false));
	
	if(Result==-1||Result==0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생했습니다. 관리자에게 문의하세요');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}
	else {
		FollowDAO follow = new FollowDAO();
		follow.setNewsEnable(userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='index.jsp';");
		script.println("</script>");
		script.close();
	}
%>	
	
</body>
</html>