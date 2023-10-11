package service.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class UpdateResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();
		}

		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String addr_detail = request.getParameter("addr_detail");
		String tel = request.getParameter("tel");
		String gender = request.getParameter("gender");
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(id);

		member.setId(id);
		member.setPassword(password);
		member.setName(name);
		member.setAddr(addr);
		member.setAddr_detail(addr_detail);
		member.setTel(tel);
		member.setGender(gender);

		int result = md.update(member);
		request.setAttribute("result", result);
		request.setAttribute("id", id);
		return "updateResult";
	}

}
