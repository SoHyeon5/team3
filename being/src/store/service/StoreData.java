package store.service;

import java.util.List;

//import java.util.List;

//import article.model.ArticleContent;
import store.model.Store;
import store.model.StoreReview;

public class StoreData {

	private Store store;
//	private ArticleContent content;
//	private StoreReview storeReview;
	private List<StoreReview> storeReview;
//	private StoreReviewPage storeReview;

//	public ArticleData(Article article, ArticleContent content) {
	public StoreData(Store store) {
		this.store = store;
//		this.content = content;
	}
		
	public StoreData(Store store, List<StoreReview> storeReview) {
		this.store = store;
		this.storeReview = storeReview;
	}
	
	public StoreData(List<StoreReview> storeReview) {
		this.storeReview = storeReview;
	}

	public Store getStore() {
		return store;
	}
	
	public List<StoreReview> getStoreReview() {
		return storeReview;
	}

//	public String getContent() {
//		return content.getContent();
//	}

}
