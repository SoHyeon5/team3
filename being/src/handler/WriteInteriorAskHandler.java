package handler;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.model.Writer;
import auth.service.User;
//import interior.service.WriteInteriorService;
import interior.service.WriteInteriorAskRequest;
import interior.service.WriteInteriorAskService;
import mvc.command.CommandHandler;

public class WriteInteriorAskHandler implements CommandHandler {
	private static final String FORM_VIEW = "/WEB-INF/view/interiorAsk/newInteriorAskForm.jsp";
	private WriteInteriorAskService writeService = new WriteInteriorAskService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private String processForm(HttpServletRequest req, HttpServletResponse res) {
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) {
		
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);

		try {
	         req.setCharacterEncoding("UTF-8");
	      } catch (UnsupportedEncodingException e1) {
	         e1.printStackTrace();
	      }
		
		User user = (User)req.getSession(false).getAttribute("authUser");

		
		WriteInteriorAskRequest interiorAskWriteReq = createInteriorAskWriterRequest(user, req);
		interiorAskWriteReq.validate(errors);
		
		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		int newInteriorAskNo = writeService.interiorAsk(interiorAskWriteReq);
		
		req.setAttribute("newInteriorAskNo", newInteriorAskNo);
		
		return "/WEB-INF/view/interiorAsk/newInteriorAskSuccess.jsp";
	}


	private WriteInteriorAskRequest createInteriorAskWriterRequest(User user, HttpServletRequest req) {
		return new	WriteInteriorAskRequest(
				new Writer(user.getId(), user.getName()),
				req.getParameter("title"),
				req.getParameter("name"),
				req.getParameter("area"),
				req.getParameter("field"),
				req.getParameter("address"),
				req.getParameter("dateStart"),
				req.getParameter("dateDone"),
				req.getParameter("budget"),
				req.getParameter("message"),
				req.getParameter("tel")
				);
	}
}
