package com.jiping.lecture.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jiping.lecture.model.sevice.LectureService;
import com.jiping.lecture.model.vo.Lecture;
import com.jiping.lecture.model.vo.LectureContent;
import com.jiping.lecture.model.vo.LectureSchedule;

/**
 * Servlet implementation class LectureServlet
 */
@WebServlet("/lecture/lecture.do")
public class LectureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectureServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int lectureNo= Integer.parseInt(request.getParameter("lectureNo"));
		
		Lecture le= new LectureService().lectureInfo(lectureNo);
		LectureContent content= new LectureService().lectureContent(lectureNo);
//		LectureSchedule schedule= new LectureService().lectureSchedule(lectureNo);
		List<LectureSchedule> scList= new LectureService().scheduleList();
		
		request.setAttribute("le", le);
		request.setAttribute("content", content);
//		request.setAttribute("schedule", schedule);
		request.setAttribute("scList", scList);
		request.getRequestDispatcher("/views/lecture/lectureView.jsp").forward(request, response);

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
