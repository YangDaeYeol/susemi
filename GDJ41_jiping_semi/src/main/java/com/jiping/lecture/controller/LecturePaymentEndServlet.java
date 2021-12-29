package com.jiping.lecture.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jiping.lecture.model.sevice.LectureService;
import com.jiping.payment.model.vo.Payment;

/**
 * Servlet implementation class LecturePaymentEndServlet
 */
@WebServlet("/lecture/paymentEnd.do")
public class LecturePaymentEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LecturePaymentEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String lectureNo = request.getParameter("lectureNo");
		String email= request.getParameter("email");
		String paymentType = request.getParameter("paymentType");
		String paymentPrice = request.getParameter("paymentPrice");
		String merchantNo = request.getParameter("merchantNo");
		String scheduleNo = request.getParameter("scheduleNo");
		
		System.out.println("lectureNo : "+lectureNo);
		System.out.println("email : "+email);
		System.out.println("paymentType : "+paymentType);
		System.out.println("paymentPrice : "+paymentPrice);
		System.out.println("merchantNo : "+merchantNo);
		System.out.println("scheduleNo : "+scheduleNo);
		
		Payment pay = Payment.builder()
				.lectureNo(Integer.parseInt(lectureNo))
				.email(email)
				.paymentType(paymentType)
				.paymentPrice(Integer.parseInt(paymentPrice))
				.merchantNo(merchantNo)
				.scheduleNo(Integer.parseInt(scheduleNo))
				.build();
				
		int result = new LectureService().paymentInfoEnroll(pay);
		
		String msg="";
		String loc="/lecture/lecture.do?lectureNo="+lectureNo;
		
		if(result>0) {
			msg="payment DB에 저장 성공";
		} else {
			msg="payment DB에 저장 실패";
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
