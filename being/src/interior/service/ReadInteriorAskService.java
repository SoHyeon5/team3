package interior.service;

import java.sql.Connection;
import java.sql.SQLException;

import interior.dao.InteriorAskDao;
import interior.model.InteriorAsk;
import jdbc.connection.ConnectionProvider;

public class ReadInteriorAskService {

	private InteriorAskDao interiorAskDao = new InteriorAskDao();
	
	public InteriorAsk getInteriorAsk(int interiorAskNum) {
		try (Connection conn = ConnectionProvider.getConnection()){
			InteriorAsk interiorAsk = interiorAskDao.selectById(conn, interiorAskNum);
			if (interiorAsk == null) {
				throw new InteriorNotFoundException();
			}

			return interiorAsk;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
