package service.display;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BuyDao;
import dao.BuyListDao;
import dao.MemberDao;
import dao.ProductDao;
import model.Buy;
import model.BuyList;
import model.Member;
import model.Product;
import service.CommandProcess;

public class BuyResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		Buy buy = new Buy();

		String b_addr = request.getParameter("b_addr");
		String b_tel = request.getParameter("b_tel");
		String b_reveiver = request.getParameter("b_reveiver");

		// Cart 상품 / 수량
		// pno 형변환
		String[] pno1 = request.getParameterValues("pno");
		int[] pnos = new int[pno1.length];
		for (int i = 0; i < pnos.length; i++) {
			pnos[i] = Integer.parseInt(pno1[i]);
			System.out.println(pnos[i]);
			
		}
		// count 형변환
		String[] count2 = request.getParameterValues("buy_count");
		int[] counts = new int[count2.length];
		for (int i = 0; i < counts.length; i++) {
			counts[i] = Integer.parseInt(count2[i]);
			System.out.println(counts[i]);
		}

		buy.setB_addr(b_addr);
		buy.setB_reveiver(b_reveiver);
		buy.setB_tel(b_tel);
		buy.setId(id);

		System.out.println(b_addr);
		System.out.println(b_reveiver);
		System.out.println(b_tel);

		BuyDao bd = BuyDao.getInstance();
		int result = bd.insert(buy);
		int bno = bd.selectbno();

		BuyListDao bld = BuyListDao.getInstance();

		MemberDao md = MemberDao.getInstance();
		Member member = md.select(id);

		int result2 = 0;

		for (int i = 0; i < pnos.length; i++) {

			BuyList buylist = new BuyList();
			buylist.setBno(bno);
			buylist.setPno(pnos[i]);
			buylist.setB_count(counts[i]);

			result2 = bld.insertbuyList(buylist);
		}


	

		request.setAttribute("bno", bno);
		request.setAttribute("result", result);


		return "buyResult";
	}

}
