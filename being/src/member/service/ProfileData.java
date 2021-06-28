package member.service;

import java.util.List;

import article.model.Article;
import interior.model.InteriorAsk;
import store.model.StoreReview;

public class ProfileData {

	private List<StoreReview> storeReview;
	private List<Article> article;
	private List<InteriorAsk> interiorAsk;
	
	public ProfileData(List<Article> article, List<StoreReview> storeReview, List<InteriorAsk> interiorAsk) {
		this.article = article;
		this.storeReview = storeReview;
		this.interiorAsk = interiorAsk;
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
	
	public List<InteriorAsk> getInteriorAsk() {
		return interiorAsk;
	}

//	public String getContent() {
//		return content.getContent();
//	}

}
