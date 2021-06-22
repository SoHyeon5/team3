package member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

//import article.dao.ArticleContentDao;
import article.dao.ArticleDao;
import article.model.Article;
import auth.service.User;
//import article.model.ArticleContent;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import member.dao.MemberDao;

public class DeleteMemberService {

	private MemberDao memberDao = new MemberDao();
//	private ArticleContentDao contentDao = new ArticleContentDao();

	public void delete(User authUser) {
		// System.out.println("delete() 실행...");
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			memberDao.delete(conn, authUser);
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} catch (PermissionDeniedException e) {
			JdbcUtil.rollback(conn);
			throw e;
		} finally {
			JdbcUtil.close(conn);
		}
	}

}
