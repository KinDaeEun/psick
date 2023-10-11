package service.display;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoveDao;
import dao.ProductDao;
import dao.ReviewDao;
import model.Cart;
import model.Love;
import model.Product;
import model.Review;
import service.CommandProcess;

public class Detail implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int pno = Integer.parseInt(request.getParameter("pno"));

		// 상세페이지
		ProductDao pd = ProductDao.getInstance();
		Product product = pd.select(pno);
		product.setPno(pno);
		pno = product.getPno();

		// 상품평
		ReviewDao rd = ReviewDao.getInstance();
		float star_rate = rd.selectStar(pno);
		int star_count = rd.starCount(pno);
		List<Review> reviewList = rd.selectReview(pno);

		// 슬로건 상품리스트
		List<Product> slogan_pd = pd.sloganPd(pno);

		// 슬로건 별점
		List<Float> slogan_star = rd.sloganStar(pno);

		// 찜하기
		String img = "/psick/images/icon_img/icon_like_off.png";

		if (id != null) {
			LoveDao ld = LoveDao.getInstance();
			Love love = ld.select(pno, id);

			if (love == null) {
				img = "/psick/images/icon_img/icon_like_off.png";
			} else {
				if (love.getL_del().equals("y")) {
					img = "/psick/images/icon_img/icon_like_off.png";

				} else if (love.getL_del().equals("n")) {
					img = "/psick/images/icon_img/icon_like_on.svg";

				}
			}
		}
		// 장바구니 버튼 활성화 또는 비활성화

		String msg = "";
		String nmsg = "";
		Cart cart = null;
		if (id != null) {
			cart = pd.select1(pno, id);
			if (cart == null) {
				nmsg = "장바구니";
			} else {
				msg = "이미있는 상품 입니다";
			}
		}
		request.setAttribute("star_rate", star_rate);
		request.setAttribute("product", product);
		request.setAttribute("star_count", star_count);
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("slogan_pd", slogan_pd);
		request.setAttribute("slogan_star", slogan_star);
		request.setAttribute("pno", pno);
		request.setAttribute("img", img);
		request.setAttribute("id", id);
		request.setAttribute("msg", msg);
		request.setAttribute("nmsg", nmsg);
		request.setAttribute("cart", cart);
		return "product_content";
	}

}
