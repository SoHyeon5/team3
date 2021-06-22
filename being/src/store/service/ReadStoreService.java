package store.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

//import article.dao.ArticleContentDao;
//import article.dao.ArticleDao;
//import article.model.Article;
//import article.service.ArticleData;
//import article.model.ArticleContent;
import jdbc.connection.ConnectionProvider;
import store.dao.StoreDao;
import store.dao.StoreReviewDao;
import store.model.Store;
import store.model.StoreReview;

public class ReadStoreService {

	private StoreDao storeDao = new StoreDao();
//	private ArticleContentDao contentDao = new ArticleContentDao();
	private StoreReviewDao storeReviewDao = new StoreReviewDao();
	
	public StoreData getStore(int storeNum) {
		try (Connection conn = ConnectionProvider.getConnection()){
			Store store = storeDao.selectById(conn, storeNum);
			if (store == null) {
				throw new StoreNotFoundException();
			}
//			ArticleContent content = contentDao.selectById(conn, articleNum);
//			if (content == null) {
//				throw new ArticleContentNotFoundException();
//			}
			
			List<StoreReview> storeReview = storeReviewDao.select(conn, storeNum);
			if (storeReview == null) {
				throw new StoreReviewNotFoundException();
			}
			
//			Iterator<StoreReview> iterator = storeReview.iterator();
//			while(iterator.hasNext()) {
//				StoreReview sr = iterator.next();
//				System.out.println(sr.getGrade());
//				System.out.println(sr.getContent());
//				System.out.println(sr.getWriter().getName());
//				System.out.println(sr.getRegDate());
//			}
//			
			
			/*
			 * if (increaseReadCount) { storeDao.increaseReadCount(conn, storeNum); }
			 */
//			return new ArticleData(article, content);
			return new StoreData(store, storeReview);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/*
	 * public StoreData getStore(int storeNum, boolean b) { // TODO Auto-generated
	 * method stub return null; }
	 */
}
