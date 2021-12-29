package com.jiping.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jiping.admin.model.service.AdminService;
import com.jiping.lecture.model.sevice.LectureService;

/**
 * Servlet implementation class AdminCommentListDeleteServlet
 */
@WebServlet("/AdminCommentListDeleteServlet")
public class AdminCommentListDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCommentListDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int commentNo = Integer.parseInt(request.getParameter("comment_no"));
		System.out.println(commentNo);
		int reportCommentResult = new AdminService().reportDelete(commentNo);
		
		if(reportCommentResult!=0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		request.getRequestDispatcher("/admin/adminComment").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
