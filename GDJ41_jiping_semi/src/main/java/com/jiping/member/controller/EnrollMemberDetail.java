package com.jiping.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jiping.member.model.vo.Member;

/**
 * Servlet implementation class EnrollMemberDetail
 */
@WebServlet(name="enrollmember" ,urlPatterns="/enrolldetail")
public class EnrollMemberDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollMemberDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String password = request.getParameter("password");
		Member m = Member.builder().email(request.getParameter("email"))
				.memberGrade(request.getParameter("type"))
				.memberName(request.getParameter("userName"))
				.nickname(request.getParameter("nickName"))
						.build();
		m.setPassword(password);
		System.out.println(m);
		request.setAttribute("member", m);
		request.getRequestDispatcher("/views/login/enrollDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
