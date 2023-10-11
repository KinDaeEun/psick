package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import service.CommandProcess;

public class AdminDelMemResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String m_del = request.getParameter("del");
		String msg = "";
		if(m_del.equals("y")) {
			msg="탈퇴성공";
		}else if(m_del.equals("n")) {
			msg="복구성공";
		}
		MemberDao md = MemberDao.getInstance();
		int result = md.changeDel(id,m_del);
		
		request.setAttribute("result", result);
		request.setAttribute("msg", msg);
		return "adminDelMemResult";
	}

}
