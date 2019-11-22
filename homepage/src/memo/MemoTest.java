package memo;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class MemoTest {

	public static void main(String[] args) {
		MemoDAO dao = new MemoDAO();
		
		total(dao);
		//list(dao);
		//read(dao);
		//update(dao);
		//create(dao);
		//delete(dao);
		
	}

	private static void total(MemoDAO dao) {
		Map map = new HashMap();
		map.put("col", "title");
		map.put("word", "도서");
		
		p("레코드갯수: " + dao.total(map));
		
	}

	private static void delete(MemoDAO dao) {
		MemoDTO dto = new MemoDTO();
		dto.setMemono(12);
		boolean flag = dao.delete(dto);
		if(flag) {p("성공");}
		else p("실패");
		
	}

	private static void create(MemoDAO dao) {
		
		MemoDTO dto = new MemoDTO();
		
		dto.setTitle("새로만듬2");
		dto.setContent("새로3");
		boolean flag = dao.create(dto);
		if(flag) p("성공");
		else p("실패");
	}

	private static void update(MemoDAO dao) {
		int memono = 1;
		MemoDTO dto = dao.read(memono);
		dto.setTitle("변경");
		dto.setContent("변경내용");
	
		if(dao.update(dto)) p("성공");
		else p("실패");
		
	}

	private static void read(MemoDAO dao) {
		int memono = 1;
		
		MemoDTO dto = dao.read(memono);
		

		
	}

	private static void list(MemoDAO dao) {
		Map map = new HashMap();
		map.put("col", "title");
		map.put("word" , "");
		map.put("sno" , 1);
		map.put("eno" , 5);
		
		List<MemoDTO> list = dao.list(map);
		
		Iterator<MemoDTO> iter = list.iterator();
		
		while(iter.hasNext()) {
			MemoDTO dto = iter.next();
			
			p(dto);
			p("-----------------");
		}
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

	private static void p(MemoDTO dto) {
		p("번호 :" + dto.getMemono());
		p("제목 :" + dto.getTitle());
		p("내용 :" + dto.getContent());
		p("날짜 :" + dto.getWdate());
		p("조회수 :" + dto.getViewcnt());
		
	}

}
