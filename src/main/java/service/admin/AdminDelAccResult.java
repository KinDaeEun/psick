package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDao;
import dao.ProductDao;
import service.CommandProcess;

public class AdminDelAccResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int ano = Integer.parseInt(request.getParameter("ano"));
		String a_del = request.getParameter("del");
		String msg = "";
		if(a_del.equals("y")) {
			msg="삭제성공";
		}else if(a_del.equals("n")) {
			msg="복구성공";
		}
		AccountDao ad = AccountDao.getInstance();
		int result = ad.changeDel(ano,a_del);
		request.setAttribute("result",result);
		request.setAttribute("msg", msg);
		return "adminDelAccResult";
	}

}
