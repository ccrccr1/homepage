package utility;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class Utility {
	
	public static List<String> getDay(){
		List<String> list = new ArrayList<String>();
		
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		for(int i=0; i<3; i++) {
			list.add(sd.format(cal.getTime()));
			cal.add(Calendar.DATE, -1);
		}
		
		return list;
	}
	public static boolean compareDay(String wdate) {
		boolean flag = false;
		List<String> list = getDay();
		if(wdate.equals(list.get(0)) || wdate.equals(list.get(1)) || wdate.equals(list.get(2))) {
			flag = true;
		}
		return flag;
	}
	
	
	public static String checkNull(String str) {
		if(str==null) {
			str = "";
		}
		return str;
	}
	public static String paging(int totalRecord, int nowPage, int recordPerPage, String col, String word){ 
		   int pagePerBlock = 5; // 블럭당 페이지 수 
		   int totalPage = (int)(Math.ceil((double)totalRecord/recordPerPage)); // 전체 페이지  
		   int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));// 전체 그룹 
		   int nowGrp = (int)(Math.ceil((double)nowPage/pagePerBlock));    // 현재 그룹 
		   int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작  
		   int endPage = (nowGrp * pagePerBlock);             // 특정 그룹의 페이지 목록 종료   
		    
		   StringBuffer str = new StringBuffer(); 
		   str.append("<div style='text-align:center'>"); 
		   str.append("<ul class='pagination'> ");
		   int _nowPage = (nowGrp-1) * pagePerBlock; // 10개 이전 페이지로 이동 
		   if (nowGrp >= 2){ 
		     str.append("<li><a href='./list.jsp?col="+col+"&word="+word+"&nowPage="+_nowPage+"'>이전</A></li>"); 
		   } 
		 
		   for(int i=startPage; i<=endPage; i++){ 
		     if (i > totalPage){ 
		       break; 
		     } 
		 
		     if (nowPage == i){ 
		       str.append("<li class='active'><a href=#>"+i+"</a></li>"); 
		     }else{ 
		       str.append("<li><a href='./list.jsp?col="+col+"&word="+word+"&nowPage="+i+"'>"+i+"</A></li>");   
		     } 
		   } 
		       
		   _nowPage = (nowGrp * pagePerBlock)+1; // 10개 다음 페이지로 이동 
		   if (nowGrp < totalGrp){ 
		     str.append("<li><A href='./list.jsp?col="+col+"&word="+word+"&nowPage="+_nowPage+"'>다음</A></li>"); 
		   } 
		   str.append("</ul>"); 
		   str.append("</div>"); 
		    
		   return str.toString(); 
		}
}
