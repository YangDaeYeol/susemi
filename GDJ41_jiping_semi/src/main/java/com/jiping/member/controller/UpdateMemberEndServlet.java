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
		/* String profileImg=request.getParameter("profileImg"); */	
		String newPwCheck=request.getParameter("newPwCheck");
		String oriPw=request.getParameter("oriPw");
		String email=request.getParameter("email");
		System.out.println("email : "+email);
		
		Member oriM=new MemberService().selectMember(email);
		String pw="";
		
		if(newPwCheck!=null) {
			pw=newPwCheck;
		}else {
			pw=oriM.getPassword();
		}		
		System.out.println("pw :"+ pw);
		
		String newPhone=request.getParameter("newPhone");		
		String newNick=request.getParameter("newNick");
		System.out.println(newPhone);
		System.out.println(newNick);
//	 	멤버 카테고리, 멤버 지역 추가해야함!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
		 
		String marketing=request.getParameter("marketing");
		System.out.println("marketing : "+marketing);
		
		
		
		String newLLocation0=request.getParameter("newLLocation0");
		String newSLocation0=request.getParameter("newSLocation0");
		
		String newLLocation1=request.getParameter("newLLocation1").equals("미선택")?"":request.getParameter("newLLocation1");
		String newSLocation1=request.getParameter("newSLocation1").equals("미선택")?"":request.getParameter("newSLocation1");
		String newLLocation2=request.getParameter("newLLocation2").equals("미선택")?"":request.getParameter("newLLocation2");
		String newSLocation2=request.getParameter("newSLocation2").equals("미선택")?"":request.getParameter("newSLocation2");
			
		String location=newLLocation0+" "+newSLocation0+","+newLLocation1+" "+newSLocation1+","+newLLocation2+" "+newSLocation2+",";
		System.out.println(location);
		

		Member m=Member.builder()
//				.profileImg(profileImg)
				.password(pw)
				.phone(newPhone)
				.nickname(newNick)
				.marketing(marketing.charAt(0))
				.memberLocation(location)
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
