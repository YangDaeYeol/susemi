package com.jiping.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jiping.member.model.service.MemberService;
import com.jiping.member.model.vo.Member;

/**
 * Servlet implementation class PasswordCheckEndServlet
 */

@WebServlet(name="passwordCheck", urlPatterns="/member/passwordCheckEnd.do")
public class PasswordCheckEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordCheckEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		System.out.println(email);
		String pw=request.getParameter("password");
		System.out.println(pw);
		Member m=new MemberService().loginMember(email,pw);
		System.out.println(m);
		request.setAttribute("loginMember", m);
		
		if(m!=null) {
	         request.getRequestDispatcher("/views/member/memberUpdate.jsp").forward(request,response);
		}else {
	         PrintWriter out=response.getWriter();
	         out.println("<script>alert('비밀번호가 일치하지 않습니다. 다시 입력하세요!'); location.href='"
	               +request.getContextPath()+"/member/passwordCheck.do?email="+email+"';</script>");
	         out.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
