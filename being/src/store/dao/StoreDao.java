package store.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import article.model.Article;
import article.model.Writer;
import jdbc.JdbcUtil;
import store.model.Store;

public class StoreDao {

	public Store insert(Connection conn, Store store) throws SQLException {
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;		
		 
		try {
			pstmt = conn.prepareStatement("insert into PROD_MNG values "
					+ "(PROD_MNG_SEQ.NEXTVAL,"
					+ "?,?,?,?,"
					+ "?,?,?,?,"
					+ "?,?,?,0)");
			pstmt.setString(1, store.getName());
			pstmt.setString(2, store.getThumbnail());
			pstmt.setString(3, store.getInfoimage());
			pstmt.setString(4, store.getIntroduce());
			pstmt.setInt(5, (int)store.getPrice());
			pstmt.setInt(6, (int)store.getDcprice());
			pstmt.setString(7, store.getBrand());
			pstmt.setString(8, store.getKeywd());
			pstmt.setString(9, store.getCategory());
			pstmt.setString(10, store.getFreeyn());
			pstmt.setString(11, store.getLink());
//			pstmt.setInt(12, store.getAvggrade());
			int insertedCount = pstmt.executeUpdate();
			
			if (insertedCount > 0) {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select max(NUM) from PROD_MNG");
				if (rs.next()) {
					Integer newNo = rs.getInt(1);
					return new Store(newNo,
							store.getName(),
							store.getThumbnail(),
							store.getInfoimage(),
							store.getIntroduce(),
							store.getPrice(),
							store.getDcprice(),
							store.getBrand(),
							store.getKeywd(),
							store.getCategory(),
							store.getFreeyn(),
							store.getLink(),
							store.getAvggrade());
				}
			}

			 return null;
			 
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(pstmt);
		}
	}

//	private Timestamp toTimestamp(Date date) {
//		return new Timestamp(date.getTime());
//	}

	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from PROD_MNG");
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

	public List<Article> select(Connection conn, int startRow, int size) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM ("
					+ "        SELECT ROW_NUMBER() OVER (ORDER BY NUM) RNUM, A.*"
					+ "          FROM WRITING A ORDER BY NUM)"
					+ " WHERE RNUM BETWEEN ? AND ?");
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, size);
			rs = pstmt.executeQuery();
			List<Article> result = new ArrayList<>();
			while (rs.next()) {
				result.add(convertArticle(rs));
			}
			return result;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	private Article convertArticle(ResultSet rs) throws SQLException {
		return new Article(rs.getInt("NUM"),
				new Writer(
						rs.getString("EMAIL"),
						rs.getString("NAME")),
				rs.getString("TYPE"),
				rs.getString("ACREAGE"),
				rs.getString("BUDGET"),
				rs.getString("FIELD"),
				rs.getString("SPACE"),
				rs.getString("TITLE"),
				rs.getString("CONTENTOF"),//
//				rs.getInt("PRODNUM"),
				toDate(rs.getTimestamp("REGISTDAY")),
//				toDate(rs.getTimestamp("moddate")),
				rs.getInt("READCOUNT"));
	}

	private Date toDate(Timestamp timestamp) {
		return new Date(timestamp.getTime());
	}
	
	public Article selectById(Connection conn, int no) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"select * from WRITING where NUM = ?");
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			Article article = null;
			if (rs.next()) {
				article = convertArticle(rs);
			}
			return article;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void increaseReadCount(Connection conn, int no) throws SQLException {
		try (PreparedStatement pstmt = 
				conn.prepareStatement(
						"update WRITING set READCOUNT = READCOUNT + 1 "+
						"where NUM = ?")) {
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		}
	}
	
	public int update(Connection conn, int no, 
			String title, 
			String content,
			String type,
			String acreage,
			String budget,
			String field,
			String space
			) throws SQLException {
		try (PreparedStatement pstmt = 
				conn.prepareStatement(
						"update WRITING set title = ?,CONTENTOF=?, TYPE=?, ACREAGE =?, BUDGET=?,FIELD=?,SPACE=?  "+
						"where NUM = ?")) {
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, type);
			pstmt.setString(4, acreage);
			pstmt.setString(5, budget);
			pstmt.setString(6, field);
			pstmt.setString(7, space);
			pstmt.setInt(8, no);
			return pstmt.executeUpdate();
		}
	}
		
	public int delete(Connection conn, int no) throws SQLException {
		try (PreparedStatement pstmt = 
				conn.prepareStatement(
						"delete from WRITING "+
						"where NUM = ?")) {
			pstmt.setInt(1, no);
			return pstmt.executeUpdate();
			}
	}
}
