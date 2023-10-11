package service.account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.ReplyDao;
import model.Reply;
import service.CommandProcess;

public class ReplyUpdate implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");	
		int re_no = Integer.parseInt(request.getParameter("re_no"));
		String  ref_content = request.getParameter("ref_content");
		ReplyDao rd = ReplyDao.getInstance();
		Reply reply = rd.ref_select(re_no);
		
		reply.setRef_content(ref_content);
		reply.setId(id);
		System.out.println("ref_content="+ref_content);
	
		int result = rd.update(reply);
		int ano = rd.selectre_no();
		request.setAttribute("result", result);
		request.setAttribute("id", id);
		request.setAttribute("ref_content", ref_content);
		request.setAttribute("ano", ano);

		return "replyUpdate";
	}
}
