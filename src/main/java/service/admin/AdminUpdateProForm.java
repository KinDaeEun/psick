package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import model.Product;
import service.CommandProcess;

public class AdminUpdateProForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int pno = Integer.parseInt(request.getParameter("pno"));
		ProductDao pd = ProductDao.getInstance();
		Product product = pd.select(pno);
		
		request.setAttribute("product", product);
		return "adminUpdateProForm";
	}

}
