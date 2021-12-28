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
 * Servlet implementation class UpdateMemberEndServlet
 */
@WebServlet("/member/updateMemberEnd.do")
public class UpdateMemberEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String profileImg=request.getParameter("profileImg");		
		String newPwCheck=request.getParameter("newPwCheck");
		String pw="";
		if(newPwCheck!=null) {
			pw=request.getParameter("newPwCheck");
		}else {
			pw=request.getParameter("oriPw");
		}		
		
		String newPhone=request.getParameter("newPhone");		
		String newNick=request.getParameter("newNick");
		 
//	 	멤버 카테고리, 멤버 지역 추가해야함!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
		 
		String marketing=request.getParameter("marketing");
		System.out.println("marketing : "+marketing);
		String email=request.getParameter("email");
		System.out.println("email : "+email);
		Member m=Member.builder()
				.profileImg(profileImg)
				.password(pw)
				.phone(newPhone)
				.nickname(newNick)
				.marketing(marketing.charAt(0))
				.build();
		int result=new MemberService().updateMember(m);
		
		if(result>0) {			
			request.getRequestDispatcher("/member/mypage.do?email="+email).forward(request, response);			
		}else {
			m=new MemberService().selectMember(email);
			request.setAttribute("loginMember", m);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>alert('회원 정보수정에 실패하였습니다. 다시 시도하세요.'); location.href='"
					+request.getContextPath()+"/member/updateMember.do?email="+email+"';</script>");
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
