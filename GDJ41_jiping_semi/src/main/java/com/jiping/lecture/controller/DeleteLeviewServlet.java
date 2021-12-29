package com.jiping.lecture.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jiping.lecture.model.sevice.LectureService;

/**
 * Servlet implementation class DeleteLeviewServlet
 */
@WebServlet("/deleteLeview")
public class DeleteLeviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteLeviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//삭제버튼
		int commentNo=Integer.parseInt(request.getParameter("commentNo"));
		int lectureNo=Integer.parseInt(request.getParameter("lectureNo"));
		
		System.out.println(commentNo);
		int deresult= new LectureService().deleteComment(commentNo);
		
		String msg="";
		String loc="/lecture/lecture.do?lectureNo="+lectureNo;
		
		if(deresult>0) {
			msg="리뷰삭제에 성공하였습니다.";
		} else {
			msg="리뷰삭제에 실패하였습니다. 관리자에 문의하세요!";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
