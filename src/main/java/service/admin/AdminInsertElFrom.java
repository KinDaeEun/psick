package service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EventListDao;
import dao.ProductDao;
import model.Product;
import service.CommandProcess;

public class AdminInsertElFrom implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int eno = Integer.parseInt(request.getParameter("eno"));

		ProductDao pd = ProductDao.getInstance();

		List<Product> list = pd.getNePro(eno);

		// jsp에 보낼 데이터를 request에 setting해야 한다
		request.setAttribute("list", list);
		request.setAttribute("eno", eno);
		return "adminInsertElFrom";
	}

}
