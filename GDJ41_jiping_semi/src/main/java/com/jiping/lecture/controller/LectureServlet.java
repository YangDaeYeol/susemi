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
import com.jiping.lecture.model.vo.LectureImg;
import com.jiping.lecture.model.vo.LectureSchedule;
import com.jiping.lecture.model.vo.VodLecture;
import com.jiping.member.model.vo.Member;
import com.jiping.payment.model.vo.Payment;
import com.jiping.tutor.model.vo.Certificate;
import com.jiping.tutor.model.vo.Tutor;

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
		String lectureType=request.getParameter("lectureType");
		
		
		Lecture le= new LectureService().lectureInfo(lectureNo);
		LectureContent content= new LectureService().lectureContent(lectureNo);
		
//		LectureSchedule schedule= new LectureService().lectureSchedule(lectureNo);
		List<LectureSchedule> scList= new LectureService().scheduleList(lectureNo);
		List<LectureImg> imgList= new LectureService().imgList(lectureNo);
		Tutor tutor= new LectureService().totorInfo(lectureNo);
		Member m= new LectureService().tutorImg(lectureNo);
		List<Certificate> c= new LectureService().certificate(lectureNo);
		
		
//		vod
		List<VodLecture> vodList= new LectureService().vodList(lectureNo);
		List<Payment> p= new LectureService().payment(lectureNo);
		
		
		
		request.setAttribute("le", le);
		request.setAttribute("content", content);
//		request.setAttribute("schedule", schedule);
		request.setAttribute("scList", scList);
		request.setAttribute("imgList", imgList);
		request.setAttribute("tutor", tutor);
		request.setAttribute("vodList", vodList);
		request.setAttribute("m", m);
		request.setAttribute("c", c);
		request.setAttribute("p", p);
		
		
		if(lectureType.contains("원데이")) {
			request.getRequestDispatcher("/views/lecture/lectureView.jsp").forward(request, response);			
		} else if(lectureType.contains("VOD")) {
			request.getRequestDispatcher("/views/lecture/vodLectureView.jsp").forward(request, response);
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
