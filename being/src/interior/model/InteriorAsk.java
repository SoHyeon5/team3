package interior.model;

import article.model.Writer;

public class InteriorAsk {
	

	private Integer num;	
	private Writer writer;
	private String answer;
	private String title;
	private String name;
	private String area;	
	private String fieldof;
	private String address;
	private String dateStart;
	private String dateDone;
	private String budget;
	private String message;	
	private String tel;
	private Integer grade;
	private String contentOf;
	
	//list 출력용
	public InteriorAsk(
			Integer num,
			Writer writer, 
			String title, 
			String name,
			String area, 
			String fieldof,
			String address, 
			String dateStart, 
			String dateDone, 
			String budget, 
			String message, 
			String tel) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.name = name;
		this.area = area;
		this.fieldof = fieldof;
		this.address = address;
		this.dateStart = dateStart;
		this.dateDone = dateDone;
		this.budget = budget;
		this.message = message;
		this.tel = tel;
	}
	
	
	
	public InteriorAsk(
			Integer num,
			String answer) {
		super();
		this.num = num;
		this.answer=answer;
	}
	

	public InteriorAsk(
			Integer num,
			Writer writer, 
			String answer,
			String title, 
			String name,
			String area, 
			String fieldof,
			String address, 
			String dateStart, 
			String dateDone, 
			String budget, 
			String message, 
			String tel,
			Integer grade,
			String contentOf
			) {
		super();
		this.num = num;
		this.writer = writer;
		this.answer= answer;
		this.title = title;
		this.name = name;
		this.area = area;
		this.fieldof = fieldof;
		this.address = address;
		this.dateStart = dateStart;
		this.dateDone = dateDone;
		this.budget = budget;
		this.message = message;
		this.tel = tel;
		this.grade = grade;
		this.contentOf = contentOf;
	}
	

	public Writer getWriter() {
		return writer;
	}
	
	public Integer getNum() {
		return num;
	}
	
	public String getAnswer() {
		return answer;
	}
	
	public String getTitle() {
		return title;
	}
	
	public String getName() {
		return name;
	}
	
	public String getArea() {
		return area;
	}
	
	public String getFieldOf() {
		return fieldof;
	}
	
	public String getAddress() {
		return address;
	}
	
	public String getDateStart() {
		return dateStart;
	}
	
	public String getDateDone() {
		return dateDone;
	}
	
	public String getBudget() {
		return budget;
	}
	
	public String getMessage() {
		return message;
	}
	
	public String getTel() {
		return tel;
	}



	public String getFieldof() {
		return fieldof;
	}



	public void setFieldof(String fieldof) {
		this.fieldof = fieldof;
	}



	public Integer getGrade() {
		return grade;
	}



	public void setGrade(Integer grade) {
		this.grade = grade;
	}



	public String getContentOf() {
		return contentOf;
	}



	public void setContentOf(String contentOf) {
		this.contentOf = contentOf;
	}



	public void setNum(Integer num) {
		this.num = num;
	}



	public void setWriter(Writer writer) {
		this.writer = writer;
	}



	public void setAnswer(String answer) {
		this.answer = answer;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public void setName(String name) {
		this.name = name;
	}



	public void setArea(String area) {
		this.area = area;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public void setDateStart(String dateStart) {
		this.dateStart = dateStart;
	}



	public void setDateDone(String dateDone) {
		this.dateDone = dateDone;
	}



	public void setBudget(String budget) {
		this.budget = budget;
	}



	public void setMessage(String message) {
		this.message = message;
	}



	public void setTel(String tel) {
		this.tel = tel;
	}


	
}
