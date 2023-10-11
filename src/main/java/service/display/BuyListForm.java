package service.display;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BuyDao;
import dao.BuyListDao;
import dao.ProductDao;
import model.Buy;
import model.BuyList;
import model.Product;
import service.CommandProcess;

public class BuyListForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int bno = Integer.parseInt(request.getParameter("bno"));

		ProductDao pd = ProductDao.getInstance();
		List<Product> pdlist = pd.selectbuyPd(bno);



		BuyDao bd = BuyDao.getInstance();



		request.setAttribute("pdlist", pdlist);


		return "buyList2";
	}

}
