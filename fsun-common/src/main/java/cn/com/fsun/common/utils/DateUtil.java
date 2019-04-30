package cn.com.fsun.common.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

	public static final String DATETIME_FORMATE = "yyyy-MM-dd HH:mm:ss";
	public static final String DATE_FORMATE = "yyyy-MM-dd";

	public static String formateDate(Date date, String format) {
		DateFormat df = new SimpleDateFormat(format);
		return df.format(date);
	}

	public static String formateDate(String date, String format) {
		DateFormat df = new SimpleDateFormat(format);
		return df.format(date);
	}

	public static Date parse(String date, String format) {
		DateFormat sdf = new SimpleDateFormat(format);
		try {
			return sdf.parse(date);
		} catch (ParseException e) {
			return null;
		}
	}
	

	public static Date makeEndDate(Date date){
		String dateString = formateDate(date, DATE_FORMATE)+" 23:59:59";
		return parse(dateString, DATETIME_FORMATE);
	}
	
	public static Date makeStartDate(Date date){
		String dateString = formateDate(date, DATE_FORMATE)+" 00:00:00";
		return parse(dateString, DATETIME_FORMATE);
	}
	
	public static String getDate(int type,String formatStr){
		Date date = new Date();
		SimpleDateFormat sdf = null;
		if(null!=formatStr){
		   sdf=new SimpleDateFormat(formatStr);
		}else if(type==0){
			sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		}else if(type==1){
			sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		}else if(type==2){
			sdf=new SimpleDateFormat("yyyyMMdd");
		}
		String str=sdf.format(date);
		return str;
	}
}
