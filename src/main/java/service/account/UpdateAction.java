package service.account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDao;
import model.Account;
import service.CommandProcess;

public class UpdateAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");	
		
		int ano = Integer.parseInt(request.getParameter("ano"));
		String a_title =request.getParameter("a_title");
		String a_name =request.getParameter("a_name");
		String a_content =request.getParameter("a_content");
		
		AccountDao ad = AccountDao.getInstance();
		Account account = ad.select(ano);
		
		account.setA_title(a_title);
		account.setA_name(a_name);
		account.setA_content(a_content);
		account.setId(id);
		
			
		int result  = ad.update(account);
		request.setAttribute("result", result);
		request.setAttribute("ano", ano);
		
		
		return "update";
	}

}
