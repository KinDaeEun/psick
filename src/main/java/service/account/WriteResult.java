package service.account;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.AccountDao;
import dao.ReplyDao;
import model.Account;
import model.Reply;
import service.CommandProcess;

public class WriteResult implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
//		int ano = Integer.parseInt(request.getParameter("ano"));
		
		
		Account account = new Account();

		String a_title =request.getParameter("a_title");
		String a_name =request.getParameter("a_name");
		String a_content =request.getParameter("a_content");
		
		// account 세팅
		account.setA_title(a_title);
		account.setA_name(a_name);
		account.setId(id);
		account.setA_content(a_content);


		// accountDao, insert
		AccountDao ad = AccountDao.getInstance();
		int result = ad.insert(account);
		int ano = ad.selectAno();
		request.setAttribute("result", result);
		request.setAttribute("id", id);
		request.setAttribute("ano", ano);

		return "writeResult";
	}

}
