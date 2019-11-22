package guestbook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import utility.DBclose;
import utility.DBopen;

public class GuestDAO {
	
	public boolean checkRefnum(int guestno) {
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("  select count(refnum) ");
		sql.append("  from guest");
		sql.append("  where refnum = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, guestno);
			
			rs = pstmt.executeQuery();
			rs.next();
			
			int cnt = rs.getInt(1);
			if(cnt>0) {
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt , rs);
		}
		return flag;
	}
	//답변등록 : 부모의grpno, 부모의 indent,ansnum+1
	public boolean reply_create(GuestDTO dto) {
		boolean flag = false;
		
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into guest(guestno, wname, title, content, passwd, wdate, ");
		sql.append(" grpno, indent, ansnum, refnum)");
		sql.append(" values((select nvl(max(guestno),0)+1 from guest), ? , ? , ? , ?, sysdate,  ");
		sql.append(" ?, ?, ?, ? )");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setInt(5, dto.getGrpno());
			pstmt.setInt(6, dto.getIndent() + 1);
			pstmt.setInt(7, dto.getAnsnum() + 1);
			pstmt.setInt(8, dto.getguestno());
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt);
		}
		
		return flag;
	}
	
	
	//기존 답변에 대해서 답변순서 변경
	public void reply_ansnum(Map map) {
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		
		int grpno = (Integer)map.get("grpno");
		int ansnum = (Integer)map.get("ansnum")
;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update guest ");
		sql.append(" set ");
		sql.append(" 	ansnum = ansnum +1 ");
		sql.append("  where ");
		sql.append(" 	grpno = ? ");
		sql.append(" and ");
		sql.append(" 	ansnum > ? ");
		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt);
		}
	}
	
	
	//부모의 grpno, indent, ansnum
	public GuestDTO reply_read(int guestno) {
		GuestDTO dto = null;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select guestno, grpno, indent, ansnum, title ");
		sql.append(" from guest ");
		sql.append(" where guestno = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, guestno);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new GuestDTO();
				dto.setguestno(rs.getInt("guestno"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				dto.setTitle(rs.getString("title"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt, rs);
		}
		
		
		return dto;
	}
	
	public boolean delete(int guestno) {
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from guest ");
		sql.append(" where guestno = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, guestno);
			
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt);
		}

		
		return flag;
	}
	
	public boolean update(GuestDTO dto) {
		boolean flag = false;
		Connection con =DBopen.open();
		PreparedStatement pstmt = null;
		
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update guest ");
		sql.append(" set wname = ?, ");
		sql.append(" title= ?, ");
		sql.append(" content = ? ");
		sql.append(" where guestno = ?");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getguestno());
			
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) {
				flag = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt);
		}
		return flag;
	}
	
	
	public boolean passCheck(Map map) {
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int guestno = (Integer)map.get("guestno");
		String passwd = (String)map.get("passwd");
		

		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT COUNT(guestno) as cnt  ");
		sql.append(" FROM guest WHERE guestno=? " )	;	
		sql.append(" AND passwd= ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, guestno);
			pstmt.setString(2, passwd);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			int cnt = rs.getInt("cnt");
			
			if(cnt>0) {
				flag = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt, rs);
		}
		return flag;
	}
	
	public GuestDTO read(int guestno) {
		GuestDTO dto = null;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select guestno, wname, title, content, viewcnt, wdate  ");
		sql.append(" from guest where guestno = ?");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, guestno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new GuestDTO();
				dto.setguestno(guestno);
				dto.setWname(rs.getString("wname"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt, rs);
		}
		return dto;		
	}
	
	public void upViewcnt(int guestno) {
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update guest set viewcnt = viewcnt + 1 ");
		sql.append(" where guestno = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, guestno);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt);
		}
	}
	
	
	public boolean create(GuestDTO dto) {
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		
		sql.append("insert into guest(guestno, wname, title, content, passwd, wdate, grpno) ");
		sql.append(" values((select nvl(max(guestno),0)+1 from guest), ? , ? , ? , ?, sysdate,  ");
		sql.append(" (select nvl(max(grpno),0)+1 from guest))");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt > 0) {
				flag= true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt);
		}
		
		return flag;
	}
	public int total(Map map) {
		int total = 0;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select count(*) from guest ");
		if(word.length()>0 && col.equals("title_content")) {
			sql.append("  where title like '%'||?||'%' " );
			sql.append("  or content like '%'||?||'%' " );
		}else if(word.length() > 0) {
			sql.append("  where " + col + " like '%'||?||'%' " );
		}
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			if(word.length()>0 && col.equals("title_content")) {
				pstmt.setString(1, word);
				pstmt.setString(2, word);
			}else if(word.length() > 0){
				pstmt.setString(1, word);
			}
			
			rs = pstmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt, rs);
		}
		return total;
	}
	
	public List<GuestDTO> list(Map map){
		List<GuestDTO> list = new ArrayList<GuestDTO>();
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
				
		StringBuffer sql = new StringBuffer();
		sql.append("select guestno, wname, title, viewcnt, to_char(wdate, 'yyyy-mm-dd') wdate,  grpno, indent, ansnum, r ");
		sql.append("from( ");
		sql.append("    select guestno, wname, title, viewcnt, wdate, grpno, indent, ansnum, rownum r");
		sql.append("    from(");
		sql.append(" 		select guestno, wname, title, viewcnt, wdate, grpno, indent, ansnum ");
		sql.append(" 		from guest ");
		if(word.length()>0 && col.equals("title_content")) {
			sql.append(" where title like '%'||?||'%' " );
			sql.append(" or content like '%'||?||'%' " );
		}else if(word.length() >0){
			sql.append(" where " + col + " like '%'||?||'%' " );
		}
		sql.append(" order by grpno desc, ansnum ");
		sql.append("        )");
		sql.append("    )");
		sql.append("where r >=? and r <=? ");
		
		try {
			int i = 0;
			pstmt =  con.prepareStatement(sql.toString());
			if(word.length()>0 && col.equals("title_content")) {
				pstmt.setString(++i, word);
				pstmt.setString(++i, word);	
			}else if(word.length() >0) {
				pstmt.setString(++i, word);
			}
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				GuestDTO dto = new GuestDTO();
				dto.setguestno(rs.getInt("guestno"));
				dto.setWname(rs.getString("wname"));
				dto.setTitle(rs.getNString("title"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt, rs);
		}
		
		return list;
	}
}
