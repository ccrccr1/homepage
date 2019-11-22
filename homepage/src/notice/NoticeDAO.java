package notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import utility.DBclose;
import utility.DBopen;

public class NoticeDAO {
		public int total(Map map) {
			int total = 0;
			Connection con = DBopen.open();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String col = (String)map.get("col");
			String word = (String)map.get("word");
			
			StringBuffer sql = new StringBuffer();
			sql.append(" select count(*) from notice ");
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
	
	public List<NoticeDTO> list(Map map){
		List<NoticeDTO> list = new ArrayList<NoticeDTO>();
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select no, id, title, to_char(wdate,'yyyy-mm-dd') wdate, viewcnt , r ");
		sql.append(" from( ");
		sql.append("     select no, id, title, wdate, viewcnt ,rownum r ");
		sql.append("     from( ");
		sql.append("         select no, id, title, wdate, viewcnt  ");
		sql.append("         from notice ");
		if(word.length()>0 && col.equals("title_content")) {
			sql.append("         where title like '%'||?||'%' or content like '%'||?||'%' ");
		}else if(word.length() >0) {
			sql.append(" where " + col + " like '%'||?||'%' " );
		}
		sql.append("         order by no desc ");
		sql.append("     ) ");
		sql.append(" ) ");
		sql.append(" where r>=? and r<=? ");
		
		try {
			int i = 0;
			pstmt = con.prepareStatement(sql.toString());
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
				NoticeDTO dto = new NoticeDTO();
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setWdate(rs.getString("wdate"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt, rs);
		}
		
		return list;
	}
	public boolean create(NoticeDTO dto) {
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into notice(no, id ,title, content, passwd, wdate) ");
		sql.append(" values( ");
		sql.append(" (select nvl(max(no), 0)+ 1 from notice),'admin',?, ?, ?, sysdate ");
		sql.append(" ) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getPasswd());
			
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
	public NoticeDTO read(int no) {
		NoticeDTO dto = null;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select * from notice ");
		sql.append(" where no = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new NoticeDTO();
				dto.setNo(no);
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setWdate(rs.getString("wdate"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt, rs);
		}

		
		return dto;
	}
	public void upViewcnt(int no) {
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update notice set viewcnt = viewcnt + 1 ");
		sql.append(" where no = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt);
		}
		
	}
	public boolean passCheck(Map map) {
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int no = (Integer)map.get("no");
		String passwd = (String)map.get("passwd");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(no) from notice ");
		sql.append(" where no = ? ");
		sql.append(" and passwd = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			pstmt.setString(2, passwd);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			int cnt = rs.getInt(1);
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
	public boolean update(NoticeDTO dto) {
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update notice ");
		sql.append(" set title = ?, ");
		sql.append("     content = ? ");
		sql.append(" where no = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNo());
			
			int cnt = pstmt.executeUpdate();
			if(cnt > 0 ) {
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
	public boolean delete(int no) {
		boolean flag = false;
		Connection con = DBopen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from notice ");
		sql.append(" where no = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			
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
}
