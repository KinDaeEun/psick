package service.display;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EventDao;
import model.Event;
import service.CommandProcess;

public class EventForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		final int ROW_PER_PAGE = 5;
		final int PAGE_PER_BLOCK = 5;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		int endRow = startRow + ROW_PER_PAGE - 1;

		EventDao ed = EventDao.getInstance();
		
		int total = ed.getTotal();
		int ano = total - startRow + 1;
		int totalPage = (int) Math.ceil((double) total / ROW_PER_PAGE);
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;
		int endPage = startPage + PAGE_PER_BLOCK - 1;
		if (endPage > totalPage)
			endPage = totalPage;
		List<Event> list = ed.event(startRow, endRow);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		request.setAttribute("list", list);
		
		return "event";
	}

}
