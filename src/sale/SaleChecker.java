package sale;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import commodity.CommodityDAO;
import commodity.CommodityDTO;

@SuppressWarnings("serial")
public class SaleChecker extends HttpServlet {
	public void init() throws ServletException{
		System.out.println( "시간체크 대기" );
		CommodityDAO commodityDAO = new CommodityDAO();
		SimpleDateFormat dateFormat= new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
		
        Runnable runnable = new Runnable() {
            @Override
            public void run() {
            	ArrayList<CommodityDTO> sales = new ArrayList<CommodityDTO>();
            	sales = commodityDAO.getSalesCheck();
            	Date nowTime = new Date();

            	String time = dateFormat.format(nowTime);

            	for(CommodityDTO i : sales) {
            		String start=null;
            		String end=null;

            		try {
            		start = i.getSaleStartDate();
					end = i.getSaleEndDate();
            		} catch(Exception e) {e.printStackTrace();}

            		int check = start.compareTo(time);
            		if(check<0) {
            			if(end.compareTo(time)>0) { //시작 , 종료 날짜속에 있을떄
            				//System.out.println( "조건충족" );
            				commodityDAO.setSaleActive(i.getWrittenID(), true);
            			} else{ //시작일자는 일치하는데 종료 일자가 넘어간 상태 ( 종료 )
            				//System.out.println( "종료 "+time+"|"+end);
            				commodityDAO.setSaleActive(i.getWrittenID(), false);
            			}
            		} else { //시작일자가 맞지 않을때 ( 시작전 )
            			//System.out.println( "시작전" );
            			commodityDAO.setSaleActive(i.getWrittenID(), false);
            		}
            	
            	}
            }
        };
        ScheduledExecutorService service = Executors.newSingleThreadScheduledExecutor();
        service.scheduleAtFixedRate(runnable, 0, 64, TimeUnit.SECONDS);
    }
}
