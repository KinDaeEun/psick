package service.account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDao;
import service.CommandProcess;

public class DeleteAction implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int ano = Integer.parseInt(request.getParameter("ano"));

		
		AccountDao ad = AccountDao.getInstance();
		int result = ad.delete(ano);
		
		request.setAttribute("result", result);
		request.setAttribute("ano", ano);
		return "delete";
	}
}
