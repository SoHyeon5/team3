package store.model;

import java.util.Date;

import article.model.Writer;

public class StoreReview {
	
	private Integer num;
	private Writer writer;
	private Integer prodNum;
	private Date regDate;
	private float grade;	
	private String content;
	private String prodName;
	
	public StoreReview(
			Integer num,
			Writer writer,
			Integer prodNum,	
			Date regDate,
			float grade,
			String content
			) {
		this.num = num;
		this.writer = writer;
		this.prodNum = prodNum;
		this.regDate = regDate;
		this.grade = grade;
		this.content = content;
	}
	
	public StoreReview(
			Integer num,
			Writer writer,
			Integer prodNum,	
			Date regDate,
			float grade,
			String content,
			String prodName
			) {
		this.num = num;
		this.writer = writer;
		this.prodNum = prodNum;
		this.regDate = regDate;
		this.grade = grade;
		this.content = content;
		this.prodName = prodName;
	}
	
	public StoreReview() {}
	
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public Writer getWriter() {
		return writer;
	}
	public Integer getProdNum() {
		return prodNum;
	}
	public void setProdNum(Integer prodNum) {
		this.prodNum = prodNum;
	}
	public Date getRegDate() {
		return regDate;
	}
	public float getGrade() {
		return grade;
	}
	public void setGrade(float grade) {
		this.grade = grade;
	}
	public String getContent() {
		return content;
	}
	
	public String getProdName() {
		return prodName;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	
	}



