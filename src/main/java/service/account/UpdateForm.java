package service.account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

import dao.AccountDao;
import model.Account;
import service.CommandProcess;

public class UpdateForm implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
//		HttpSession session = request.getSession();
//		String id = (String) session.getAttribute("id");
		AccountDao ad = AccountDao.getInstance();
		int ano = Integer.parseInt(request.getParameter("ano"));
		Account account = ad.select(ano);
		request.setAttribute("account", account);
//		request.setAttribute("id", id);

		return "updateForm";
	}

}
