package com.jiping.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jiping.lecture.model.sevice.LectureService;
import com.jiping.lecture.model.vo.Lecture;

/**
 * Servlet implementation class AdminGoToLecture
 */
@WebServlet(name="adminGoToLecture", urlPatterns={"/admin/adminGoToLecture"})
public class AdminGoToLecture extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminGoToLecture() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int lectureNo = Integer.parseInt(request.getParameter("lectureNo"));
		System.out.println(lectureNo);
		Lecture lecture= new LectureService().lectureInfo(lectureNo);
		
		request.getRequestDispatcher("/lecture/lecture.do?lectureNo="+lectureNo).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
