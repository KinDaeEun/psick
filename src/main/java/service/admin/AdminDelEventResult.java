package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EventDao;
import service.CommandProcess;

public class AdminDelEventResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int eno = Integer.parseInt(request.getParameter("eno"));
		String e_del = request.getParameter("del");
		String msg = "";
		if(e_del.equals("y")) {
			msg="삭제성공";
		}else if(e_del.equals("n")) {
			msg="복구성공";
		}
		EventDao ed = EventDao.getInstance();
		int result = ed.changeDel(eno,e_del);
		request.setAttribute("result",result);
		request.setAttribute("msg", msg);
		return "adminDelEventResult";
	}

}
