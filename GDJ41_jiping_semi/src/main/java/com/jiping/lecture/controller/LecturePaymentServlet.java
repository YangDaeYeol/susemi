package com.jiping.lecture.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LecturePaymentServlet
 */
@WebServlet("/lecture/lecturePayment")
public class LecturePaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LecturePaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String thumbnail =request.getParameter("thumbnail");
		String lectureType = request.getParameter("lectureType");
		String lectureTitle = request.getParameter("lectureTitle");
		String tutorImg = request.getParameter("tutorImg");
		String tutorNickName = request.getParameter("tutorNickName");
		String lecturePrice = request.getParameter("lecturePrice");
		String lectureDate = request.getParameter("lectureDate");
		String lectureAddr = request.getParameter("lectureAddr");
		
		System.out.println(thumbnail);
		System.out.println(lectureType);
		System.out.println(lectureTitle);
		System.out.println(tutorImg);
		System.out.println(tutorNickName);
		System.out.println(lecturePrice);
		System.out.println(lectureDate);
		System.out.println(lectureAddr);
		
		
		request.setAttribute("thumbnail", thumbnail);
		request.setAttribute("lectureType", lectureType);
		request.setAttribute("lectureTitle", lectureTitle);
		request.setAttribute("tutorImg", tutorImg);
		request.setAttribute("tutorNickName", tutorNickName);
		request.setAttribute("lecturePrice", lecturePrice);
		request.setAttribute("lectureDate", lectureDate);
		request.setAttribute("lectureAddr", lectureAddr);
		
		request.getRequestDispatcher("/views/lecture/payment.jsp").forward(request, response);
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
