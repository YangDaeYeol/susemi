package com.jiping.lecture.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.jiping.lecture.model.sevice.LectureService;
import com.jiping.payment.model.vo.Payment;

/**
 * Servlet implementation class LectureCheckPaymentAjaxServlet
 */
@WebServlet("/lecture/lecturePaymentAjax")
public class LectureCheckPaymentAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectureCheckPaymentAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int lecturNo=Integer.parseInt(request.getParameter("lectureNo"));
		String paymentEmail= request.getParameter("paymentEmail");
		
		Payment p= new LectureService().payment(lecturNo, paymentEmail);
		new Gson().toJson(p,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
