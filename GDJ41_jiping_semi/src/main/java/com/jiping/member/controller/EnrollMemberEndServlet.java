package com.jiping.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jiping.member.model.service.MemberService;
import com.jiping.member.model.vo.Member;

/**
 * Servlet implementation class EnrollMemberEndServlet
 */
@WebServlet("/enrollmemberend")
public class EnrollMemberEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollMemberEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Member m = Member.builder()
				.email(request.getParameter("email"))
				.memberGrade(request.getParameter("grade"))
				.password(request.getParameter("password"))
				.memberName(request.getParameter("userName"))
				.gender(request.getParameter("gender"))
				.phone(request.getParameter("phone"))
				.nickname(request.getParameter("nickName"))
				.marketing(request.getParameter("marketing").charAt(0))
				.build();
		System.out.println(request.getParameter("largeCategory1"));
		System.out.println(request.getParameter("largeCategory2"));
		System.out.println(request.getParameter("largeCategory3"));
		System.out.println(request.getParameter("smallCategory1"));
		System.out.println(request.getParameter("smallCategory2"));
		System.out.println(request.getParameter("smallCategory3"));
		int val = Integer.parseInt(request.getParameter("largeCategory1"));
		String category = "";
		switch(val) {
			case 1 : category = "취미/공예"; break;
			case 2 : category = "액티비티"; break;
			case 3 : category = "커리어"; break;
			case 4 : category = "디자인"; break;
		}
		category = category + " " + request.getParameter("smallCategory1") + ",";
			
		if(request.getParameter("largeCategory2")!=null) {
			int val2 = Integer.parseInt(request.getParameter("largeCategory2"));
			switch(val2) {
				case 1 : category = category + "취미/공예"; break;
				case 2 : category = category + "액티비티"; break;
				case 3 : category = category + "커리어"; break;
				case 4 : category = category + "디자인"; break;
			}
			category = category + " " + request.getParameter("smallCategory2") + ",";
			if(request.getParameter("largeCategory3")!=null) {
			int val3 = Integer.parseInt(request.getParameter("largeCategory3"));
				switch(val3) {
					case 1 : category = category + "취미/공예"; break;
					case 2 : category = category + "액티비티"; break;
					case 3 : category = category + "커리어"; break;
					case 4 : category = category + "디자인"; break;
				}
				category = category + " " + request.getParameter("smallCategory3") + ",";
			}
		}
		String location = "";
		location = request.getParameter("largeLocation1") + " " + request.getParameter("smallLocation1") + ",";
		System.out.println(location);
		if(!(request.getParameter("largeLocation2").equals("x"))) {
			System.out.println(location);
			location = location + request.getParameter("largeLocation2") + " " + request.getParameter("smallLocation2") + ",";
			System.out.println(location);
		}
		if(!(request.getParameter("largeLocation3").equals("x"))) {
			System.out.println(location);
			location = location + request.getParameter("largeLocation3") + " " + request.getParameter("smallLocation3") + ",";
			System.out.println(location);
		}
		System.out.println(location);
		m.setMemberCategory(category);
		m.setMemberLocation(location);
		
		int result = new MemberService().enrollMember(m);
		String msg = "";
		String loc = "";
		if(result>0) {
			msg = "회원가입에 성공하셨습니다!";
			loc = "/views/login/loginMain.jsp";
		}else {
			msg = "회원가입에 실패하였습니다. 관리자에게 문의하세요.";
			loc = "/";
		}
		request.setAttribute("msg", msg);
		request.getRequestDispatcher(loc).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
