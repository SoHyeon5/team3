package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import auth.service.User;
import interior.model.Interior;
import jdbc.JdbcUtil;
import member.model.Member;

public class MemberDao {

	public Member selectById(Connection conn, String id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"select * from members where EMAIL = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			Member member = null;
			if (rs.next()) {
				member = new Member(
						rs.getString("EMAIL"), 
						rs.getString("NAME"), 
						rs.getString("PASSWORD"),
						rs.getInt("LVL"),
						toDate(rs.getTimestamp("REGISTDAY")));
			}
			return member;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	private Date toDate(Timestamp date) {
		return date == null ? null : new Date(date.getTime());
	}

	public void insert(Connection conn, Member mem) throws SQLException {
		try (PreparedStatement pstmt = 
				conn.prepareStatement("insert into members values(?,?,?,?,?)")) {
			pstmt.setString(1, mem.getId());
			pstmt.setString(2, mem.getName());
			pstmt.setString(3, mem.getPassword());
			pstmt.setTimestamp(4, new Timestamp(mem.getRegDate().getTime()));
			pstmt.setInt(5, mem.getLevel());
			pstmt.executeUpdate();
		}
	}
	
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from members");
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

	public List<Member> select(Connection conn, int startRow, int size) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM ("
					+ "        SELECT ROW_NUMBER() OVER (ORDER BY REGISTDAY) RNUM, A.* "
					+ "          FROM members A  ORDER BY REGISTDAY)"
					+ " WHERE RNUM BETWEEN ? AND ?");
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, size);
			rs = pstmt.executeQuery();
			List<Member> result = new ArrayList<>();
			while (rs.next()) {
				result.add(convertMember(rs));
			}
			return result;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	private Member convertMember(ResultSet rs) throws SQLException {
	      return new Member(
	    		  rs.getString("EMAIL"),
	    		  rs.getString("NAME"),
	    		  rs.getString("PASSWORD"),
	    		  rs.getInt("LVL"),
	    		  toDate(rs.getTimestamp("REGISTDAY"))
	    		  );
	}

	public void update(Connection conn, Member member) throws SQLException {
		try (PreparedStatement pstmt = conn.prepareStatement(
				"update members set NAME = ?, PASSWORD = ? where EMAIL = ?")) {
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getId());
			pstmt.executeUpdate();
		}
	}
	
	public void updateA(Connection conn, String id, int level) throws SQLException {
		try (PreparedStatement pstmt = conn.prepareStatement(
				"update members set LVL = ? where EMAIL = ?")) {
			pstmt.setInt(1, level);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
		}
	}
	
	public void delete(Connection conn, User authUser) throws SQLException {
	      try (PreparedStatement pstmt = conn.prepareStatement(
	            "delete from MEMBERS WHERE EMAIL=?")) {
	         pstmt.setString(1, authUser.getId());
	         pstmt.executeUpdate();
	      }
	   }

}
