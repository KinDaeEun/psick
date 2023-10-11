package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ProductDao;
import model.Product;
import service.CommandProcess;

public class AdminUpdateProResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String real = request.getServletContext().getRealPath("/images/product-img");
		int maxSize = 1024 * 11024 * 10;
		Product product = new Product();
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(request, real,maxSize,"utf-8",
				new DefaultFileRenamePolicy());
			int pno = Integer.parseInt(mr.getParameter("pno"));
			String pname = mr.getParameter("pname");
			String p_kind = mr.getParameter("p_kind");
			int p_price = Integer.parseInt(mr.getParameter("p_price"));
			int discount = Integer.parseInt(mr.getParameter("discount"));
			String p_country = mr.getParameter("p_country");
			int p_count =Integer.parseInt(mr.getParameter("p_count"));
			String p_detail_content = mr.getParameter("p_detail_content");
			String p_detail_img = mr.getFilesystemName("p_detail_img");
			
			product.setPno(pno);
			product.setPname(pname);
			product.setP_kind(p_kind);
			product.setP_price(p_price);
			product.setDiscount(discount);
			product.setP_country(p_country);
			product.setP_count(p_count);
			product.setP_detail_content(p_detail_content);
			product.setP_detail_img(p_detail_img);
			
			

		}catch (Exception e) {
			System.out.println(e.getMessage());
			
		}

		ProductDao pd = ProductDao.getInstance();
		int result = pd.updatePro(product);
		request.setAttribute("result", result);	

		return "adminUpdateProResult";
	}

}
