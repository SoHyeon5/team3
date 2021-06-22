package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import member.dao.MemberDao;
//import member.model.Member;
//import store.dao.StoreReviewDao;
//import store.model.StoreReview;

public class ModifyMemberService {

	private MemberDao memberDao = new MemberDao();
//	private ArticleContentDao contentDao = new ArticleContentDao();

	public void modify(ModifyMemberRequest modReq) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
//			Member member = memberDao.selectById(conn, 
//					modReq.getNum());
//			if (storeReview == null) {
//				throw new MemberNotFoundException();
//			}
//			if (!canModify(modReq.getUserId(), storeReview)) {
//				throw new PermissionDeniedException();
//			}
			memberDao.updateA(conn,
					modReq.getId(),
					modReq.getLevel()
					);
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

//	private boolean canModify(String modfyingUserId, Article article) {
//		return article.getWriter().getId().equals(modfyingUserId);
//	}
}
