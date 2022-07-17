package util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateCount {
	
	public class dateClass {
		 int YEAR=0;
		 int MONTH=0;
		 int DAY=0;
		 int HOUR=0;
		 int MINUTE=0;
		 int SECOND=0;
	}
	
	public String date(String Date) throws ParseException {
		if(Date==null) {
			return null;
		}
		
		SimpleDateFormat dateFormat= new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
		Calendar now = Calendar.getInstance();
		Calendar date = Calendar.getInstance();

		dateClass rel = new dateClass();
		
		Date NOW = new Date();
		Date DATE = dateFormat.parse(Date);
		now.setTime(NOW);
		date.setTime(DATE);
		String strNow = dateFormat.format(NOW);
		if(Date.compareTo(strNow)>0) { //지금 시간보다 더 지남
			
		} else { //이미 지났던 시간
			rel.YEAR=now.get(Calendar.YEAR)-date.get(Calendar.YEAR);
			rel.MONTH=now.get(Calendar.MONTH)-date.get(Calendar.MONTH);
			rel.DAY=now.get(Calendar.DAY_OF_MONTH)-date.get(Calendar.DAY_OF_MONTH);
			rel.HOUR =now.get(Calendar.HOUR_OF_DAY)-date.get(Calendar.HOUR_OF_DAY);
			rel.MINUTE=now.get(Calendar.MINUTE)-date.get(Calendar.MINUTE);
			rel.SECOND=now.get(Calendar.SECOND)-date.get(Calendar.SECOND);
			return overTime(rel);
		}
		return null;
	}
	
	public String overTime(dateClass rel) { //~시간 전 등
		
		int hour = rel.HOUR;
		int min = rel.MINUTE;
		int sec = rel.SECOND;
		int month = rel.MONTH;
		int year = rel.YEAR;
		int day = rel.DAY;
		
		if(year>0)
			return year+" 년전";
		else if(month>0)
			return (month+1)+" 개월전";
		else if(day>0)
			return day+" 일전";
		else if(hour>0)
			return hour+" 시간전";
		else if(min>0)
			return min+" 분전";
		else if(sec>0)
			return sec+" 초전";
		
		return null;
	}
	
}
