package com.jiping.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CertificationNumber
 */
@WebServlet("/certificationNumber")
public class CertificationNumber extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CertificationNumber() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String certificationNumber = request.getParameter("val");
		HttpSession session = request.getSession();
		String AuthenticationKey = (String)session.getAttribute("AuthenticationKey");
		String msg = "";
		if(certificationNumber.equals(AuthenticationKey)) {
			System.out.println("맞아!");
			msg = "인증번호가 일치합니다. 회원가입을 진행해주세요.";
		}else {
			System.out.println("아니야!");
			msg = "인증번호 불일치, 다시 확인해주세요.";
		}
		response.getWriter().write(msg);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
