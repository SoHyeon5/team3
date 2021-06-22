package handler;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import store.service.PermissionDeniedException;
import auth.service.User;
import member.model.Member;
import member.service.ListMemberService;
import member.service.ModifyMemberRequest;
import member.service.ModifyMemberService;
import mvc.command.CommandHandler;
//import store.model.StoreReview;
//import store.service.ModifyStoreReviewRequest;
//import store.service.ModifyStoreReviewService;
import store.service.StoreNotFoundException;


public class ModifyMemberHandler implements CommandHandler {
	private static final String FORM_VIEW = "/WEB-INF/view/admin/modifyMemberLevelForm.jsp";

	private ListMemberService listService = new ListMemberService();
	private ModifyMemberService modifyMemberService = new ModifyMemberService();

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
			String id = req.getParameter("id");
			Member member = listService.getMember(id);
			User authUser = (User) req.getSession().getAttribute("authUser");
			if (authUser.getLevel() != 1) {
				res.sendError(HttpServletResponse.SC_FORBIDDEN);
				return null;
			}
//			if (!canModify(authUser, member)) {
//				res.sendError(HttpServletResponse.SC_FORBIDDEN);
//				return null;
//			}
			
			
			ModifyMemberRequest modReq = new ModifyMemberRequest(
					member.getId(),
					member.getName(),
					member.getRegDate(),
					member.getLevel()
					);

			req.setAttribute("modReq", modReq);
			return FORM_VIEW;
		} catch (StoreNotFoundException e) {
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	}
	
//	private boolean canModify(User authUser, StoreReview storeReview) {
//		String writerId = storeReview.getWriter().getId();
//		return authUser.getId().equals(writerId);
//	}

//	private boolean canModify(User authUser, StoreData storeData) {
//		String writerId = storeData.getStore().getWriter().getId();
//		return authUser.getId().equals(writerId);
//	}
	
//	private boolean canModify(User authUser, StoreData storeData) {
//		String writerId = storeData.getStore().getWriter().getId();
//		return authUser.getId().equals(writerId);
//	}

	private String processSubmit(HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		
		try {
	         req.setCharacterEncoding("UTF-8");
	      } catch (UnsupportedEncodingException e1) {
	         // TODO Auto-generated catch block
	         e1.printStackTrace();
	    }
		
		User authUser = (User) req.getSession().getAttribute("authUser");
		String id = req.getParameter("id");
//		int no = Integer.parseInt(noVal);
		

		ModifyMemberRequest modReq = new ModifyMemberRequest(
				id,
				Integer.parseInt(req.getParameter("level"))
				);
		req.setAttribute("modReq", modReq);

		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		modReq.validate(errors);
		
		
		
		
		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}
		try {
			modifyMemberService.modify(modReq);
			return "/WEB-INF/view/admin/modifyMemberLevelSuccess.jsp";
		} catch (StoreNotFoundException e) {
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		} catch (PermissionDeniedException e) {
			res.sendError(HttpServletResponse.SC_FORBIDDEN);
			return null;
		}
	}
}
