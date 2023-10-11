package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDao;
import service.CommandProcess;

public class AdminDelRewResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int rno = Integer.parseInt(request.getParameter("rno"));
		int pno = Integer.parseInt(request.getParameter("pno"));
		String r_del = request.getParameter("del");
		String msg = "";
		if(r_del.equals("y")) {
			msg="삭제성공";
		}else if(r_del.equals("n")) {
			msg="복구성공";
		}
		ReviewDao rd = ReviewDao.getInstance();
		int result = rd.changeDel(rno,r_del);
		request.setAttribute("result", result);
		request.setAttribute("msg", msg);
		request.setAttribute("pno", pno);
		return "adminDelRewResult";
	}

}
