package service.account;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDao;
import model.Account;
import service.CommandProcess;

public class ListSearch implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {		
		String list_search_data = request.getParameter("list_search_data");
		
		AccountDao ad = AccountDao.getInstance();
		List<Account> adList = ad.search(list_search_data);
		
		
		request.setAttribute("adList", adList);
		request.setAttribute("list_search_data", list_search_data);
				
		return "listSearch";
	}
}
