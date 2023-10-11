package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyDao;
import service.CommandProcess;

public class AdminDelRepResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int re_no = Integer.parseInt(request.getParameter("re_no"));
		int ano = Integer.parseInt(request.getParameter("ano"));
		String ref_del = request.getParameter("del");
		String msg = "";
		if(ref_del.equals("y")) {
			msg="삭제성공";
		}else if(ref_del.equals("n")) {
			msg="복구성공";
		}
		ReplyDao rld = ReplyDao.getInstance();
		int result = rld.changeDel(re_no,ref_del);
		request.setAttribute("result", result);
		request.setAttribute("msg", msg);
		request.setAttribute("ano", ano);

		return "adminDelRepResult";
	}

}
