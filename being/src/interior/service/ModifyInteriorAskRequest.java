package interior.service;

import java.util.Map;

public class ModifyInteriorAskRequest {

	private String userId;
	private int level;
	private Integer num;
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
	
	public ModifyInteriorAskRequest(int level, Integer num, String answer, Integer grade , String contentOf) {
		super();
		this.level=level;
		this.num=num;
		this.answer=answer;
		this.grade=grade;
		this.contentOf=contentOf;
	}
	
	public ModifyInteriorAskRequest(String userId, Integer num, String answer, String title, String name, String area,
			String fieldof, String address, String dateStart, String dateDone, String budget, String message,
			String tel, Integer grade, String contentOf) {
		super();
		this.userId = userId;
		this.num = num;
		this.answer = answer;
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}


	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}
	
	public String getAnswer() {
		return answer;
	}

	public void setNum(String answer) {
		this.answer = answer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getFieldof() {
		return fieldof;
	}

	public void setFieldof(String fieldof) {
		this.fieldof = fieldof;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDateStart() {
		return dateStart;
	}

	public void setDateStart(String dateStart) {
		this.dateStart = dateStart;
	}

	public String getDateDone() {
		return dateDone;
	}

	public void setDateDone(String dateDone) {
		this.dateDone = dateDone;
	}

	public String getBudget() {
		return budget;
	}

	public void setBudget(String budget) {
		this.budget = budget;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
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

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public void validate(Map<String, Boolean> errors) {
		if (title == null || title.trim().isEmpty()) {
			errors.put("title", Boolean.TRUE);
		}
	}
}