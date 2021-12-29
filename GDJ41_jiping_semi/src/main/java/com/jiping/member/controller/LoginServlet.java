package com.jiping.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jiping.member.model.service.MemberService;
import com.jiping.member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name="login", urlPatterns="/member/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		Member m=new MemberService().loginMember(email, password);
		
		if(m!=null) {
			HttpSession session=request.getSession();
			session.setAttribute("loginMember", m);
//			System.out.println(m);
			if(!m.getMemberGrade().equals("관리자")) {
				System.out.println("일반로그인");
				request.getRequestDispatcher("/").forward(request, response);
			}else {
				System.out.println("관리자 로그인");
				request.getRequestDispatcher("/views/admin/adminBasic.jsp").forward(request, response);
			}
			
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>alert('로그인에 실패하였습니다. 아이디와 비밀번호를 다시 확인해주세요.'); location.href='"
					+request.getContextPath()+"/views/login/loginMain.jsp';</script>");
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
