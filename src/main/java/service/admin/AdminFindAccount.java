package service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDao;
import model.Account;
import service.CommandProcess;

public class AdminFindAccount implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String searchKey =  request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		String keyName = "";
		if(searchKey.equals("ano"))
			keyName = "게시번호";
		if(searchKey.equals("id"))
			keyName = "작성자";
		if(searchKey.equals("a_title"))
			keyName = "제목";
		
		
		AccountDao ad = AccountDao.getInstance();
		List<Account> list = ad.adminSearch(searchKey,searchValue);
		request.setAttribute("list", list);
		request.setAttribute("keyName", keyName);
		request.setAttribute("searchValue", searchValue);
		return "adminFindAccount";
	}

}
