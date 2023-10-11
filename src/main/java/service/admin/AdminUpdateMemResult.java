package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class AdminUpdateMemResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String addr = request.getParameter("addr");
		String addr_detail = request.getParameter("addr_detail");
		String gender = request.getParameter("gender");
		String tel = request.getParameter("tel");
		
		Member member = new Member();
		member.setId(id);
		member.setName(name);
		member.setPassword(password);
		member.setAddr(addr);
		member.setAddr_detail(addr_detail);
		member.setGender(gender);
		member.setTel(tel);
		
		MemberDao md = MemberDao.getInstance();
		int result = md.adminUpMem(member);
		
		
		request.setAttribute("result", result);
		return "adminUpdateMemResult";
	}

}
