package org.kbs.playto.books.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class CommonUtil {

	
	
	public static String getTime() {
		Calendar calendar = Calendar.getInstance();
    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
    	String date = dateFormat.format(calendar.getTime());
		return date;
	}
	
}
