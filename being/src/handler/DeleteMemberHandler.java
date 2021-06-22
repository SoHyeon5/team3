package handler;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.service.ArticleNotFoundException;
import article.service.DeleteArticleService;
import article.service.DeleteRequest;
import article.service.PermissionDeniedException;
import auth.service.User;
import member.service.DeleteMemberService;
import mvc.command.CommandHandler;

public class DeleteMemberHandler implements CommandHandler {
	//private static final String FORM_VIEW = "/WEB-INF/view/board/listArticle.jsp";
	
	private DeleteMemberService deleteMemberService = new DeleteMemberService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processSubmit(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private String processSubmit(HttpServletRequest req, HttpServletResponse res)
			throws Exception { 
		User authUser = (User) req.getSession().getAttribute("authUser");

		req.setAttribute("authUser", authUser);

		try {
			deleteMemberService.delete(authUser);;
			return "/WEB-INF/view/main/deleteMemberSuccess.jsp";
		} catch (ArticleNotFoundException e) {
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		} catch (PermissionDeniedException e) {
			res.sendError(HttpServletResponse.SC_FORBIDDEN);
			return null;
		}
	}


}
