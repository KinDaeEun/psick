package service.display;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BuyDao;
import dao.MemberDao;
import dao.ProductDao;
import model.Buy;
import model.Member;
import model.Product;
import service.CommandProcess;

public class BuyAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int pno = Integer.parseInt(request.getParameter("pno"));
		int count = Integer.parseInt(request.getParameter("count"));
		int goods_price = Integer.parseInt(request.getParameter("goods_price"));
		
		ProductDao pd = ProductDao.getInstance();
		Product product = pd.select(pno);		
		
	
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(id);

		
	
		request.setAttribute("id", id);
		request.setAttribute("product", product);
		request.setAttribute("member", member);
		request.setAttribute("goods_price", goods_price);
		request.setAttribute("count", count);
		
		return "buyForm";
	}

}
