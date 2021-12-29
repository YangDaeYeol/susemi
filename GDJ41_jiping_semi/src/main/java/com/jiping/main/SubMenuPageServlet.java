package com.jiping.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jiping.lecture.model.sevice.LectureService;
import com.jiping.lecture.model.vo.Lecture;

/**
 * Servlet implementation class SubMenuPageServlet
 */
@WebServlet("/submenupage")
public class SubMenuPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubMenuPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cPage;
		int numPerPage;
		
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage = 1;
		}
		try {
			numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
		}catch(NumberFormatException e) {
			numPerPage = 12;
		}
		String category = "";
		String largecategory = request.getParameter("largecategory");
		String smallcategory = request.getParameter("smallcategory");
		if(smallcategory!=null) {
			category = largecategory + " " + smallcategory;
		}else {
			category = largecategory;
		}
		List<Lecture> list = new LectureService().categoryList(category,cPage,numPerPage);
		int totalData = new LectureService().categoryListCount(category);
		int totalPage = (int)Math.ceil((double)totalData/numPerPage);
		int pageBarSize = 5;
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo+pageBarSize-1;
		String pageBar = "";
		if(totalData>12) {
			if(pageNo==1) {
				pageBar = "<span>&laquo;</span>";
			}else {
				pageBar = "<a href='"+ request.getContextPath() + "/submenupage?largecategory=" + largecategory + "&smallcategory=" + smallcategory + "&cPage=" + (pageNo-1) + "'>&laquo;</a>";	
			}
			while(!(pageNo>pageEnd||pageNo>totalPage)) {
				if(cPage==pageNo) {
					pageBar += "<span class='cpage'>" + pageNo + "</span>";
				}else {
					pageBar += "<a href='" + request.getContextPath() + "/submenupage?largecategory=" + largecategory + "&smallcategory=" + smallcategory + "&cPage=" + pageNo + "'>" + pageNo + "</a>";
				}
				pageNo++;
			}
			if(pageNo>totalPage) {
				pageBar += "<span>&raquo;</span>";
			}else {
				pageBar += "<a href='" + request.getContextPath() + "/submenupage?largecategory=" + largecategory + "&smallcategory=" + smallcategory + "&cPage=" + pageNo + "'>&raquo;</a>";
			}
		}
		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		request.getRequestDispatcher("/views/lecture/submentpage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
