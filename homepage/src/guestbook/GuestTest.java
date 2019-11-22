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
		map.put("word", "�浿");
		
		p("���ڵ尹��:" + dao.total(map));
		
	}

	private static void delete(GuestDAO dao) {
		int guestno = 4;
		
		if(dao.delete(guestno)) {
			p("���� ����");
		}else {
			p("���� ����");
		}
	}

	private static void update(GuestDAO dao) {
		GuestDTO dto = dao.read(3);
		
		dto.setWname("��ö��");
		dto.setTitle("����� ��");
		dto.setContent("�Խ��ǿ� ���� ������ �н��մϴ�.");
		
		if(dao.update(dto)) {
			p("����");
		}else {
			p("����");
		}
	}

	private static void passCheck(GuestDAO dao) {
		Map map = new HashMap();
		
		map.put("guestno", 2);
		map.put("passwd", "1234");
		
		if(dao.passCheck(map)) {
			p("�ùٸ� ����Դϴ�.");
		}else {
			p("�߸��� ����Դϴ�");
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
		dto.setWname("�ڱ浿");
		dto.setTitle("����");
		dto.setContent("����");
		dto.setPasswd("1234");
		
		if(dao.create(dto)) {
			p("����");
		}else {
			p("����");
		}
	}

	private static void List(GuestDAO dao) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("col", "wname");
		map.put("word", "�浿");
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
		p("��ȣ:" + dto.getguestno());
		p("�۾���:" + dto.getWname());
		p("����:" + dto.getTitle());
		p("����:" + dto.getContent());
		p("��¥:" + dto.getWdate());
		p("��ȸ��:" + dto.getViewcnt());
	}

	private static void p(String string) {
		System.out.println(string);
		
	}
}
