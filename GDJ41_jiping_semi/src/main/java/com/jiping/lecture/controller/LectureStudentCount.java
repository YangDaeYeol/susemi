package com.jiping.lecture.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.jiping.lecture.model.sevice.LectureService;

/**
 * Servlet implementation class LectureStudentCount
 */
@WebServlet("/checkStudentCount")
public class LectureStudentCount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectureStudentCount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int scheduleNo = Integer.parseInt(request.getParameter("scheduleNo"));
		System.out.println(scheduleNo);
		int result = new LectureService().checkStudentCount(scheduleNo);
		JSONObject jo = new JSONObject();
		System.out.println(result);
		jo.put("count", result);
		response.getWriter().print(jo);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
