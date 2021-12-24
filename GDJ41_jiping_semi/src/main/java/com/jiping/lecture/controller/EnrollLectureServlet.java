package com.jiping.lecture.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.jiping.common.FileRename;
import com.jiping.lecture.model.sevice.LectureService;
import com.jiping.member.model.vo.Member;
import com.jiping.tutor.model.vo.Tutor;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class EnrollLectureServlet
 */
@WebServlet("/lecture/enrolllecture.do")
public class EnrollLectureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollLectureServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				
//					튜터 이미지받아서 처리하는부분 시작
					String path = request.getServletContext().getRealPath("/upload/tutor/");
					int maxSize = 1024 * 1024 * 10;
					String encode = "UTF-8";
					MultipartRequest mr = new MultipartRequest(request, path, maxSize, encode, new FileRename());
					
					Map<String, Object> lecture = new HashMap<>();
					Member m = Member.builder()
							.profileImg(mr.getFilesystemName("tutorImgFile"))
							.build();
					
					lecture.put("member",m);
					
					int result = new LectureService().enrollLecture(lecture);
	
					String tutorComment = mr.getParameter("tutorComment");
					String tutorInsta = mr.getParameter("instaAddr");
					String tutorFacebook = mr.getParameter("facebookAddr");
					String tutorBlog = mr.getParameter("blogAddr");
					
					Tutor t = Tutor.builder()
							.insta(tutorInsta)
							.facebook(tutorFacebook)
							.blog(tutorBlog)
							.tutorMsg(tutorComment)
							.build();
					
					lecture.put("tutor",t);
					
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
