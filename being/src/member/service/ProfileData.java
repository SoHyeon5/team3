package member.service;

import java.util.List;

import article.model.Article;
import store.model.StoreReview;

public class ProfileData {

	private List<StoreReview> storeReview;
	private List<Article> article;
	
	public ProfileData(List<Article> article, List<StoreReview> storeReview) {
		this.article = article;
		this.storeReview = storeReview;
	}
	
	public ProfileData(List<StoreReview> storeReview) {
		this.storeReview = storeReview;
	}
	
	public List<Article> getArticle(){
		return article;
	}

	public List<StoreReview> getStoreReview() {
		return storeReview;
	}

//	public String getContent() {
//		return content.getContent();
//	}

}
