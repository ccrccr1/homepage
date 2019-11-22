package notice;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class NoticeTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		NoticeDAO dao = new NoticeDAO();

		// list(dao);
		// create(dao);
		// read(dao);
		// upViewcnt(dao);
		// passCheck(dao);
		// update(dao);
		delete(dao);
	}

	private static void delete(NoticeDAO dao) {
		int no = 2;

		if (dao.delete(no)) {
			p("삭제 성공");
		} else {
			p("삭제 실패");
		}
	}

	private static void update(NoticeDAO dao) {
		NoticeDTO dto = dao.read(2);

		dto.setTitle("제목변경");
		dto.setContent("내용확인");

		if (dao.update(dto)) {
			p("성공");
		} else {
			p("실패");
		}
	}

	private static void passCheck(NoticeDAO dao) {
		Map map = new HashMap();

		map.put("no", 2);
		map.put("passwd", "12345");

		if (dao.passCheck(map)) {
			p("성공");
		} else {
			p("비밀번호가 틀립니다.");
		}

	}

	private static void upViewcnt(NoticeDAO dao) {
		int no = 2;
		dao.upViewcnt(no);

	}

	private static void read(NoticeDAO dao) {
		// TODO Auto-generated method stub
		int no = 2;
		NoticeDTO dto = dao.read(no);
		p(dto);
	}

	private static void create(NoticeDAO dao) {
		NoticeDTO dto = new NoticeDTO();
		dto.setId("최건식");
		dto.setTitle("안녕하세요");
		dto.setContent("반갑습니다");
		dto.setPasswd("1234");

		if (dao.create(dto)) {
			p("성공");
		} else {
			p("실패");
		}
	}

	private static void list(NoticeDAO dao) {
		Map map = new HashMap();
		map.put("col", "title");
		map.put("word", "수업");
		map.put("sno", 1);
		map.put("eno", 5);

		List<NoticeDTO> list = dao.list(map);
		Iterator<NoticeDTO> iter = list.iterator();
		while (iter.hasNext()) {
			
			NoticeDTO dto = iter.next();
			p(dto);
			p("---------------");
		}

	}

	private static void p(NoticeDTO dto) {
		p("번호: " + dto.getNo());
		p("id: " + dto.getId());
		p("제목: " + dto.getTitle());
		p("날짜: " + dto.getWdate());

	}

	private static void p(String string) {
		System.out.println(string);

	}

}
