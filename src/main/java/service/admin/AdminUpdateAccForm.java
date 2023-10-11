package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDao;
import model.Account;
import service.CommandProcess;

public class AdminUpdateAccForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int ano = Integer.parseInt(request.getParameter("ano"));
		AccountDao ad = AccountDao.getInstance();
		Account account = ad.select(ano);
		
		request.setAttribute("account", account);
		return "adminUpdateAccForm";
	}

}
