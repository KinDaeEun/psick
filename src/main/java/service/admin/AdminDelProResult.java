package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import service.CommandProcess;

public class AdminDelProResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int pno = Integer.parseInt(request.getParameter("pno"));
		String p_del = request.getParameter("del");
		String msg = "";
		if(p_del.equals("y")) {
			msg="삭제성공";
		}else if(p_del.equals("n")) {
			msg="복구성공";
		}
		ProductDao pd = ProductDao.getInstance();
		int result = pd.changeDel(pno,p_del);
		request.setAttribute("result",result);
		request.setAttribute("msg", msg);
		return "adminDelProResult";
	}

}
