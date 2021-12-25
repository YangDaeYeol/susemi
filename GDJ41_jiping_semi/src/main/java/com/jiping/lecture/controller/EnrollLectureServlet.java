package com.jiping.lecture.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringJoiner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.jiping.common.FileRename;
import com.jiping.lecture.model.sevice.LectureService;
import com.jiping.lecture.model.vo.Lecture;
import com.jiping.lecture.model.vo.LectureImg;
import com.jiping.member.model.vo.Member;
import com.jiping.tutor.model.vo.Certificate;
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
					
					String[] certificateText = new String[5];
					int TextNum = 1;
					;
					for (int i = 0; i < certificateText.length; i++) {
						if ((mr.getParameter("text-career" + TextNum))!=null) {
							//text-career가 null이 아닐 경우에만 배열에 값 넣기
							certificateText[i] = mr.getParameter("text-career" + TextNum);
							TextNum++;
						}
						
					}
//					String 배열에서 String 으로 변경
					StringBuilder builder1 = new StringBuilder();
					for(String s : certificateText) {
					    builder1.append(s + ",");
					}
					String certificateTxt = builder1.toString();
				      
				      
				      
					String[] certificateImage = new String[5];
					int FileNum = 1;
					for (int i = 0; i < certificateImage.length; i++) {
						if ((mr.getFilesystemName("file-career" + FileNum))!=null) {
							//text-career가 null이 아닐 경우에만 배열에 값 넣기
							certificateImage[i] = mr.getFilesystemName("file-career" + FileNum);
							FileNum++;
						}
					}
//					String 배열에서 String 으로 변경
					StringBuilder builder2 = new StringBuilder();
					for(String s : certificateImage) {
					    builder2.append(s + ",");
					}
					String certificateImg = builder2.toString();

					
					Certificate c = null;
					for (int i = 0; i < certificateImage.length; i++) {
						c = Certificate.builder()
								.certificateText(certificateTxt)
								.certificateImg(certificateImg)
								.build();
					}
					
					lecture.put("certificate", c);
					
					String oneday = mr.getParameter("onedayClassType");
					String multipleClass = mr.getParameter("multipleClassType");
					String vod = mr.getParameter("VodClassType");
					
					if (oneday != null && oneday.equals("1")) {
						oneday = "원데이";
					} else if (multipleClass != null && multipleClass.equals("2")) {
						multipleClass = "다회차";
					} else {
						vod = "VOD";
					}
					String typeTemp = oneday + multipleClass + vod;
					String finalType = typeTemp.replaceAll("null", "");
				

					String category = mr.getParameter("smallCategory");
					String lectureTitle = mr.getParameter("lectureTitle");

					Lecture l = Lecture.builder()
							.lectureType(finalType)
							.lectureCategory(category)
							.lectureTitle(lectureTitle)
							.build();
					
					lecture.put("lecture", l);
					
					List<String> lectureImg = new ArrayList<>();
					List<String> arr = new ArrayList<>();
					Enumeration fileNames = mr.getFileNames();
					while (fileNames.hasMoreElements()) {
					 	String name =  (String)fileNames.nextElement();
					 	String filename = mr.getFilesystemName(name);
					 	
					 	lectureImg.add(name);
					 	arr.add(filename);
					 	
					}
					for (int i = 0; i < 3; i++) {
						lectureImg.add(mr.getFilesystemName("classImageFiles"));
					}
//					for (String s : lectureImg) {
//						lectureImg.add(mr.getFilesystemName("classImageFiles"));
//					}
					
					
					
					
					
					
					
					int result = new LectureService().enrollLecture(lecture);
					
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
