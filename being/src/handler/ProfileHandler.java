package handler;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.User;
import member.service.ChangePasswordService;
import member.service.DuplicateIdException;
import member.service.InvalidPasswordException;
import member.service.JoinRequest;
import member.service.JoinService;
import member.service.MemberNotFoundException;
import member.service.ProfileData;
import member.service.ProfileService;
import mvc.command.CommandHandler;
import store.service.StoreData;
import store.service.StoreNotFoundException;

public class ProfileHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/view/main/profile.jsp";
	//private JoinService joinService = new JoinService();
	private ChangePasswordService changePwdSvc = new ChangePasswordService();
	private ProfileService profileService = new ProfileService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
		
	}

	private String processForm(HttpServletRequest req, HttpServletResponse res) throws IOException {
		try {
			User authUser = (User) req.getSession().getAttribute("authUser");
			String email = authUser.getId();
			ProfileData profileData = profileService.getProfile(email);

			req.setAttribute("profileData", profileData);
			return FORM_VIEW;
		} catch (StoreNotFoundException e) {
			req.getServletContext().log("no store", e);
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	}

	private String processSubmit(HttpServletRequest req, HttpServletResponse res)
	throws Exception {
		User user = (User)req.getSession().getAttribute("authUser");
			
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);

		String curPwd = req.getParameter("curPwd");
		String newPwd = req.getParameter("newPwd");
		
		if (curPwd == null || curPwd.isEmpty()) {
			errors.put("curPwd", Boolean.TRUE);
		}
		if (newPwd == null || newPwd.isEmpty()) {
			errors.put("newPwd", Boolean.TRUE);
		}
		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		try {
			changePwdSvc.changePassword(user.getId(), curPwd, newPwd);
			return "/WEB-INF/view/main/changePwdSuccess.jsp";
		} catch (InvalidPasswordException e) {
			errors.put("badCurPwd", Boolean.TRUE);
			return FORM_VIEW;
		} catch (MemberNotFoundException e) {
			res.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return null;
		}
	}

}
