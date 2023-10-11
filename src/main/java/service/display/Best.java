package service.display;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import model.Product;
import service.CommandProcess;

public class Best implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		final int ROW_PER_PAGE = 12;
		final int PAGE_PER_BLOCK = 5; // 한 블럭이 10개 페이지에 들어간다
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);

		/* 시작번호 (페이지번호 - 1) * 페이지당 갯수+ 1 */
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		/* 끝번호 시작번호 + 페이지당개수 - 1 */
		int endRow = startRow + ROW_PER_PAGE - 1;

		ProductDao pd = ProductDao.getInstance();
		String condition = "pno in (select pno from review group by pno having avg(star)>=2)";
		int total = pd.getTotal(condition);
		int totalPage = (int) Math.ceil((double) total / ROW_PER_PAGE);

		/* 현재페이지 - (현재페이지 - 1) % PAGE_PER_BLOCK */
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;
		/* 끝페이지 시작페이지 + 블록당페이지 수 - 1 */
		int endPage = startPage + PAGE_PER_BLOCK - 1;
		// endPage 는 총 페이지보다 크면 안된다 / endPage와 totalPage를 같게 만들어야함
		if (endPage > totalPage)
			endPage = totalPage;

		List<Product> list = pd.best(startRow, endRow);
		System.out.println(list.size());

		request.setAttribute("list", list);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		request.setAttribute("pageNum", pageNum);

		return "best";
	}

}
