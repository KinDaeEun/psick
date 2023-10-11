package service.account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDao;
import dao.ReplyDao;
import service.CommandProcess;

public class ReplyDelete implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		int re_no = Integer.parseInt(request.getParameter("re_no"));
		int ano = Integer.parseInt(request.getParameter("ano"));

		
		ReplyDao rd = ReplyDao.getInstance();
		int result = rd.delete(re_no);
		
		
		request.setAttribute("result", result);
		request.setAttribute("ano", ano);

		return "replyDelete";
	}

}
