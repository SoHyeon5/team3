package interior.service;

import java.sql.Connection;
import java.sql.SQLException;

import interior.dao.InteriorAskDao;
import interior.dao.InteriorDao;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

import interior.model.Interior;
import interior.model.InteriorAsk;

public class WriteInteriorAskService {

	private InteriorAskDao interiorAskDao = new InteriorAskDao();

	public Integer interiorAsk(WriteInteriorAskRequest req) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);

			InteriorAsk interiorAsk = toInteriorAsk(req);
			InteriorAsk savedInteriorAsk = interiorAskDao.insert(conn, interiorAsk);
			System.out.println(interiorAsk);
			if (savedInteriorAsk == null) {
				throw new RuntimeException("fail to insert Interior");
			}

			conn.commit();

			return savedInteriorAsk.getNum();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} catch (RuntimeException e) {
			JdbcUtil.rollback(conn);
			throw e;
		} finally {
			JdbcUtil.close(conn);
		}
	}

	private InteriorAsk toInteriorAsk(WriteInteriorAskRequest req) {		
		return new InteriorAsk(null,
				req.getWriter(),
				req.getTitle(),
				req.getName(),
				req.getArea(),
				req.getField(), 
				req.getAddress(),
				req.getDateStart(),
				req.getDateDone(),
				req.getBudget(),
				req.getMessage(),
				req.getTel()
				);
	}
	
}
