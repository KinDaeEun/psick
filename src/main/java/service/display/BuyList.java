package service.display;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BuyListDao;
import dao.ProductDao;
import model.Product;
import service.CommandProcess;

public class BuyList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		BuyListDao bl = BuyListDao.getInstance();
		List<Product> pdlist = bl.selectbuyall(id);
		
		request.setAttribute("pdlist", pdlist);
		return "buyList";

	}

}
