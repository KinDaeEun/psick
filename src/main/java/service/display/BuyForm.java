package service.display;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.ProductDao;
import model.Member;
import model.Product;
import service.CommandProcess;

public class BuyForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		String[] count1 = request.getParameterValues("buy_count");

		String goods_price = request.getParameter("goods_price");

		ProductDao pd = ProductDao.getInstance();


		MemberDao md = MemberDao.getInstance();
		Member member = md.select(id);


		String[] pno1 = request.getParameterValues("pno");
		int[] pnos = new int[pno1.length];
		for (int i = 0; i < pnos.length; i++) {
			pnos[i] = Integer.parseInt(pno1[i]);
		}


		int[] counts = new int[count1.length];
		for (int i = 0; i < counts.length; i++) {
			counts[i] = Integer.parseInt(count1[i]);
		}
		
		
		List<Product> list = new ArrayList<Product>();
		for (int i = 0; i < pnos.length; i++) {
			Product product = pd.select(pnos[i]);
			System.out.println(counts[i]);
			product.setBuy_count(counts[i]);
			list.add(product);
		}
		
		



		request.setAttribute("id", id);
		request.setAttribute("list", list);
		request.setAttribute("member", member);

		request.setAttribute("goods_price", goods_price);


		return "buyForm";
	}

}
