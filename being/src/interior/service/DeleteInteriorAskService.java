package interior.service;

import java.sql.Connection;
import java.sql.SQLException;

import interior.dao.InteriorAskDao;
import interior.model.InteriorAsk;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class DeleteInteriorAskService {

	private InteriorAskDao interiorAskDao = new InteriorAskDao();
//	private ArticleContentDao contentDao = new ArticleContentDao();

	public void delete(DeleteAskRequest delReq) {
		// System.out.println("delete() 실행...");
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			InteriorAsk interiorAsk = interiorAskDao.selectById(conn, 
					delReq.getInteriorAskNumber());
			if (interiorAsk == null) {
				throw new InteriorNotFoundException();
			}
			/*
			 * if (!canModify(delReq.getUserId(), store)) { throw new
			 * PermissionDeniedException(); }
			 */
			System.out.println("delReq.Number="+delReq.getInteriorAskNumber());
			
			interiorAskDao.delete(conn, 
					delReq.getInteriorAskNumber());
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

	/*
	 * private boolean canModify(String modfyingUserId, Store store) { return
	 * store.getId().equals(modfyingUserId); }
	 */
}
