package service.display;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoveDao;
import dao.ProductDao;
import dao.ReviewDao;
import model.Love;
import model.Product;
import model.Review;
import service.CommandProcess;

public class LoveAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int pno = Integer.parseInt(request.getParameter("pno"));

		LoveDao ld = LoveDao.getInstance();
		Love love = ld.select(pno, id);
		int result = 0;
		String img = "";
		if (love == null) {
			result = ld.insert(pno, id);
			img = "/psick/images/icon_img/icon_like_on.svg";
		} else {

			if (love.getL_del().equals("y")) {
				result = ld.update(pno, id, "n");
				img = "/psick/images/icon_img/icon_like_on.svg";
			} else if (love.getL_del().equals("n")) {
				img = "/psick/images/icon_img/icon_like_off.png";
				result = ld.update(pno, id, "y");
			}
		}

		ProductDao pd = ProductDao.getInstance();
		Product product = pd.select(pno);

		ReviewDao rd = ReviewDao.getInstance();
		List<Review> rv = rd.selectReview(pno);
		float star_rate = rd.selectStar(pno);
		int star_count = rd.starCount(pno);

		request.setAttribute("result", result);
		request.setAttribute("img", img);
		request.setAttribute("pno", pno);
		request.setAttribute("product", product);
		request.setAttribute("rv", rv);
		request.setAttribute("star_rate", star_rate);
		request.setAttribute("star_count", star_count);

		return "product_content";
	}

}
