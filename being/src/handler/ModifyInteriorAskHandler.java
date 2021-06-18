package handler;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.User;
import interior.model.InteriorAsk;
import interior.service.InteriorNotFoundException;
import interior.service.ModifyInteriorAskRequest;
import interior.service.ModifyInteriorAskService;
import interior.service.PermissionDeniedException;
import interior.service.ReadInteriorAskService;
import mvc.command.CommandHandler;

public class ModifyInteriorAskHandler implements CommandHandler {
	private static final String FORM_VIEW = "/WEB-INF/view/interiorAsk/modifyInteriorAskForm.jsp";

	private ReadInteriorAskService readService = new ReadInteriorAskService();
	private ModifyInteriorAskService modifyService = new ModifyInteriorAskService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private String processForm(HttpServletRequest req, HttpServletResponse res)
			throws IOException {
		try {
			String noVal = req.getParameter("no");
			int no = Integer.parseInt(noVal);
			InteriorAsk interiorAsk = readService.getInteriorAsk(no);
			User authUser = (User) req.getSession().getAttribute("authUser");
			if (!canModify(authUser, interiorAsk)) {
				res.sendError(HttpServletResponse.SC_FORBIDDEN);
				return null;
			}
			
			
			
			ModifyInteriorAskRequest modReq = new ModifyInteriorAskRequest(authUser.getId(), 
					no,
					interiorAsk.getTitle(),
					interiorAsk.getName(),
					interiorAsk.getArea(),
					interiorAsk.getFieldOf(),
					interiorAsk.getAddress(),
					interiorAsk.getDateStart(),
					interiorAsk.getDateDone(),
					interiorAsk.getBudget(),
					interiorAsk.getMessage(),
					interiorAsk.getTel()
					);

			req.setAttribute("modReq", modReq);
			System.out.println(modReq);
			return FORM_VIEW;
		} catch (InteriorNotFoundException e) {
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	}
	private boolean canModify(User authUser, InteriorAsk interiorAsk) {
		String writerId = interiorAsk.getWriter().getId();
		return authUser.getId().equals(writerId);
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		
		try {
	         req.setCharacterEncoding("UTF-8");
	      } catch (UnsupportedEncodingException e1) {
	         e1.printStackTrace();
	    }
		
		User authUser = (User) req.getSession().getAttribute("authUser");
		String noVal = req.getParameter("no");
		System.out.println("noVal="+noVal);
		
		int no = Integer.parseInt(noVal);
		
		ModifyInteriorAskRequest modReq = new ModifyInteriorAskRequest(authUser.getLevel(), no,
				req.getParameter("answer")
				);
		req.setAttribute("modReq", modReq);

		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		modReq.validate(errors);
		
		
		System.out.println(modReq);
		
		/*
		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}
		*/
		
		try {
			modifyService.modify(modReq);
			return "/WEB-INF/view/interiorAsk/modifyInteriorAskSuccess.jsp";
		} catch (InteriorNotFoundException e) {
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		} catch (PermissionDeniedException e) {
			res.sendError(HttpServletResponse.SC_FORBIDDEN);
			return null;
		}
	}
}
