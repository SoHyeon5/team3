package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.ListMemberService;
import member.service.MemberPage;
import mvc.command.CommandHandler;

public class ListMemberHandler implements CommandHandler {

	private ListMemberService listService = new ListMemberService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) 
			throws Exception {
		String pageNoVal = req.getParameter("pageNo");
		int pageNo = 1;
		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		System.out.println("페이지 넘버는" + pageNoVal);
		MemberPage memberPage = listService.getMemberPage(pageNo);
		System.out.println(memberPage.getContent().get(0));
		req.setAttribute("memberPage", memberPage);
		return "/WEB-INF/view/admin/index.jsp";
	}

}
