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

//import article.model.Article;
//import article.model.Writer;
import jdbc.JdbcUtil;
// import store.model.Store;
import store.model.StoreReview;

public class StoreReviewDao {

	public StoreReview insert(Connection conn, StoreReview storeReview) throws SQLException {
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;		
		 
		try {
			pstmt = conn.prepareStatement("insert into PROD_COMT values "
					+ "(PROD_COMT_SEQ.NEXTVAL,"
					+ "?,?,?,?,?)");
			pstmt.setString(1, storeReview.getWriter().getId());
			pstmt.setInt(2, (int)storeReview.getProdNum());
			pstmt.setTimestamp(3, toTimestamp(storeReview.getRegDate()));
			pstmt.setInt(4, (int)storeReview.getGrade());
			pstmt.setString(5, storeReview.getContent());
			
			int insertedCount = pstmt.executeUpdate();
			
			if (insertedCount > 0) {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select max(NUM) from PROD_MNG");
				if (rs.next()) {
					Integer newNo = rs.getInt(1);
					return new StoreReview(newNo,
							storeReview.getWriter(),
							storeReview.getProdNum(),
							storeReview.getRegDate(),
							storeReview.getGrade(),
							storeReview.getContent()
							);
				}
			}

			 return null;
			 
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(pstmt);
		}
	}

	private Timestamp toTimestamp(Date date) {
		return new Timestamp(date.getTime());
	}

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

	public List<StoreReview> select(Connection conn, int startRow, int size) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM ("
					+ "        SELECT ROW_NUMBER() OVER (ORDER BY NUM) RNUM, A.*"
					+ "          FROM PROD_COMT A ORDER BY NUM)"
					+ " WHERE RNUM BETWEEN ? AND ?");
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, size);
			rs = pstmt.executeQuery();
			List<StoreReview> result = new ArrayList<>();
			while (rs.next()) {
				result.add(convertStoreReview(rs));
			}
			return result;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	private StoreReview convertStoreReview(ResultSet rs) throws SQLException {
		return new StoreReview(rs.getInt("NUM"),
	            rs.getInt("GRADE"),
	            rs.getString("CONTENT"));
	}

//	private Date toDate(Timestamp timestamp) {
//		return new Date(timestamp.getTime());
//	}
	
	public StoreReview selectById(Connection conn, int no) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"select * from PROD_COMT where NUM = ?");
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			StoreReview storeReview = null;
			if (rs.next()) {
				storeReview = convertStoreReview(rs);
			}
			return storeReview;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
//	public void increaseReadCount(Connection conn, int no) throws SQLException {
//		try (PreparedStatement pstmt = 
//				conn.prepareStatement(
//						"update WRITING set READCOUNT = READCOUNT + 1 "+
//						"where NUM = ?")) {
//			pstmt.setInt(1, no);
//			pstmt.executeUpdate();
//		}
//	}
	
	public int update(Connection conn, int no,
			Integer grade, 
			String content
			) throws SQLException {
		try (PreparedStatement pstmt = 
				conn.prepareStatement(
						"update PROD_COMT set GRADE = ?,CONTENT=? "+
						"where NUM = ?")) {
			pstmt.setInt(1, grade);
			pstmt.setString(2, content);
			pstmt.setInt(3, no);
			return pstmt.executeUpdate();
		}
	}
		
	public int delete(Connection conn, int no) throws SQLException {
		try (PreparedStatement pstmt = 
				conn.prepareStatement(
						"delete from PROD_COMT "+
						"where NUM = ?")) {
			pstmt.setInt(1, no);
			return pstmt.executeUpdate();
			}
	}
}
