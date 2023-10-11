package service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyDao;
import model.Reply;
import model.Review;
import service.CommandProcess;

public class AdminFindReply implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String searchKey =  request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		int ano = Integer.parseInt(request.getParameter("ano"));
		String keyName = "";
		if(searchKey.equals("re_no"))
			keyName = "댓글번호";
		if(searchKey.equals("id"))
			keyName = "작성자";
		
		
		ReplyDao rld = ReplyDao.getInstance();
		List<Reply> list = rld.adminSearch(searchKey,searchValue,ano);
		request.setAttribute("list", list);
		request.setAttribute("keyName", keyName);
		request.setAttribute("searchValue", searchValue);
		request.setAttribute("ano", ano);
		return "adminFindReply";
	}

}
