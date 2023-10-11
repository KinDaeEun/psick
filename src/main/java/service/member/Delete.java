package service.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import service.CommandProcess;

public class Delete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("urf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("id");
			MemberDao md = MemberDao.getInstance();
			int result = md.delete(id);
			if (result > 0) {
				session.invalidate();

			}
            //관리자 아이디일경우에 삭제안되게			
			request.setAttribute("result", result);
			return "delete";
	}

}
