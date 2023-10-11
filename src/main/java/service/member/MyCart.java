package service.member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDao;
import dao.MemberDao;
import dao.ProductDao;
import model.Cart;
import model.Member;
import model.Product;
import service.CommandProcess;

public class MyCart implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		if (session.getAttribute("id") != null) {
			String id = (String) session.getAttribute("id");
		//	int goods_price = Integer.parseInt(request.getParameter("goods_price"));
			MemberDao md = MemberDao.getInstance();
			ProductDao pd = ProductDao.getInstance();
			Member member = md.select(id);

//			int cno = Integer.parseInt(request.getParameter("cno"));
			int pno = Integer.parseInt(request.getParameter("pno"));

	

			Cart cart = new Cart();
			cart.setId(id);
			cart.setPno(pno);

//			cart.setCno(cno);
			int result = pd.insert(cart);

//		    for(Cart cart : list) {
//				Product product = pd.select(cart.getPno());
//				cart.setPrice(product.getP_price());
//			}
			request.setAttribute("member", member);
			request.setAttribute("result", result);
	//		request.setAttribute("goods_price", goods_price);
//			request.setAttribute("cno", cno);

		}
		return "/views/member/myCart";
	}

}
