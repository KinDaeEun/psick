package service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class AdminFindMember implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		String keyName = "";
		if (searchKey.equals("id"))
			keyName = "아이디";
		if (searchKey.equals("name"))
			keyName = "이름";


		MemberDao md = MemberDao.getInstance();
		List<Member> list = md.adminSearch(searchKey, searchValue);
		request.setAttribute("list", list);
		request.setAttribute("keyName", keyName);
		request.setAttribute("searchValue", searchValue);
		return "adminFindMember";
	}

}
