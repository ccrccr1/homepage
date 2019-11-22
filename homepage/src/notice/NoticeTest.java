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
			p("���� ����");
		} else {
			p("���� ����");
		}
	}

	private static void update(NoticeDAO dao) {
		NoticeDTO dto = dao.read(2);

		dto.setTitle("���񺯰�");
		dto.setContent("����Ȯ��");

		if (dao.update(dto)) {
			p("����");
		} else {
			p("����");
		}
	}

	private static void passCheck(NoticeDAO dao) {
		Map map = new HashMap();

		map.put("no", 2);
		map.put("passwd", "12345");

		if (dao.passCheck(map)) {
			p("����");
		} else {
			p("��й�ȣ�� Ʋ���ϴ�.");
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
		dto.setId("�ְǽ�");
		dto.setTitle("�ȳ��ϼ���");
		dto.setContent("�ݰ����ϴ�");
		dto.setPasswd("1234");

		if (dao.create(dto)) {
			p("����");
		} else {
			p("����");
		}
	}

	private static void list(NoticeDAO dao) {
		Map map = new HashMap();
		map.put("col", "title");
		map.put("word", "����");
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
		p("��ȣ: " + dto.getNo());
		p("id: " + dto.getId());
		p("����: " + dto.getTitle());
		p("��¥: " + dto.getWdate());

	}

	private static void p(String string) {
		System.out.println(string);

	}

}
