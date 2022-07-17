
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import chat.ChatDataDAO;
import chat.ChatDataDTO;
import chat.ChatListDAO;
import chat.ChatListDTO;
import commodity.CommodityDAO;
import follow.FollowDAO;
import follow.FollowDTO;
import noti.NotiDAO;
import noti.NotiDTO;
import profileComment.CommentDAO;
import profileComment.CommentDTO;
import profileComment.CommentUnderDAO;
import profileComment.CommentUnderDTO;
import report.ReportDAO;
import report.ReportDTO;
import review.ReviewDAO;
import review.ReviewDTO;
import saves.SavesDAO;
import saves.SavesDTO;
import setting.SettingDAO;
import setting.SettingDTO;
import user.UserDAO;
import user.UserDTO;
import util.AES128;
import util.AES256;
import util.AES256_1;
import util.Gmail;
import util.SHA256;
	
public @interface ajaxAction {
		@WebServlet("/likeAct")
		public class likeAction extends HttpServlet {
		    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        request.setCharacterEncoding("utf-8");
		        response.setContentType("text/html; charset=utf-8");

		        String userID=null;
		    	int writtenID=0;
		    	int Result=0;
		    	
		    	AES128 aes = new AES128();
		    	
		    	HttpSession session=request.getSession();  

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
		    	if(request.getParameter("ID")!=null) 
		    	{
		    		try {
		    			System.out.println(request.getParameter("ID"));
						writtenID = Integer.parseInt(aes.decrypt(request.getParameter("ID")));
					} catch (NumberFormatException | UnsupportedEncodingException | GeneralSecurityException e) {e.printStackTrace();}
		    	}
		    	else { 
		    		PrintWriter script = response.getWriter();
		    		script.println("<script>");
		    		script.println("alert('ID가 없습니다.');");
		    		script.println("history.back();");
		    		script.println("</script>");
		    		script.close();
		    		return;
		    	}
		    	
		    	CommodityDAO commodityDAO = new CommodityDAO();
		    	NotiDAO notiDAO = new NotiDAO();
		    	SettingDAO setDAO = new SettingDAO();
		    	
		    	if( commodityDAO.likeCheck(userID, writtenID) == false ) {
		    		commodityDAO.likeAdd(userID, writtenID);
		    		commodityDAO.likeCountAdd(writtenID);
		    		
		    		if(setDAO.getData(userID).isNotiWrittenGoods()&&commodityDAO.getlikeCount(writtenID)%1==0) {
		    			notiDAO.write(new NotiDTO(userID,commodityDAO.getUserID(writtenID),"goods/"+writtenID,"글의 좋아요 수가 "+commodityDAO.getlikeCount(writtenID)+" 이 되었습니다.",null,0));
		    		}
		    		
		    		PrintWriter script = response.getWriter();
		    		script.println("add");
		    		script.close();
		    	} else {
		    		commodityDAO.likeRemove(userID, writtenID);
		    		commodityDAO.likeCountRemove(writtenID);
		    		
		    		PrintWriter script = response.getWriter();
		    		script.println("remove");
		    		script.close();
		    	}
		    	
		    }
		}
		
		@WebServlet("/login")
		public class login extends HttpServlet {
		    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        request.setCharacterEncoding("utf-8");
		        response.setContentType("text/html; charset=utf-8");
		        
		    	HttpSession session=request.getSession(); 

		    	String userID = null;
		    	String userPassword = null;
		    	String autoLogin = null;
		    	int Result = 3;
		    	
		    	if(request.getParameter("id")!=null)
		    		userID = request.getParameter("id");
		    	if(request.getParameter("password")!=null)
		    		userPassword = request.getParameter("password");
		    	if(request.getParameter("auto")!=null)
		    		autoLogin = request.getParameter("auto");
		    	
		    	UserDAO userDAO = new UserDAO();
		    	AES256_1 AES = new AES256_1();
		    	
		    	Result = userDAO.userLogin(userID, userPassword);
		    	
		    	if(Result == 1) {
		    		if(autoLogin!=null)
		    		{
		    			try {
		    			Cookie login = new Cookie("userID",AES.encrypt(userID)); //쿠키추가
		    			login.setMaxAge(60*60*24*10);
		    			login.setPath("/");
		    			response.addCookie(login);
		    			} catch (Exception e) { e.printStackTrace(); }
		    		}
		    		session.setAttribute("userID", userID);
		    		PrintWriter script = response.getWriter();
		    		script.println("true");
		    		script.close();
		    	} else {
		    		PrintWriter script = response.getWriter();
		    		script.println("false");
		    		script.close();
		    		//System.out.println(""+userID+userPassword+autoLogin);
		    	}
		    }
		}
		
		@WebServlet("/addCart")
		public class addCart extends HttpServlet {
		    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        request.setCharacterEncoding("utf-8");
		        response.setContentType("text/html; charset=utf-8");
		        
		    	HttpSession session=request.getSession();
		    	
		    	AES128 aes = new AES128();

		    	int writtenID=0;
		    	ArrayList<Integer> cart = (ArrayList)session.getAttribute("cart");
		    	
		    	if(cart==null) {
		    		cart = new ArrayList<Integer>();
		    		session.setAttribute("cart", cart);
		    	}
		    	
		    	if(request.getParameter("ID")!=null) {
		    		try {
						writtenID = Integer.parseInt(aes.decrypt(request.getParameter("ID")));
					} catch (NumberFormatException | UnsupportedEncodingException | GeneralSecurityException e) {e.printStackTrace();}
		    	}
		    	
		    	if(writtenID<0) {
		    		for(int i=0; i<cart.size(); i++) {
		    			if(cart.get(i).equals(writtenID*-1)) {
		    				cart.remove(i);
		    				break;
		    			}
		    		}
		    	}
		    	else {
		    		cart.add(writtenID);
		    	}
		    	System.out.println(cart);
		    }
		}
		
		@WebServlet("/addReview")
		public class addReview extends HttpServlet {
		    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        request.setCharacterEncoding("utf-8");
		        response.setContentType("text/html; charset=utf-8");
		        
		        AES128 aes = new AES128();
		        
		    	HttpSession session=request.getSession(); 

		    	String userID=null;
		    	String description=null;
		    	int rate=0;
		    	int writtenID=0;
		    	
		    	int Result=0;

		    	if(session.getAttribute("userID")!=null)
		    		userID=(String)session.getAttribute("userID");
		    	else {
		    		PrintWriter script = response.getWriter();
		    		script.println("로그인이 필요합니다.");
		    		script.close();
		    		return;
		    	}
		    	
		    	if(request.getParameter("description")!=null)
		    		description=request.getParameter("description");
		    	if(request.getParameter("rate")!=null)
		    		rate=Integer.parseInt(request.getParameter("rate"));
		    	if(request.getParameter("writtenID")!=null) {
		    		try {
						writtenID = Integer.parseInt(aes.decrypt(request.getParameter("writtenID")));
					} catch (NumberFormatException | UnsupportedEncodingException | GeneralSecurityException e) {e.printStackTrace();}

		    	}
		    	
		    	if(description==null || rate==0 || writtenID==0) {
		    		PrintWriter script = response.getWriter();
		    		script.println("입력되지 않은 사항이 있습니다.");
		    		script.close();
		    		System.out.println(description+" "+rate+" "+writtenID);
		    		return;
		    	}
		    	
		    	ReviewDAO reviewDAO = new ReviewDAO();
		    	CommodityDAO commodityDAO = new CommodityDAO();
		    	NotiDAO notiDAO = new NotiDAO();
		    	SettingDAO setDAO = new SettingDAO();
		    	UserDAO userDAO = new UserDAO();
		    	
		    	Result=reviewDAO.write(new ReviewDTO(userID,writtenID,description,rate,null,0));
		    	if(Result==0||Result==-1) {
		    		PrintWriter script = response.getWriter();
		    		script.println("오류가 발생했습니다.");
		    		script.close();
		    	}else {
		    		PrintWriter script = response.getWriter();
		    		script.println("success");
		    		script.close();
		    		
		    		if(setDAO.getData(userID).isNotiWrittenReview()) {
		    			notiDAO.write(new NotiDTO(userID,commodityDAO.getUserID(writtenID),"review/"+writtenID,"님께서 리뷰를 작성 하셨습니다.",null,0));
		    		}
		    	}
		    }
		}
		
		@WebServlet("/report")
		public class report extends HttpServlet {
		    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        request.setCharacterEncoding("utf-8");
		        response.setContentType("text/html; charset=utf-8");
		        
		    	HttpSession session=request.getSession(); 
		    	
		    	AES128 aes = new AES128();

		    	String userID=null;
		    	String description=null;
		    	int writtenID=0;
		    	int reviewID=0;
		    	
		    	int Result=0;

		    	if(session.getAttribute("userID")!=null)
		    		userID=(String)session.getAttribute("userID");
		    	else {
		    		PrintWriter script = response.getWriter();
		    		script.println("로그인이 필요합니다.");
		    		script.close();
		    		return;
		    	}
		    	
		    	if(request.getParameter("description")!=null)
		    		description=request.getParameter("description");
		    	if(request.getParameter("writtenID")!=null) {
		    		try {
						writtenID = Integer.parseInt(aes.decrypt(request.getParameter("writtenID")));
					} catch (NumberFormatException | UnsupportedEncodingException | GeneralSecurityException e) {e.printStackTrace();}

		    	}
		    	if(request.getParameter("reviewID")!=null)
		    		reviewID=Integer.parseInt(request.getParameter("reviewID"));
		    	
		    	if(description==null || (writtenID==0&&reviewID==0)) {
		    		PrintWriter script = response.getWriter();
		    		script.println("입력되지 않은 사항이 있습니다.");
		    		script.close();
		    		System.out.println(description+""+writtenID);
		    		return;
		    	}
		    	
		    	ReportDAO reportDAO = new ReportDAO();
		    	
		    	Result=reportDAO.write(new ReportDTO(userID,writtenID,reviewID,description,null,0,false));
		    	if(Result==0||Result==-1) {
		    		PrintWriter script = response.getWriter();
		    		script.println("오류가 발생했습니다.");
		    		script.close();
		    	}else {
		    		PrintWriter script = response.getWriter();
		    		script.println("success");
		    		script.close();
		    	}
		    }
		}
		
		@WebServlet("/removeSave")
		public class removeSave extends HttpServlet {
		    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        request.setCharacterEncoding("utf-8");
		        response.setContentType("text/html; charset=utf-8");
		        
		    	HttpSession session=request.getSession();

		    	String userID=null;
		    	int ID=0;
		    	
		    	int Result=0;

		    	if(session.getAttribute("userID")!=null)
		    		userID=(String)session.getAttribute("userID");
		    	else {
		    		PrintWriter script = response.getWriter();
		    		script.println("로그인이 필요합니다.");
		    		script.close();
		    		return;
		    	}
		    	
		    	if(request.getParameter("ID")!=null) {
		    		try {
						ID = Integer.parseInt(request.getParameter("ID"));
					} catch (NumberFormatException e) {e.printStackTrace();}
		    	}
		    	
		    	if(ID==0) {
		    		PrintWriter script = response.getWriter();
		    		script.println("입력되지 않은 사항이 있습니다.");
		    		script.close();
		    		return;
		    	}
		    	
		    	SavesDAO saveDAO = new SavesDAO();
		    	
		    	Result=saveDAO.delete(ID,userID);
		    	if(Result==0||Result==-1) {
		    		PrintWriter script = response.getWriter();
		    		script.println("오류가 발생했습니다.");
		    		script.close();
		    	}else {
		    		PrintWriter script = response.getWriter();
		    		script.println("success");
		    		script.close();
		    	}
		    	
		    }
		}
		
		@WebServlet("/save")
		public class save extends HttpServlet {
		    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        request.setCharacterEncoding("utf-8");
		        response.setContentType("text/html; charset=utf-8");
		        
		    	HttpSession session=request.getSession(); 
		    	
		    	AES128 aes = new AES128();

		    	String userID=null;
		    	int writtenID=0;
		    	
		    	int Result=0;

		    	if(session.getAttribute("userID")!=null)
		    		userID=(String)session.getAttribute("userID");
		    	else {
		    		PrintWriter script = response.getWriter();
		    		script.println("로그인이 필요합니다.");
		    		script.close();
		    		return;
		    	}
		    	
		    	if(request.getParameter("writtenID")!=null) {
		    		try {
						writtenID = Integer.parseInt(aes.decrypt(request.getParameter("writtenID")));
					} catch (NumberFormatException | UnsupportedEncodingException | GeneralSecurityException e) {e.printStackTrace();}

		    	}
		    	
		    	if(writtenID==0) {
		    		PrintWriter script = response.getWriter();
		    		script.println("입력되지 않은 사항이 있습니다.");
		    		script.close();
		    		return;
		    	}
		    	
		    	SavesDAO saveDAO = new SavesDAO();
		    	
		    	Result=saveDAO.insert(new SavesDTO(0,userID,writtenID));
		    	if(Result==0||Result==-1) {
		    		PrintWriter script = response.getWriter();
		    		script.println("오류가 발생했습니다.");
		    		script.close();
		    	}else {
		    		PrintWriter script = response.getWriter();
		    		script.println("success");
		    		script.close();
		    	}
		    	
		    }
		}
		
		@WebServlet("/setSale")
		public class setSales extends HttpServlet {
		    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        request.setCharacterEncoding("utf-8");
		        response.setContentType("text/html; charset=utf-8");

		        AES128 aes = new AES128();
		        
		        String userID=null;
		        String writterID=null;
		    	int writtenID=0;
		    	int Result=0;
		    	
		    	int saleAmount=0;
		    	String saleDate=null;
		    	
		    	String saleDates[]=null;

		    	if(request.getParameter("writtenID")!=null)  {
						try {
							writtenID = Integer.parseInt(aes.decrypt(request.getParameter("writtenID")));
						} catch (UnsupportedEncodingException | GeneralSecurityException e) {
							e.printStackTrace();
						}
		    	}
		    	else { 
		    		PrintWriter script = response.getWriter();
		    		script.println("할인 대상이 선택되지 않았습니다.");
		    		script.close();
		    		return;
		    	}
		    	
		    	if(request.getParameter("saleAmount")!=null)
		    		saleAmount=Integer.parseInt(request.getParameter("saleAmount"));
		    	else {
		    		PrintWriter script = response.getWriter();
		    		script.println("할인률이 선택되지 않았습니다.");
		    		script.close();
		    		return;
		    	}
		    	
		    	if(request.getParameter("saleDate")!=null)
		    		saleDate=request.getParameter("saleDate");
		    	else {
		    		PrintWriter script = response.getWriter();
		    		script.println("할인 기간이 선택되지 않았습니다.");
		    		script.close();
		    		return;
		    	}
		    	
		    	CommodityDAO commodityDAO = new CommodityDAO();
		    	
		    	HttpSession session=request.getSession();  

		    	writterID = commodityDAO.getUserID(writtenID);
		    	if(session.getAttribute("userID")!=null) {
		    		userID=(String)session.getAttribute("userID");
		    		if(!writterID.equals(userID)) {
		    			System.out.println(commodityDAO.getUserID(writtenID)+"|"+userID);
		    			PrintWriter script = response.getWriter();
			    		script.println("자신의 글 이외에는 할인을 걸 수 없습니다.");
			    		script.close();
			    		return;
		    		}
		    	}
		    	else {
		    		PrintWriter script = response.getWriter();
		    		script.println("로그인이 필요합니다.");
		    		script.close();
		    		return;
		    	}
		    	saleDates = saleDate.split(" - ");
		    	if(saleDates.length==1) {
		    		saleDate=saleDate+" - 2025-01-01 0:0";
		    		saleDates = saleDate.split(" - ");
		    	}
		    	Result=commodityDAO.writeSaleUpdate(saleAmount,saleDates[0],saleDates[1],writtenID);
		    	if(Result==1) {
		    		PrintWriter script = response.getWriter();
		    		script.println("success");
		    		script.close();
		    		return;
		    	} else {
		    		System.out.println(saleDates[0]+"|"+saleDates[1]);
		    		PrintWriter script = response.getWriter();
		    		script.println("오류가 발생했습니다.");
		    		script.close();
		    		return;
		    	}
		    }
		}
		
		@WebServlet("/deleteSale")
		public class deleteSale extends HttpServlet {
		    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        request.setCharacterEncoding("utf-8");
		        response.setContentType("text/html; charset=utf-8");

		        String userID=null;
		        String writterID=null;
		    	int writtenID=0;
		    	int Result=0;
		    	
		    	AES128 aes = new AES128();

		    	if(request.getParameter("writtenID")!=null) {
		    		try {
						writtenID = Integer.parseInt(aes.decrypt(request.getParameter("writtenID")));
					} catch (NumberFormatException | UnsupportedEncodingException | GeneralSecurityException e) {e.printStackTrace();}

		    	}
		    	else { 
		    		PrintWriter script = response.getWriter();
		    		script.println("대상이 선택되지 않았습니다.");
		    		script.close();
		    		return;
		    	}
		    	
		    	
		    	CommodityDAO commodityDAO = new CommodityDAO();
		    	
		    	HttpSession session=request.getSession();  

		    	writterID = commodityDAO.getUserID(writtenID);
		    	if(session.getAttribute("userID")!=null) {
		    		userID=(String)session.getAttribute("userID");
		    		if(!writterID.equals(userID)) {
		    			System.out.println(commodityDAO.getUserID(writtenID)+"|"+userID);
		    			PrintWriter script = response.getWriter();
			    		script.println("자신의 글 이외에는 할인을 걸 수 없습니다.");
			    		script.close();
			    		return;
		    		}
		    	}
		    	else {
		    		PrintWriter script = response.getWriter();
		    		script.println("로그인이 필요합니다.");
		    		script.close();
		    		return;
		    	}
		    	
		    	Result=commodityDAO.deleteSale(writtenID);
		    	if(Result==1) {
		    		PrintWriter script = response.getWriter();
		    		script.println("success");
		    		script.close();
		    		return;
		    	} else {
		    		PrintWriter script = response.getWriter();
		    		script.println("오류가 발생했습니다.");
		    		script.close();
		    		return;
		    	}
		    }
		}
		
		@WebServlet("/profileComment")
		public class profileComment extends HttpServlet {
			protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("utf-8");
		        response.setContentType("text/html; charset=utf-8");
		        
		        HttpSession session=request.getSession();
		        PrintWriter out = response.getWriter();
		        
		        String userID = null;
		        String toName = null;
		        String comment = null;
		        String toID = null;
		        
		        int Result=0;
		        
		        if(session.getAttribute("userID")!=null)
		        	userID=(String)session.getAttribute("userID");
		        else {
		        	out.println("로그인이 필요합니다.");
		        	out.close();
		        	return;
		        }
		        if(request.getParameter("toID")!=null)
		        	toName = request.getParameter("toID");
		        if(request.getParameter("comment")!=null)
		        	comment = request.getParameter("comment");
		       
		        if(toName==null||comment==null||userID==null) {
		        	out.println("올바른 값을 입력하세요.");
		        	out.close();
		        	return;
		        }
		        
		        CommentDAO commentDAO = new CommentDAO();
		        UserDAO userDAO = new UserDAO();
		        
		        toID = userDAO.getUserIdFromName(toName);
		        
		        Result = commentDAO.write(new CommentDTO(0, userID, toID, comment, 0, 0, null, null, null));
		        
		        if(Result==0||Result==-1) {
		        	out.println("오류가 발생했습니다.");
		        	out.close();
		        	return;
		        } else {
		        	out.println("success");
		        }
		        
		        out.close();
		        return;
			}
			
		}
		
		@WebServlet("/profileCommentUnder")
		public class profileCommentUnder extends HttpServlet {
			protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("utf-8");
		        response.setContentType("text/html; charset=utf-8");
		        
		        HttpSession session=request.getSession();
		        PrintWriter out = response.getWriter();
		        
		        String userID = null;
		        String comment = null;
		        int toCommentID = 0;
		        
		        int Result=0;
		        
		        if(session.getAttribute("userID")!=null)
		        	userID=(String)session.getAttribute("userID");
		        else {
		        	out.println("로그인이 필요합니다.");
		        	out.close();
		        	return;
		        }
		        if(request.getParameter("toCommentID")!=null)
		        	toCommentID = Integer.parseInt(request.getParameter("toCommentID"));
		        if(request.getParameter("comment")!=null)
		        	comment = request.getParameter("comment");
		       
		        if(toCommentID==0||comment==null||userID==null) {
		        	out.println("올바른 값을 입력하세요.");
		        	out.close();
		        	return;
		        }
		        
		        CommentUnderDAO commentDAO = new CommentUnderDAO();
		        
		        Result = commentDAO.write(new CommentUnderDTO(0,userID,toCommentID,comment,null));
		        
		        if(Result==0||Result==-1) {
		        	out.println("오류가 발생했습니다.");
		        	out.close();
		        	return;
		        } else {
		        	out.println("success");
		        }
		        
		        out.close();
		        return;
			}
			
		}
		
		@WebServlet("/goodAct")
		public class ProfilegoodAct extends HttpServlet {
			protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("utf-8");
		        response.setContentType("text/html; charset=utf-8");
		        
		        HttpSession session=request.getSession();
		        PrintWriter out = response.getWriter();
		        
		        String userID = null;
		        String goodBad = null;
		        boolean isGood = false;
		        int commentID = 0;
		        
		        int Result=0;
		        
		        if(session.getAttribute("userID")!=null)
		        	userID=(String)session.getAttribute("userID");
		        else {
		        	out.println("로그인이 필요합니다.");
		        	out.close();
		        	return;
		        }
		        if(request.getParameter("commentID")!=null)
		        	commentID = Integer.parseInt(request.getParameter("commentID"));
		        if(request.getParameter("isGood")!=null)
		        	goodBad = request.getParameter("isGood");
		       
		        if(commentID==0||userID==null||goodBad==null) {
		        	out.println("올바른 값을 입력하세요.");
		        	out.close();
		        	return;
		        }
		        
		        CommentDAO commentDAO = new CommentDAO();
		        UserDAO userDAO = new UserDAO();
		        
		        Result=commentDAO.isCheck(userID, commentID);
		        
		        if(goodBad.equals("good")) {
		        	isGood = true;
		        } else {
		        	isGood = false;
		        }
		        if(Result==-1) {
		        	commentDAO.badRemove(userID, commentID);
	        		commentDAO.goodRemove(userID, commentID);
		        	System.out.println("err 701 "+userID+"|"+commentID);
		        	out.close();
		        	return;
		        }
		        if(isGood) { //만약 사용자가 좋아요 버튼을 눌렀다면
			        if(Result==0) {
			        	commentDAO.goodAdd(userID, commentID);
			        	commentDAO.goodCountAdd(commentID);
			        	out.println("good");
			        } else {
			        	if(Result==2) {
			        		commentDAO.badRemove(userID, commentID);
			        		commentDAO.badCountRemove(commentID);
			        		
			        		commentDAO.goodAdd(userID, commentID);
				        	commentDAO.goodCountAdd(commentID);
				        	out.println("good");
			        	}
			        	if(Result==1) {
				        	commentDAO.goodRemove(userID, commentID);
				        	commentDAO.goodCountRemove(commentID);
				        	out.println("bad");
			        	}
			        }
			        //out.println("good");
		        } else { //만약 사용자가 싫어요 버튼을 눌렀다면
		        	if(Result==0) {
		        		commentDAO.badAdd(userID, commentID);
		        		commentDAO.badCountAdd(commentID);
		        		out.println("bad");
		        	} else {
		        		if(Result==2) {
			        		commentDAO.badRemove(userID, commentID);
			        		commentDAO.badCountRemove(commentID);
			        		out.println("good");
			        	}
			        	if(Result==1) {
				        	commentDAO.goodRemove(userID, commentID);
				        	commentDAO.goodCountRemove(commentID);
				        	
			        		commentDAO.badAdd(userID, commentID);
			        		commentDAO.badCountAdd(commentID);
			        		out.println("bad");
			        	}
		        	}
			        //out.println("bad");
		        }
		        
		        out.close();
		        return;
			}
			
		}
		
		
		
		@WebServlet("/aesEn")
		public class aesEn extends HttpServlet {
		    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        request.setCharacterEncoding("utf-8");
		        response.setContentType("text/html; charset=utf-8");
		        
		        HttpSession session=request.getSession();

		        String userName=null;
		        String userID=null; //여기서 userID 는 toID 를 뜻함. 즉 보낼 대상을 뜻한다
		        String myID = null;
		        
		        AES256 aes256 = new AES256();
		        UserDAO userDAO = new UserDAO();
		        ChatListDAO chatListDAO = new ChatListDAO();
		        
		        if(request.getParameter("name")!=null)
		        	userName = request.getParameter("name");
		        else {
		        	PrintWriter out = response.getWriter();
		        	out.println("error");
		        	out.close();
		        }
		        
		        if(session.getAttribute("userID")!=null)
		        	myID = (String)session.getAttribute("userID");
		        else {
		        	PrintWriter out = response.getWriter();
		        	out.println("로그인이 필요합니다.");
		        	out.close();
		        }
		        
		        userID=userDAO.getUserIdFromName(userName);
		        PrintWriter out = response.getWriter();
	        	try {
					out.println(aes256.encrypt(userID));
				} catch (UnsupportedEncodingException e) {e.printStackTrace();} catch (GeneralSecurityException e) {e.printStackTrace();}
	        	out.close();
	        	session.setAttribute("selChat", userID);
	        	
	        	chatListDAO.removeNews(myID, userID);
		    }
		}
		
		@WebServlet("/emailCheck")
		public class emailCheck extends HttpServlet {
		    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        request.setCharacterEncoding("utf-8");
		        response.setContentType("text/html; charset=utf-8");

		    	String userID=null;
		    	
		    	int Result=0;
		    	
		    	UserDAO userDAO = new UserDAO();
		    	SHA256 sha256 = new SHA256();
		    	
		    	HttpSession session=request.getSession();  

		    	if(session.getAttribute("userID")!=null) {
		    		userID=(String)session.getAttribute("userID");
		    	}
		    	else {
		    		PrintWriter script = response.getWriter();
		    		script.println("로그인이 필요합니다.");
		    		script.close();
		    		return;
		    	}
		    	
		    	boolean emailChecked = userDAO.getUserEmailChecked(userID); //이메일 체크 확인
		    	if(emailChecked == true) {
		    		PrintWriter script = response.getWriter();
		    		script.println("이미 이메일 인증을 하셨습니다.");
		    		script.close();
		    	}
		    	
		    	String host = "http://localhost:8080/CRUVE/"; //현재 웹사이트 주소
		    	String from = "VencoderEM@gmail.com"; 
		    	String to = userDAO.getUserEmail(userID);
		    	String subject = "Curve 이메일 인증 메일입니다.";
		    	String content = "링크에 접속하여 이메일 인증을 진행하세요" +
		    		"<a href='"+host+"emailCheck.jsp?code="+new SHA256().getSHA256(to)+"'>이메일 인증하기</a>";
		    	
		    		//실제로 SMTP에 접속할 정보를 넣기위해
		    	Properties p = new Properties();
		    	p.put("mail.smtp.user",from);
		    	p.put("mail.smtp.host","smtp.googlemail.com");
		    	p.put("mail.smtp.port","465");
		    	p.put("mail.smtp.starttls.enable","true");
		    	p.put("mail.smtp.auth","true");
		    	p.put("mail.smtp.debug","true");
		    	p.put("mail.smtp.socketFactory.port","465");
		    	p.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		    	p.put("mail.smtp.socketFactory.fallback","false");
		        p.put("mail.smtp.connectiontimeout", "t1");
		        p.put("mail.smtp.timeout", "t2");
		    	
		    	try {
		    		Authenticator auth = new Gmail();
		    		Session ses = Session.getInstance(p, auth);
		    		ses.setDebug(true);
		    		MimeMessage msg = new MimeMessage(ses);
		    		msg.setSubject(subject);
		    		Address fromAddr = new InternetAddress(from);
		    		msg.setFrom(fromAddr);
		    		Address toAddr = new InternetAddress(to);
		    		msg.addRecipient(Message.RecipientType.TO, toAddr);
		    		msg.setContent(content,"text/html;charset=UTF8");
		    		Transport.send(msg);
		    	} catch (Exception e) {
		    		e.printStackTrace();
		    		PrintWriter script = response.getWriter();
		    		script.println("이메일 전송을 하는 도중, 오류가 발생했습니다.");
		    		script.close();
		    	}
			}
		}
		
		@WebServlet("/addChatList")
		public class addChatList extends HttpServlet {
		    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        request.setCharacterEncoding("utf-8");
		        response.setContentType("text/html; charset=utf-8");

		    	String userID=null;
		    	String toID=null;
		    	int Result=0;
		    	
		    	UserDAO userDAO = new UserDAO();
		    	ChatListDAO chatListDAO = new ChatListDAO();
		    	
		    	HttpSession session=request.getSession();  

		    	if(session.getAttribute("userID")!=null) {
		    		userID=(String)session.getAttribute("userID");
		    	}
		    	else {
		    		PrintWriter script = response.getWriter();
		    		script.println("로그인이 필요합니다.");
		    		script.close();
		    		return;
		    	}
		    	
		    	if(request.getParameter("toName")!=null)
		    		toID=request.getParameter("toName");
		    	else {
		    		PrintWriter script = response.getWriter();
		    		script.println("일부 정보가 기입되지 않았습니다.");
		    		script.close();
		    		return;
		    	}
		    	
		    	if(userDAO.getUserIdFromName(toID)==null) {
		    		PrintWriter script = response.getWriter();
		    		script.println("해당 유저는 존재하지 않습니다.");
		    		script.close();
		    		return;
		    	}
		    	toID = userDAO.getUserIdFromName(toID);
		    	
		    	if(chatListDAO.getChat(userID, toID)) {
		    		PrintWriter script = response.getWriter();
		    		script.println("이미 해당 대화상대가 추가 되어있습니다.");
		    		script.close();
		    		return;
		    	}
		    	
		    	Result=chatListDAO.write(new ChatListDTO(userID,toID,null,0,0));
		    	if(Result==0||Result==-1) {
		    		PrintWriter script = response.getWriter();
		    		script.println("처리 도중 오류가 발생했습니다.");
		    		script.close();
		    		return;
		    	} else {
		    		PrintWriter script = response.getWriter();
		    		script.println("success");
		    		script.close();
		    	}
			}
		}
		
		@WebServlet("/deleteChatList")
		public class deleteChatList extends HttpServlet {
		    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        request.setCharacterEncoding("utf-8");
		        response.setContentType("text/html; charset=utf-8");

		        int chatID=0;
		        
		        ChatDataDAO chatDataDAO = new ChatDataDAO();
		        ChatListDAO chatListDAO = new ChatListDAO();
		        
		        if(request.getParameter("chatID")!=null)
		        	chatID = Integer.parseInt(request.getParameter("chatID"));
		        else {
		        	PrintWriter out = response.getWriter();
		        	out.println("error");
		        	out.close();
		        }
		        ChatListDTO chatDTO = new ChatListDTO();
		        chatDTO = chatListDAO.getChat(chatID);
		        chatDataDAO.deleteData(chatDTO.getUserID(),chatDTO.getToID());
		        chatListDAO.deleteList(chatID);
		    }
		}
		
		@WebServlet("/deleteProfileComment")
		public class deleteProfileComment extends HttpServlet {
		    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        request.setCharacterEncoding("utf-8");
		        response.setContentType("text/html; charset=utf-8");
		        
		        HttpSession session=request.getSession(); 
		        CommentDAO comment = new CommentDAO();
		        
		        int commentID = 0;
		        String userID = null;
		        
		        if(session.getAttribute("userID")!=null) {
		        	userID = (String)session.getAttribute("userID");
		        } else {
		        	PrintWriter out = response.getWriter();
		        	out.println("로그인이 필요합니다.");
		        	out.close();
		        	return;
		        }
		        
		        if(request.getParameter("commentID")!=null) {
		        	try {
		        		commentID = Integer.parseInt(request.getParameter("commentID"));
		        	} catch(Exception e) {e.printStackTrace();}
		        } else {
		        	PrintWriter out = response.getWriter();
		        	out.println("비 정상적인 접근입니다.");
		        	out.close();
		        	return;
		        }
		       
		        if(comment.isMy(userID, commentID)) {
			        comment.delete(commentID);
			        comment.deleteUnder(commentID);
			        PrintWriter out = response.getWriter();
		        	out.println("success");
		        	out.close();
		        } else {
		        	PrintWriter out = response.getWriter();
		        	out.println("자신의 글 이외엔 삭제가 불가능합니다.");
		        	out.close();
		        	return;
		        }
		        
		    }
		}
		
		@WebServlet("/deleteProfileCommentUnder")
		public class deleteProfileCommentUnder extends HttpServlet {
		    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        request.setCharacterEncoding("utf-8");
		        response.setContentType("text/html; charset=utf-8");
		        
		        HttpSession session=request.getSession(); 
		        CommentUnderDAO comment = new CommentUnderDAO();
		        
		        int commentID = 0;
		        String userID = null;
		        
		        if(session.getAttribute("userID")!=null) {
		        	userID = (String)session.getAttribute("userID");
		        } else {
		        	PrintWriter out = response.getWriter();
		        	out.println("로그인이 필요합니다.");
		        	out.close();
		        	return;
		        }
		        
		        if(request.getParameter("commentID")!=null) {
		        	try {
		        		commentID = Integer.parseInt(request.getParameter("commentID"));
		        	} catch(Exception e) {e.printStackTrace();}
		        } else {
		        	PrintWriter out = response.getWriter();
		        	out.println("비 정상적인 접근입니다.");
		        	out.close();
		        	return;
		        }
		       
		        if(comment.isMy(userID, commentID)) {
			        comment.delete(commentID);
			        PrintWriter out = response.getWriter();
		        	out.println("success");
		        	out.close();
		        } else {
		        	PrintWriter out = response.getWriter();
		        	out.println("자신의 글 이외엔 삭제가 불가능합니다.");
		        	out.close();
		        	return;
		        }
		        
		    }
		}
		
		@WebServlet("/deleteNoti")
		public class deleteNoti extends HttpServlet {
		    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        request.setCharacterEncoding("utf-8");
		        response.setContentType("text/html; charset=utf-8");
		        
		        NotiDAO notiDAO = new NotiDAO();
		        
		    	HttpSession session=request.getSession(); 

		    	int ID=0;
		    	int Result=0;
		    	String userID=null;
		    	
		    	if(request.getParameter("ID")!=null)
		    		ID=Integer.parseInt(request.getParameter("ID"));
		    	if(session.getAttribute("userID")!=null)
		    		userID=(String)session.getAttribute("userID");
		    	
		    	Result = notiDAO.deleteNoti(ID,userID);
		    }
		}
		
		
		@WebServlet("/NotiSave")
		public class NotiSave extends HttpServlet {
		    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        request.setCharacterEncoding("utf-8");
		        response.setContentType("text/html; charset=utf-8");
		        
		        SettingDAO setting = new SettingDAO();
		    	HttpSession session=request.getSession(); 
		    	PrintWriter out = response.getWriter();
		    	
		    	boolean NotiProfileActive=false;
		    	boolean NotiWrittenReview=false;
		    	boolean NotiWrittenBuy=false;
		    	boolean NotiWrittenGoods=false;
		    	boolean NotiComment=false;
		    	boolean NotiEmail=false;
		    	boolean PublicEmail = false;
		    	boolean PublicProfile = false;
		    	boolean PublicMessage = false;
		    	
		    	int Result=0;
		    	String userID=null;
		    	
		    	if(session.getAttribute("userID")!=null)
		    		userID=(String)session.getAttribute("userID");
		    	else {
		    		out.println("유저 아이디가 없습니다.");
		    		return;
		    	}
		    	
		    	try {
		    		NotiProfileActive = Boolean.parseBoolean(request.getParameter("NotiProfile"));
		    		NotiWrittenReview = Boolean.parseBoolean(request.getParameter("NotiReview"));
		    		NotiWrittenBuy = Boolean.parseBoolean(request.getParameter("NotiBuy"));
		    		NotiWrittenGoods = Boolean.parseBoolean(request.getParameter("NotiGoods"));
		    		NotiComment = Boolean.parseBoolean(request.getParameter("NotiComment"));
		    		NotiEmail = Boolean.parseBoolean(request.getParameter("NotiEmail"));
		    		PublicEmail = Boolean.parseBoolean(request.getParameter("PublicEmail"));
		    		PublicProfile = Boolean.parseBoolean(request.getParameter("PublicProfile"));
		    		PublicMessage = Boolean.parseBoolean(request.getParameter("PublicMessage"));
		    	} catch(Exception e) {
		    		out.println("오류가 발생했습니다.");
			    	out.close();
		    		return;
		    	} 
		    	
		    	Result = setting.upsert(new SettingDTO(userID,NotiProfileActive,NotiWrittenReview,NotiWrittenBuy,NotiWrittenGoods,NotiComment,NotiEmail,PublicEmail,PublicProfile,PublicMessage));
		    	
		    	if(Result==0) {
		    		out.println("오류가 발생했습니다. code : 730");
			    	out.close();
		    		return;
		    	} else if(Result==-1) {
		    		out.println("DB 오류가 발생했습니다. code : 733");
			    	out.close();
		    		return;
		    	} else {
		    		out.println("success");
		    	}
		    	out.close();
		    	
		    }
		}
		
		@WebServlet("/setMode")
		public class setMode extends HttpServlet {
		    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        request.setCharacterEncoding("utf-8");
		        response.setContentType("text/html; charset=utf-8");

		    	HttpSession session=request.getSession();  
		    	
		    	if(session.getAttribute("mode")!=null) {
			    	if((Boolean)session.getAttribute("mode")==true) {
			    		session.setAttribute("mode", false);
			    		System.out.print("session2");
			    	} else if((Boolean)session.getAttribute("mode")==false) {
			    		session.setAttribute("mode", true);
			    		System.out.print("session3");
			    	}
		    	} else {
		    		session.setAttribute("mode", true);
		    		System.out.print("session ㅓㅇㅂ승ㅁ");
		    	}
		    }
		}
		
		@WebServlet("/registerCheck")
		public class registerCheck extends HttpServlet {
		    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        request.setCharacterEncoding("utf-8");
		        response.setContentType("text/html; charset=utf-8");
		        
		        String userName=null;
		    	String userID=null;
		    	String userEmail=null;
		    	
		    	int Result=0;
		    	int Result1=0;
		    	
		    	if(request.getParameter("name")!=null)
		    		userName = request.getParameter("name");
		    	if(request.getParameter("id")!=null)
		    		userID = request.getParameter("id");
		    	if(request.getParameter("email")!=null)
		    		userEmail = request.getParameter("email");
		    	
		    	UserDAO userDAO = new UserDAO();
		    	
		    	Result = userDAO.userJoinCheckID(userID);
		    	if(Result == 1) {
		    		Result1 = userDAO.userJoinCheckName(userName);
		    		if(Result1 == 1) {
		    			Result=0;
		    			Result1=0;
		    		} else {
		    			PrintWriter script = response.getWriter();
		    			script.println("err=1");
		    			script.close();
		    			return;
		    		}
		    	} else {
		    		Result1 = userDAO.userJoinCheckName(userName);
		    		if(Result1 == 1) {
		    			PrintWriter script = response.getWriter();
		    			script.println("err=2");
		    			script.close();
		    			return;
		    		} else {
		    			PrintWriter script = response.getWriter();
		    			script.println("err=3");
		    			script.close();
		    			return;
		    		}
		    	}
		    	
		    }
		}
		
		@WebServlet("/setFollow")
		public class setFollow extends HttpServlet {
		    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        request.setCharacterEncoding("utf-8");
		        response.setContentType("text/html; charset=utf-8");
		        
		        String ID=null;
		        String userID=null;
		        
		        int Result=0;
		        
		        FollowDAO follow = new FollowDAO();
		        UserDAO userDAO = new UserDAO();
		        
		        PrintWriter out = response.getWriter();
		        HttpSession session=request.getSession();  
		        
		        if(request.getParameter("ID")!=null)
		        	ID=request.getParameter("ID");
		        else {
		        	out.println("잘못된 접근입니다");
			        out.close();
		        	return;
		        }
		        
		        ID=userDAO.getUserIdFromName(ID);
		        
		        if(session.getAttribute("userID")!=null)
		        	userID=(String)session.getAttribute("userID");
		        else {
		        	out.println("로그인이 필요합니다");
			        out.close();
		        	return;
		        }
		        
		        if(!follow.isFollow(userID, ID)) {
		        	Result=follow.insert(new FollowDTO(0,userID,ID,false)); //대상을 팔로우중이지 않을떄
		        } else {
		        	Result=follow.delete(userID,ID); //대상을 팔로우중일떄
		        }
		        
		        if(Result==1) {
		        	out.println("success");
		        } else {
		        	out.println("오류");
		        }
		        
		        out.close();
		    	
		    }
		}
		
		@WebServlet("/setReportCancel")
		public class reportCancel extends HttpServlet {
		    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        request.setCharacterEncoding("utf-8");
		        response.setContentType("text/html; charset=utf-8");
		        HttpSession session=request.getSession(); 
		        
		        ReportDAO rep = new ReportDAO();
		        PrintWriter out = response.getWriter();
		        
		        int id = 0;
		        String userID = null;
		        
		        if(request.getParameter("id")!=null) {
		        	id=Integer.parseInt(request.getParameter("id"));
		        } else {
		        	out.println("잘못된 접근입니다.");
		        	out.close();
		        	return;
		        }
		        
		        if(session.getAttribute("userID")!=null) {
		        	userID = (String)session.getAttribute("userID");
		        } else {
		        	out.println("로그인이 필요합니다.");
		        	out.close();
		        	return;
		        }
		        
		        if(rep.isMy(userID, id)==true) {
		        	if(!userID.equals("1324qqww")) {
			        	if(rep.delete(id)==1) {
			        		rep.setCheck(true,id);
			        		out.println("success");
				        	out.close();
				        	return;
			        	} else {
			        		out.println("error");
				        	out.close();
				        	return;
			        	}
		        	} else { //만약 대상이 관리자라면
		        		rep.setCheck(true,id);
		        		out.println("success");
			        	out.close();
			        	return;
		        	}
		        	
		        } else {
		        	out.println("자신이 신고한 글 이외엔 수정이 불가능합니다");
		        	out.close();
		        	return;
		        }
		        
		    }
		}
		
}
