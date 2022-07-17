<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.oreilly.servlet.MultipartRequest"  %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="commodity.CommodityDAO" %>
<%@ page import="commodity.CommodityDTO" %>
<%@ page import="edit.EditListDAO" %>
<%@ page import="edit.EditListDTO" %>
<%@ page import="java.io.File" %>
<%@ page import="setting.*" %>
<%@ page import="noti.*" %>
<%@ page import="follow.*" %>

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
	int size=50*1024*1024; //byte 파일 50MB로 제한
	
	System.out.println(uploadPath);
	
	String title=null;
	String subtitle=null;
	String description=null;
	String coverImage=null;
	String buyerDescription=null;
	String category=null;
	String file=null;
	
	String editTitle=null;
	
	String categorys[]=null;
	
	int imageSize = 1024*1024;
	
	int price=0;
	int writtenID=0;
	
	int Result=0;
	
	MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"utf-8",new DefaultFileRenamePolicy());
	CommodityDAO commodityDAO = new CommodityDAO();
	EditListDAO editDAO = new EditListDAO();
	
	try{file = multi.getFilesystemName("file");
	coverImage = multi.getFilesystemName("coverImage");} catch(Exception e) {}
	if(multi.getParameter("writtenID")!=null)
		try{ writtenID = Integer.parseInt(multi.getParameter("writtenID")); } catch(Exception e) {}
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
	try {
		if(multi.getParameter("price")!=null)
		price = Integer.parseInt(multi.getParameter("price"));
	} catch(Exception e) {}
	if(multi.getParameter("editTitle")!=null)
		editTitle = multi.getParameter("editTitle");
	
	if(subtitle==null||title==null||description==null||category==null||editTitle==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력되지 않은 사항이 존재합니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	categorys = category.split("-");
	if(coverImage==null)
		coverImage = commodityDAO.getWritten(writtenID).getCoverImage();
	if(file==null)
		file = commodityDAO.getWritten(writtenID).getFile();

	CommodityDTO editBefore = commodityDAO.getWritten(writtenID);
	String Wcode = editBefore.getWrittenCode();
	String endStr = null;
	
	if(file != null){
		File upfile1 = new File(uploadPath+"/"+file);
		File upfile2 = new File(uploadPath+"/"+Wcode+"z"+file.substring(file.lastIndexOf(".")));
		if(upfile2.delete()) {
			upfile1.renameTo(upfile2);
		} else {
			upfile1.renameTo(upfile2);
		}
	}
		
	if(coverImage != null){
		File upfile1 = new File(uploadPath+"/"+coverImage);
		File upfile2 = new File(ImageUploadPath+"/"+Wcode+coverImage.substring(coverImage.lastIndexOf(".")));
		if(upfile2.delete()) {
			upfile1.renameTo(upfile2);
		} else {
			upfile1.renameTo(upfile2);
		}
		
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
			script.println("alert('이미지 파일의 크기가 너무 큽니다. (1MB 초과)');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		}
	}
	
	Result = commodityDAO.writeUpdate(writtenID,title,description,subtitle,price,Wcode+coverImage.substring(coverImage.lastIndexOf("."))
	,buyerDescription,categorys[0],categorys[1],Wcode+"z"+file.substring(file.lastIndexOf(".")));
	
	if(Result==-1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생했습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}
	else {
		editDAO.write(new EditListDTO(writtenID,editTitle,title,subtitle,description,categorys[0],categorys[1],price,coverImage,file,null),editBefore);
		
		FollowDAO follow = new FollowDAO();
		SettingDAO setDAO = new SettingDAO();
		NotiDAO notiDAO = new NotiDAO();
		
		ArrayList<FollowDTO> myList = new ArrayList<FollowDTO>();
		myList = follow.getMyList(userID);

		System.out.println("알림 : "+userID);
		for(FollowDTO a : myList) {
			if(setDAO.getData(a.getUserID()).isNotiFollowActive()) {
				System.out.println(""+a.getUserID());
				notiDAO.write(new NotiDTO(userID,a.getUserID(),"update/"+editBefore.getTitle()," 글이 변경되었습니다.",null,0));
			}
		}
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='index.jsp';");
		script.println("</script>");
		script.close();
	}
%>	
	
</body>
</html>