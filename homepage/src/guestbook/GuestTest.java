package guestbook;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class GuestTest {

	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		GuestDAO dao = new GuestDAO();
		
		total(dao);
		//List(dao);
		//create(dao);
		//upViewcnt(dao);
		//read(dao);
		//passCheck(dao);
		//update(dao);
		//delete(dao);
	}

	private static void total(GuestDAO dao) {
		Map map = new HashMap();
		map.put("col", "wname");
		map.put("word", "길동");
		
		p("레코드갯수:" + dao.total(map));
		
	}

	private static void delete(GuestDAO dao) {
		int guestno = 4;
		
		if(dao.delete(guestno)) {
			p("삭제 성공");
		}else {
			p("삭제 실패");
		}
	}

	private static void update(GuestDAO dao) {
		GuestDTO dto = dao.read(3);
		
		dto.setWname("김철수");
		dto.setTitle("비오는 날");
		dto.setContent("게시판에 대한 내용을 학습합니다.");
		
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
	}

	private static void passCheck(GuestDAO dao) {
		Map map = new HashMap();
		
		map.put("guestno", 2);
		map.put("passwd", "1234");
		
		if(dao.passCheck(map)) {
			p("올바른 비번입니다.");
		}else {
			p("잘못된 비번입니다");
		}
		
	}

	private static void read(GuestDAO dao) {
		int guestno = 2;
		GuestDTO dto = dao.read(guestno);
		p(dto);
		
	}

	private static void upViewcnt(GuestDAO dao) {
		int guestno = 2;
		dao.upViewcnt(guestno);
	}

	private static void create(GuestDAO dao) {
		GuestDTO dto = new GuestDTO();
		// TODO Auto-generated method stub
		dto.setWname("박길동");
		dto.setTitle("제목");
		dto.setContent("내용");
		dto.setPasswd("1234");
		
		if(dao.create(dto)) {
			p("성공");
		}else {
			p("실패");
		}
	}

	private static void List(GuestDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("col", "wname");
		map.put("word", "길동");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<GuestDTO> list = dao.list(map);
		Iterator<GuestDTO> iter = list.iterator();
		while(iter.hasNext()) {
			
			GuestDTO dto = iter.next();
			p(dto);
			p("--------------");
		}
	}

	private static void p(GuestDTO dto) {
		p("번호:" + dto.getguestno());
		p("글쓴이:" + dto.getWname());
		p("제목:" + dto.getTitle());
		p("내용:" + dto.getContent());
		p("날짜:" + dto.getWdate());
		p("조회수:" + dto.getViewcnt());
	}

	private static void p(String string) {
		System.out.println(string);
		
	}
}
