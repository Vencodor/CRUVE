<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="commodity.CommodityDAO" %>
<%@ page import="commodity.CommodityDTO" %>
<%@ page import="java.io.File" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Curve - delete the commodity</title>
</head>
<body>
<%
	String userID=null;
	String writerID=null;
	int writtenID=0;
	String Wcode=null;
	int Result=0;
	
	CommodityDAO commodityDAO = new CommodityDAO();
	
	if(session.getAttribute("userID")!=null)
		userID=(String)session.getAttribute("userID");
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	if(request.getParameter("ID")!=null) {
		Wcode = request.getParameter("ID");
		writtenID = commodityDAO.getWrittenID(Wcode);
	}
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('잘못된 접근입니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	writerID=commodityDAO.getUserID(writtenID);
	if(!writerID.equals(userID)) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('본인만 글 수정이 가능합니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	CommodityDTO commodityDTO = commodityDAO.getWritten(writtenID);
	Result = commodityDAO.deleteWritten(writtenID);
	
	String uploadPath = request.getServletContext().getRealPath("CommodityFile");
	String ImageUploadPath = request.getServletContext().getRealPath("CoverImage");
	
	if(Result==-1||Result==0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생했습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	} else {
		File file = new File(uploadPath+"/"+commodityDTO.getFile());
		File coverFile = new File(ImageUploadPath+"/"+commodityDTO.getCoverImage());
		if( file.exists() ){
			if(file.delete()){
				
				if( coverFile.exists() ){
					if(coverFile.delete()){ System.out.println("파일삭제 성공");
					}
					else{ System.out.println("파일삭제 실패"); }
				}
				
				System.out.println("파일삭제 성공"); 
			}
			else{ System.out.println("파일삭제 실패"); }
		}
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = document.referrer;");
		script.println("</script>");
		script.close();
	}

%>
</body>
</html>