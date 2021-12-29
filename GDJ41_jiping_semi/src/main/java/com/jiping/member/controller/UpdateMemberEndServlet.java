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
@WebServlet(name="updateMemberEnd" ,urlPatterns="/member/updateMemberEnd.do")
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
		String profileImg=request.getParameter("profileMemberImg");
		
		System.out.println("이미지 파일 : "+profileImg);
		
		String newPassword=request.getParameter("password_new");
		String email=request.getParameter("email");
		String newPhone=request.getParameter("newPhone");		
		String newNick=request.getParameter("newNick");
		String marketing=request.getParameter("marketing");

		Member oriM=new MemberService().selectMember(email);
		
		request.setAttribute("loginMember", oriM);
		request.setAttribute("email", email);
		
//		관심분야
		String newLCategory0=request.getParameter("newLCategory0");
		String newSCategory0=request.getParameter("newSCategory0");
		String newLCategory1=request.getParameter("newLCategory1");
		String newSCategory1=request.getParameter("newSCategory1");
		String newLCategory2=request.getParameter("newLCategory2");
		String newSCategory2=request.getParameter("newSCategory2");
		
		String category=newLCategory0+" "+newSCategory0+","+newLCategory1+" "+newSCategory1+","+newLCategory2+" "+newSCategory2;
		System.out.println(category);
		
//		관심지역
		String newLLocation0=request.getParameter("newLLocation0");
		String newSLocation0=request.getParameter("newSLocation0");
		String newLLocation1=request.getParameter("newLLocation1").equals("미선택")?"":request.getParameter("newLLocation1");
		String newSLocation1=request.getParameter("newSLocation1").equals("미선택")?"":request.getParameter("newSLocation1");
		String newLLocation2=request.getParameter("newLLocation2").equals("미선택")?"":request.getParameter("newLLocation2");
		String newSLocation2=request.getParameter("newSLocation2").equals("미선택")?"":request.getParameter("newSLocation2");
			
		String location=newLLocation0+" "+newSLocation0+","+newLLocation1+" "+newSLocation1+","+newLLocation2+" "+newSLocation2;
		System.out.println(location);
		

		Member m=Member.builder()
				.email(email)
				.profileImg(profileImg)
				.password(newPassword)
				.phone(newPhone)
				.nickname(newNick)
				.marketing(marketing.charAt(0))
				.memberLocation(location)
				.memberCategory(category)
				.build();
		
		System.out.println(m);
		int result;
		if(newPassword.equals("z4PhNX7vuL3xVChQ1m2AB9Yg5AULVxXcg/SpIdNs6c5H0NE8XYXysP+DGNKHfuwvY7kxvUdBeoGlODJ6+SfaPg==")) {
			result=new MemberService().updateMember2(m);
		}else {
			result=new MemberService().updateMember(m);
		}
		
		
		if(result>0) {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>alert('회원정보 수정이 완료되었습니다!');</script>");
			request.getRequestDispatcher("/member/mypage.do?email="+email).forward(request, response);			
			out.close();
		}else {
			m=new MemberService().selectMember(email);
			request.setAttribute("loginMember", m);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>alert('시스템 오류로 회원 정보수정에 실패하였습니다.관리자에게 문의하세요'); location.href='"
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
