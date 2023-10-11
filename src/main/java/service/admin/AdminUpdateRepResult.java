package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyDao;
import model.Reply;
import service.CommandProcess;

public class AdminUpdateRepResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int re_no = Integer.parseInt(request.getParameter("re_no"));
		int ano = Integer.parseInt(request.getParameter("ano"));		
		String ref_content = request.getParameter("ref_content");
		
		ReplyDao rld = ReplyDao.getInstance();
		Reply reply = new Reply();
		reply.setRe_no(re_no);
		reply.setRef_content(ref_content);
		
		int result = rld.update(reply);

		
		request.setAttribute("result", result);
		request.setAttribute("ano", ano);
		return "adminUpdateRepResult";
	}

}
