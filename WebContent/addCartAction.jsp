<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Curve - 장바구니 추가</title>
</head>
<body>
<% 
	int writtenID=0;
	ArrayList<Integer> cart = (ArrayList)session.getAttribute("cart");
	
	if(cart==null) {
		cart = new ArrayList<Integer>();
		session.setAttribute("cart", cart);
	}
	
	if(request.getParameter("ID")!=null)
		writtenID=Integer.parseInt(request.getParameter("ID"));
	
	if(writtenID<0) {
		for(int i=0; i<cart.size(); i++) {
			if(cart.get(i).equals(writtenID*-1)) {
				cart.remove(i);
				break;
			}
		}
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='shopping_cart.jsp';");
		script.println("</script>");
		script.close();
	}
	else {
		cart.add(writtenID);
	}
	System.out.println(cart);
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("history.back()");
	script.println("</script>");
	script.close();
	
%>
</body>
</html>