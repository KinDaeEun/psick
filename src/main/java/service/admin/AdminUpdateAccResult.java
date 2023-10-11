package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDao;
import model.Account;
import service.CommandProcess;

public class AdminUpdateAccResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int ano = Integer.parseInt(request.getParameter("ano"));
		String a_title = request.getParameter("a_title");
		String a_name = request.getParameter("a_name");
		String a_content = request.getParameter("a_content");
		int a_cnt = Integer.parseInt(request.getParameter("a_cnt"));
		
		Account account = new Account();
		account.setAno(ano);
		account.setA_title(a_title);
		account.setA_name(a_name);
		account.setA_content(a_content);
		account.setA_cnt(a_cnt);
		
		AccountDao ad = AccountDao.getInstance();
		int result = ad.adminUpdate(account);
		
		request.setAttribute("result", result);
		return "adminUpdateAccResult";
	}

}
