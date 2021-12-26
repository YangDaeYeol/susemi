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

/**
 * Servlet implementation class DropMemberEndServlet
 */
@WebServlet("/member/dropEnd.do")
public class DropMemberEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DropMemberEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		System.out.println(email);
		int result=new MemberService().dropMember(email);
		if(result>0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>alert('회원탈퇴가 정상적으로 진행되었습니다. \n 그동안 저희 지핑을 이용해주셔서 감사합니다.'); location.href='"
					+request.getContextPath()+"/';</script>");
			out.close();
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>alert('회원탈퇴 실패~ 탈퇴하지마~~~'); location.href='"
					+request.getContextPath()+"/';</script>");
			out.close();
		}
		
		HttpSession session=request.getSession(false);
		if(session!=null) {
			session.invalidate();
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
