package store.service;

import java.sql.Connection;
import java.sql.SQLException;

//import article.dao.ArticleContentDao;
//import article.model.ArticleContent;
import jdbc.connection.ConnectionProvider;
import store.dao.StoreReviewDao;
import store.model.StoreReview;

public class ReadStoreReviewService {

	private StoreReviewDao storeReviewDao = new StoreReviewDao();
//	private ArticleContentDao contentDao = new ArticleContentDao();
	
	public StoreReview getStoreReview(int storeReviewNum) {
		try (Connection conn = ConnectionProvider.getConnection()){
			StoreReview storeReview = storeReviewDao.selectById(conn, storeReviewNum);
			if (storeReview == null) {
				throw new StoreReviewNotFoundException();
			}
//			
//			return new ArticleData(article, content);
			return storeReview;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
