package com.jiping.lecture.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringJoiner;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

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
@MultipartConfig(
		fileSizeThreshold=1024*1024*10, 	// 10 MB 
		maxFileSize=1024*1024*50,      	// 50 MB
		maxRequestSize=1024*1024*100
		)  
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
					//String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;
					int maxSize = 1024 * 1024 * 10;
					String encode = "UTF-8";
					
//					Collection<Part> parts = request.getParts();
//					Collection<Part> filesParts = new ArrayList<>();
//					ArrayList<String> partfileNames = new ArrayList<>();
//					String fileName;
//					
//					for(Part part : parts) {
//						if(null == part.getContentType()){
//							
//						}
//					}
//					
//					for (Part part : request.getParts()) {
//			            fileName = getFileName(part);
//			            partfileNames.add(part.getSubmittedFileName());			            
//			            //			            part.write(uploadFilePath + File.separator + fileName);
//			        }
					
					
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
					    builder1.append(s + "_");
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
					
					Enumeration<String> e=mr.getFileNames();//업로드된 파일들에 대한 파일명을 모두 가져옴
					
					List<String> classImgfiles=new ArrayList<>();
					
					String classFinalImgFiles = "";
					while(e.hasMoreElements()) {
						String fileName = e.nextElement(); 
						if(fileName.startsWith("upfile")) {
							classFinalImgFiles += ((mr.getFilesystemName(fileName))+",");
						}
					}
					
					LectureImg lImg = LectureImg.builder()
							.lectureFilename(classFinalImgFiles)
							.build();
					
					lecture.put("lectureImg", lImg);
					
					String lectureIntroduce = mr.getParameter("lectureIntroduce");
					String recommend = mr.getParameter("recommend");
					String curriculum = mr.getParameter("curriculum");
					String lectureNotice = mr.getParameter("lectureNotice");
					
					
					
					
					
					
					
					
					
					
					
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
