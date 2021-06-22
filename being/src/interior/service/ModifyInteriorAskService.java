package interior.service;

import java.sql.Connection;
import java.sql.SQLException;

import interior.dao.InteriorAskDao;
import interior.model.InteriorAsk;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;


public class ModifyInteriorAskService {

	private InteriorAskDao interiorAskDao = new InteriorAskDao();

	public void modify(ModifyInteriorAskRequest modReq) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			InteriorAsk interiorAsk = interiorAskDao.selectById(conn, 
					modReq.getNum());
			if (interiorAsk == null) {
				throw new InteriorAskNotFoundException();
			}
			
			interiorAskDao.updateUser(conn,
					modReq.getNum(), 
					modReq.getGrade(),
					modReq.getContentOf()
					);

			interiorAskDao.updateAnswer(conn, 
					modReq.getNum(), 
					modReq.getAnswer()
					);
			conn.commit();
			System.out.println(interiorAsk.getTel());
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
