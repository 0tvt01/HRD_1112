package mylib;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Test {

	public static void main(String[] args) throws ParseException {
		Date date=new Date();
		System.out.println(date);
		System.out.println(new String(date.toString()));
		
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date d=sdf.parse("2022-01-03");
		System.out.println(sdf.format(d));
		
		SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd");
		String sdata=sdf2.format(d);
		System.out.println(sdata);
		
		SimpleDateFormat sdf3=new SimpleDateFormat("yyyy년MM월dd일");
		System.out.println(sdf3.format(new Date()));
		
	}

}
	