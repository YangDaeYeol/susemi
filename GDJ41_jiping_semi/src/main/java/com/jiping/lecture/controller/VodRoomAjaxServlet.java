package com.jiping.lecture.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.jiping.lecture.model.sevice.LectureService;
import com.jiping.lecture.model.vo.VodLecture;

/**
 * Servlet implementation class VodRoomAjaxServlet
 */
@WebServlet("/VodRoomAjaxServlet.do")
public class VodRoomAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VodRoomAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String vodTitle=request.getParameter("vodTitle");
		int lectureNo=Integer.parseInt(request.getParameter("lectureNo"));
		VodLecture v= new LectureService().selectTitleVod(vodTitle, lectureNo);
		new Gson().toJson(v,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
