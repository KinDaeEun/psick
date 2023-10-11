package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyDao;
import model.Reply;
import service.CommandProcess;

public class AdminUpdateRepForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int re_no = Integer.parseInt(request.getParameter("re_no"));
		int ano = Integer.parseInt(request.getParameter("ano"));

		
		ReplyDao rld = ReplyDao.getInstance();
		Reply reply = rld.getReply(re_no);
		
		request.setAttribute("reply", reply);
		request.setAttribute("ano", ano);
		return "adminUpdateRepForm";
	}

}
