package com.jiping.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jiping.lecture.model.vo.Lecture;
import com.jiping.member.model.service.MemberService;
import com.jiping.member.model.vo.Member;

/**
 * Servlet implementation class TutorRunClassServlet
 */
@WebServlet(name="tutorRunClass", urlPatterns={"/member/tutorRunClass.do"})
public class TutorRunClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TutorRunClassServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String nickname=request.getParameter("nickname");		
		
		Member m=new MemberService().selectMember(email);
		List<Lecture> list=new MemberService().lectureTutorList(nickname);
		int count=new MemberService().lectureTutorListCount(nickname);
		
		request.setAttribute("count", count);
		request.setAttribute("lectureList", list);
		request.setAttribute("loginMember", m);
		System.out.println(list);
		request.getRequestDispatcher("/views/member/myClassIngTutor.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
