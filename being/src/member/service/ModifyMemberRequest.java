package member.service;

import java.util.Date;
import java.util.Map;

public class ModifyMemberRequest {

	private String id;
	private String name;
	private Date regDate;
	private int level;
	
//	public ModifyMemberRequest(
//			int num
//			) {
//		this.num = num;
//	}
	
	public ModifyMemberRequest(
			String id,
			int level
			) {
		this.id = id;
		this.level = level;
	}

	public ModifyMemberRequest(
			String id,
			String name, 
			Date regDate,
			int level
			) {
		this.id = id;
		this.name = name;
		this.regDate = regDate;
		this.level = level;
	}

	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}

//	public Integer getNum() {
//		return num;
//	}

	public String getName() {
		return name;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	
	public int getLevel() {
		return level;
	}
	
	public void setLevel(int level) {
		this.level = level;
	}

	public void validate(Map<String, Boolean> errors) {
		if (id == null || id.trim().isEmpty()) {
			errors.put("id", Boolean.TRUE);
		}
	}

}
