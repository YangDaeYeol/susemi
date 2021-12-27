package com.jiping.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

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
		boolean flag = false;
		if(certificationNumber.equals(AuthenticationKey)) {
			msg = "인증번호가 일치합니다. 회원가입을 진행해주세요.";
			flag = true;
		}else {
			msg = "인증번호 불일치, 다시 확인해주세요.";
		}
		JSONObject jo = new JSONObject();
		jo.put("msg", msg);
		jo.put("flag", flag);
		
		response.getWriter().print(jo);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
