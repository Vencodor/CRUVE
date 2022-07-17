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
		if(Date.compareTo(strNow)>0) { //���� �ð����� �� ����
			
		} else { //�̹� ������ �ð�
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
	
	public String overTime(dateClass rel) { //~�ð� �� ��
		
		int hour = rel.HOUR;
		int min = rel.MINUTE;
		int sec = rel.SECOND;
		int month = rel.MONTH;
		int year = rel.YEAR;
		int day = rel.DAY;
		
		if(year>0)
			return year+" ����";
		else if(month>0)
			return (month+1)+" ������";
		else if(day>0)
			return day+" ����";
		else if(hour>0)
			return hour+" �ð���";
		else if(min>0)
			return min+" ����";
		else if(sec>0)
			return sec+" ����";
		
		return null;
	}
	
}
