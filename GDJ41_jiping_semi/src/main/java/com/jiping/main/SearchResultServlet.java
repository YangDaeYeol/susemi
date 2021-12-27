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
 * Servlet implementation class SearchResultServlet
 */
@WebServlet("/searchResult")
public class SearchResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchResultServlet() {
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
		String keyword = request.getParameter("searchKeyword");
		List<Lecture> list = new LectureService().searchResult(keyword,cPage,numPerPage);
		int totalData = new LectureService().searchResultCount(keyword);
		int totalPage = (int)Math.ceil((double)totalData/numPerPage);
		int pageBarSize = 5;
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo+pageBarSize-1;
		String pageBar = "";
		if(totalData>12) {
			if(pageNo==1) {
				pageBar = "<span>[이전]</span>";
			}else {
				pageBar = "<a href='"+ request.getContextPath() + "/searchResult?searchKeyword=" + keyword + "&cPage=" + (pageNo-1) + "'>[이전]</a>";	
			}
			while(!(pageNo>pageEnd||pageNo>totalPage)) {
				if(cPage==pageNo) {
					pageBar += "<span>" + pageNo + "</span>";
				}else {
					pageBar += "<a href='" + request.getContextPath() + "/searchResult?searchKeyword=" + keyword + "&cPage=" + pageNo + "'>" + pageNo + "</a>";
				}
				pageNo++;
			}
			if(pageNo>totalPage) {
				pageBar += "<span>[다음]</span>";
			}else {
				pageBar += "<a href='" + request.getContextPath() + "/searchResult?searchKeyword=" + keyword + "&cPage=" + pageNo + "'>[다음]</a>";
			}
		}
		int a = 0;
		for(int i=0; i<10; i++) {
			list.add(list.get(a));
			if(a==0) a++;
			else a--;
		}
		request.setAttribute("list", list);
		request.setAttribute("keyword", keyword);
		request.setAttribute("totalData", totalData);
		request.setAttribute("pageBar", pageBar);
		request.getRequestDispatcher("/views/lecture/searchLecture.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
