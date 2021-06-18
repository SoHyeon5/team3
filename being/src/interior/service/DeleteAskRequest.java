package interior.service;

import java.util.Map;

public class DeleteAskRequest {

	//private String userId;
	private int interiorAskNumber;

	public DeleteAskRequest(int interiorAskNumber) {
		//this.userId = userId;
		this.interiorAskNumber = interiorAskNumber;
	}

	/*
	 * public String getUserId() { return userId; }
	 */
	public int getInteriorAskNumber() {
		return interiorAskNumber;
	}
	
	/*
	 * public void validate(Map<String, Boolean> errors) { if (userId == null ||
	 * userId.trim().isEmpty()) { errors.put("userId", Boolean.TRUE); } }
	 */

}


