package com.jiping.lecture.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.jiping.lecture.model.sevice.LectureService;
import com.jiping.lecture.model.vo.LectureSchedule;

/**
 * Servlet implementation class LectureScheduleServlet
 */
@WebServlet("/lecture/scheduleInfo.do")
public class LectureScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectureScheduleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int scheduleNo=Integer.parseInt(request.getParameter("scheduleNo"));
		System.out.println("scheduleNo :"+scheduleNo);
		List<LectureSchedule> scList= new LectureService().scheduleSelectList(scheduleNo);
		
		JSONObject jo= new JSONObject();
		jo.put("scList", scList); //이걸 넣어주니까 밑에 투스트링이 생김
		System.out.println("tostring: "+jo.toString());
		System.out.println("scList: "+scList);
		
		request.setAttribute("scList", scList);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
