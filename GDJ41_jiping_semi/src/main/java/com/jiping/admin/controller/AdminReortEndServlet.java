package com.jiping.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jiping.admin.model.service.AdminService;
import com.jiping.admin.model.vo.Report;

/**
 * Servlet implementation class AdminReortEndServlet
 */
@WebServlet("/adminEndReport")
public class AdminReortEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReortEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String content=request.getParameter("reportContent");
		String title=request.getParameter("title");
		String writer=request.getParameter("writer");
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		String type=request.getParameter("type");
		
		Report r= new Report(commentNo,writer,type,content,null);
		
		int result= new AdminService().insertReport(r);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="신고처리가 완료되었습니다.";
			loc="/";
		}
		else {
			msg="신고처리에 실패하였습니다.";
			loc="/";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
