package service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EventDao;
import dao.EventListDao;
import dao.ProductDao;
import model.Product;
import service.CommandProcess;

public class AdminEventList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int eno = Integer.parseInt(request.getParameter("eno"));

		ProductDao pd = ProductDao.getInstance();


		List<Product> list = pd.eventPro(eno);
		System.out.println("size = "+list.size());

		//jsp에 보낼 데이터를 request에 setting해야 한다
		request.setAttribute("eno",eno);
		request.setAttribute("list",list);

		return "adminEventList";
	}

}
