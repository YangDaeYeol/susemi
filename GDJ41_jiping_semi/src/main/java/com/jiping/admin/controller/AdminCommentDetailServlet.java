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
 * Servlet implementation class AdminCommentDetail
 */
@WebServlet(name="adminCommentDetail", urlPatterns={"/admin/adminCommentDetail"})
public class AdminCommentDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCommentDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int commentNo = Integer.parseInt(request.getParameter("comment_no"));
		System.out.println("commentNo : "+commentNo);
		Report reportDetail = new AdminService().reprtDetail(commentNo);
		System.out.println("reportDetail : "+reportDetail);
		request.setAttribute("reportDetail",reportDetail);
		request.getRequestDispatcher("/views/admin/commentDetail.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
