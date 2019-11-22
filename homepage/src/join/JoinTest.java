package join;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


public class JoinTest {
	public static void main(String [] args) {
		JoinDAO dao = new JoinDAO();
		
		//create(dao);
		//list(dao);
		//total(dao);
		//read(dao);
		update(dao);
	}

	private static void update(JoinDAO dao) {
		JoinDTO dto = dao.read("user1");
		
		dto.setTel("010-1234-1234");
		dto.setEmail("user1@mail.com");
		dto.setZipcode("00000");
		dto.setAddress1("서울시 관악구 신림동");
		dto.setAddress2("540-1");
	
		if(dao.update(dto)) {
			p("성공");
		}else{
			p("실패");
		}
	}

	private static void read(JoinDAO dao) {
		JoinDTO dto = dao.read("user1");
		p(dto);
	}

	private static void total(JoinDAO dao) {
		Map map = new HashMap();
		map.put("col", "id");
		map.put("word", "user1");
		p("레코드갯수 : " + dao.total(map));
		
	}

	private static void list(JoinDAO dao) {
		Map map = new HashMap();
		map.put("col", "id");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		List<JoinDTO> list = dao.list(map);
		Iterator<JoinDTO> iter = list.iterator();	
		
		while(iter.hasNext()) {
			JoinDTO dto = iter.next();
			p(dto);
			p("--------------------");
		}
	}

	private static void p(JoinDTO dto) {
		// TODO Auto-generated method stub
		p("id: " + dto.getId());
		p("이름: " + dto.getJname());
		p("이메일: " + dto.getEmail());
		p("전화번호: " + dto.getTel());
		p("우편번호: " + dto.getZipcode());
		p("주소: " + dto.getAddress1());
		p("상세주소: " + dto.getAddress2());
		p("날짜: " + dto.getjdate());
		p("사진: " + dto.getFname());
	}

	private static void create(JoinDAO dao) {
		JoinDTO dto = new JoinDTO();
		
		dto.setId("user1");
		dto.setPasswd("1234");
		dto.setJname("홍길동");
		dto.setZipcode("123-12");
		dto.setAddress1("서울시 강북구");
		dto.setAddress2("미아사거리역");		
		dto.setTel("010-1234-1234");
		dto.setEmail("user1@mail.com");
		dto.setFname("member.jpg");
		
		if(dao.create(dto)) {
			p("성공");
		}else {
			p("실패");
		}
		
	}

	private static void p(String string) {
		System.out.println(string);
		
	}
}
