package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import dao.MemberDao;
import dao.ProductDao;
import model.Cart;
import model.Member;
import service.CommandProcess;

public class MyCartListDel implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		if (session.getAttribute("id") != null) {
			String id = (String) session.getAttribute("id");
			MemberDao md = MemberDao.getInstance();
			ProductDao pd = ProductDao.getInstance();
			Member member = md.select(id);

			int pno = Integer.parseInt(request.getParameter("pno"));

			Cart cart = new Cart();
			cart.setId(id);
			cart.setPno(pno);
			int result = pd.delete(cart);

			request.setAttribute("member", member);
			request.setAttribute("result", result);
		}
		return "myCartListDel";
	}

}
