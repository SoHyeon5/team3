package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import interior.model.InteriorAsk;
import interior.service.InteriorNotFoundException;
import interior.service.ReadInteriorAskService;
import mvc.command.CommandHandler;

public class ReadInteriorAskHandler implements CommandHandler {

	private ReadInteriorAskService readInterior = new ReadInteriorAskService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) 
			throws Exception {
		String noVal = req.getParameter("no");
		int interiorAskNo = Integer.parseInt(noVal);
		try {
			InteriorAsk interiorAsk = readInterior.getInteriorAsk(interiorAskNo);
			req.setAttribute("interiorAsk", interiorAsk);
			return "/WEB-INF/view/interiorAsk/readInteriorAsk.jsp";
		} catch (InteriorNotFoundException e) {
			req.getServletContext().log("no interiorAsk", e);
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	}

}
