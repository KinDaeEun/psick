package service.member;

import java.io.UnsupportedEncodingException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class JoinResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();

		}
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String addr = request.getParameter("addr");
		String addr_detail = request.getParameter("addr_detail");
		String gender = request.getParameter("gender");
		String tel = request.getParameter("tel");


		Member member = new Member();
		member.setName(name);
		member.setId(id);
		member.setPassword(password);
		member.setAddr(addr);
		member.setAddr_detail(addr_detail);
		member.setGender(gender);
		member.setTel(tel);
	

		int result = 0;
		MemberDao md = MemberDao.getInstance();

		result = md.insert(member);
		request.setAttribute("result", result);

		return "joinResult";

	}

}
