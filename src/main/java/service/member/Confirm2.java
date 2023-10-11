package service.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class Confirm2 implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {}
		String id = request.getParameter("id");
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(id);
		String msg = "";
		if (member != null)
			msg = "중복되니 다른 아이디 사용하세요";
		else
			msg = "사용가능한 아이디입니다";
		request.setAttribute("msg", msg);
		return "confirm2";
	}

}
