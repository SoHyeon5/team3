package interior.service;

import java.util.Map;

import article.model.Writer;

public class WriteInteriorAskRequest {
		
		private Writer writer;
		private Integer num;	
		private String title;
		private String name;
		private String area;	
		private String field;
		private String address;
		private String dateStart;
		private String dateDone;
		private String budget;
		private String message;	
		private String tel;
		
		public WriteInteriorAskRequest(
				Writer writer, 
				String title, 
				String name,
				String area, 
				String field,
				String address, 
				String dateStart, 
				String dateDone, 
				String budget, 
				String message, 
				String tel) {
			super();
			this.writer = writer;
			this.title = title;
			this.name = name;
			this.area = area;
			this.field = field;
			this.address = address;
			this.dateStart = dateStart;
			this.dateDone = dateDone;
			this.budget = budget;
			this.message = message;
			this.tel = tel;
		}
		
		public Writer getWriter() {
			return writer;
		}
		
		public Integer getNum() {
			return num;
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
		
		public String getField() {
			return field;
		}
		
		public void setField(String field) {
			this.field = field;
		}
		
		public String getAddress() {
			return address;
		}
		
		public void setAddress(String address) {
			this.address= address;
		}
		
		public String getDateStart() {
			return dateStart;
		}
		
		public void setDateStart(String dateStart) {
			this.dateStart= dateStart;
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
		
		
		public void validate(Map<String, Boolean> errors) {
			if (title == null || title.trim().isEmpty()) {
				errors.put("title", Boolean.TRUE);
			}
		}
		
}






