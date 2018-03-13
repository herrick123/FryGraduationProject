package com.core.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang.StringUtils;

/**
 * 时间工具
 * @author 黄青山
 *
 */
public class TimeUtil {
	
	/**
	 * 得到传入日期所在周的周一的日期
	 * @param time
	 * @return
	 */
	public static Date getWeek(Date date){
		Calendar cal = Calendar.getInstance();  
        cal.setTime(date);  
        // 获得当前日期是一个星期的第几天  
        int dayWeek = cal.get(Calendar.DAY_OF_WEEK);  
        if (1 == dayWeek) {  
            cal.add(Calendar.DAY_OF_MONTH, -1);  
        }  
        // 设置一个星期的第一天，按中国的习惯一个星期的第一天是星期一  
        cal.setFirstDayOfWeek(Calendar.MONDAY);  
        // 获得当前日期是一个星期的第几天  
        int day = cal.get(Calendar.DAY_OF_WEEK);  
        // 根据日历的规则，给当前日期减去星期几与一个星期第一天的差值  
        cal.add(Calendar.DATE, cal.getFirstDayOfWeek() - day);  
        return cal.getTime();
	}
	
	/**
	 * 获得传入日期所在周的n周后周一的日期
	 * @param week  所在周后第week周
	 * @return
	 */
	public static Date getNextWeekMonday(Date date,int week) {  
        Calendar cal = Calendar.getInstance();  
        cal.setTime(getWeek(date));  
        cal.add(Calendar.DATE, 7*week);  
        return cal.getTime();  
    }
	
	/**
	 * String类型转date类型
	 * @param time
	 * @return
	 */
	public static Date toDate(String time){
		Date date = null;
		if(StringUtils.isEmpty(time)){
			date = TimeUtil.getWeek(new Date());
		}else {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date fdate = new Date();
			try {
				fdate = sdf.parse(time);
			} catch (ParseException e) {
			}
			date = new Date(fdate.getTime());
		}
		return date;
	}
	
	/**
	 * String类型转成date类型
	 * @param time
	 * @return
	 */
	public static Date toFormatDate(String time){
		Date date = null;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date fdate = new Date();
		try {
			fdate = sdf.parse(time);
		} catch (ParseException e) {
		}
		date = new Date(fdate.getTime());
		return date;
	}
	
	
	/**
	 * date转标准格式String类型
	 * @param time
	 * @return
	 */
	public static String toString(Date time){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String date = null;
		date = sdf.format(time);
		return date;
	}
	
	/**
	   * 获取现在时间
	   * 
	   * @return 返回短时间字符串格式yyyy-MM-dd
	   */
	public static String getStringDateShort(){
	   Date currentTime = new Date();
	   SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	   String dateString = formatter.format(currentTime);
	   return dateString;
	}
	
	/**
	 * 得到传入日期之后第i天的日期
	 * @param 
	 * @return
	 */
	public static Date getSpecifiedDayAfter(Date date,int i){ 
		Calendar c = Calendar.getInstance(); 
		c.setTime(date); 
		int day=c.get(Calendar.DATE); 
		c.set(Calendar.DATE,day+i); 
		Date dayAfter = new Date(c.getTimeInMillis());
		return dayAfter; 
	}
	
	/**
	 * 求时间差
	 * @param big
	 * @param small
	 * @return
	 */
	public static int mistiming(java.sql.Date big,java.sql.Date small){
		long from = small.getTime();
		long to = big.getTime();  
		int days = (int) ((to - from)/(1000 * 60 * 60 * 24)); 
		return days;
	}
	
	/**
	 * 得到传入日期的当月第一天日期
	 * @param date
	 * @return
	 */
	public static Date getFristDay(Date date){
		Calendar cale = Calendar.getInstance();  
        cale.setTime(date); 
        cale.add(Calendar.MONTH, 0);
        cale.set(Calendar.DAY_OF_MONTH, 1);
        return cale.getTime();
	}
	
	/**
	 * 得到传入日期的当月最后一天日期
	 * @param date
	 * @return
	 */
	public static Date getLastDay(Date date){
		Calendar cale = Calendar.getInstance();  
        cale.setTime(date); 
        cale.add(Calendar.MONTH, 1);
        cale.set(Calendar.DAY_OF_MONTH, 0);
        return cale.getTime();
	}
	
	
}
