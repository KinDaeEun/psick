package service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyDao;
import dao.ReviewDao;
import model.Reply;
import model.Review;
import service.CommandProcess;

public class AdminReply implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int ano = Integer.parseInt(request.getParameter("ano"));
		
		
		final int ROW_PER_PAGE = 10;// 한페이지의 상품 갯수
		final int PAGE_PER_BLOCK = 5;// 한 블록의 페이지 갯수
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);// 페이지 번호

		//시작번호	(페이지번호 - 1) * 페이지당 갯수+ 1				
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;// 해당 페이지의 첫 상품
		// 끝번호 시작번호 + 페이지당개수 - 1
		int endRow = startRow + ROW_PER_PAGE - 1;
		
		ReplyDao rld = ReplyDao.getInstance();
		int total = rld.getTotalAll(ano);
		int totalPage=(int)Math.ceil((double)total/ ROW_PER_PAGE);//총 페이지 수
		//	현재페이지 - (현재페이지 - 1)%10
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;//한 블록의 사작 페이지		
		//	시작페이지 + 블록당페이지 수 -1
		int endPage = startPage + PAGE_PER_BLOCK - 1;
		//  endPage는 총페이지 보다 크면 안된다	
		if (endPage > totalPage)
			endPage = totalPage;
		List<Reply> list = rld.getAccReply(startRow, endRow, ano);
		
		
		request.setAttribute("ano", ano);
		request.setAttribute("list", list);
		request.setAttribute("startPage",startPage);
		request.setAttribute("endPage",endPage);
		request.setAttribute("PAGE_PER_BLOCK",PAGE_PER_BLOCK);
		request.setAttribute("totalPage",totalPage);
		
		return "adminReply";
	}

}
