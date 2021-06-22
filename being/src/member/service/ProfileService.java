package member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import article.dao.ArticleDao;
import article.model.Article;
import auth.service.User;
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
import store.service.StoreData;
import store.service.StoreNotFoundException;
import store.service.StoreReviewNotFoundException;

public class ProfileService {

	private StoreReviewDao storeReviewDao = new StoreReviewDao();
	private ArticleDao articleDao = new ArticleDao();
	
	public ProfileData getProfile(String email) {
		try (Connection conn = ConnectionProvider.getConnection()){
			
//			ArticleContent content = contentDao.selectById(conn, articleNum);
//			if (content == null) {
//				throw new ArticleContentNotFoundException();
//			}
//			User authUser = (User) req.getSession().getAttribute("authUser");
			
			List<Article> article = articleDao.selectByEmail(conn, email);
			if (article == null) {
				throw new StoreReviewNotFoundException();
			}
			
			List<StoreReview> storeReview = storeReviewDao.selectByEmail(conn, email);
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
			
			return new ProfileData(article, storeReview);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/*
	 * public StoreData getStore(int storeNum, boolean b) { // TODO Auto-generated
	 * method stub return null; }
	 */
}
