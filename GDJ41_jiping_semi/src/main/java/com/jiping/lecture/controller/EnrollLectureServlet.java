package com.jiping.lecture.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jiping.common.FileRename;
import com.jiping.lecture.model.sevice.LectureService;
import com.jiping.lecture.model.vo.Lecture;
import com.jiping.lecture.model.vo.LectureContent;
import com.jiping.lecture.model.vo.LectureImg;
import com.jiping.lecture.model.vo.LectureSchedule;
import com.jiping.lecture.model.vo.VodLecture;
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
					    builder1.append(s + ",");
					}
					String certificateTxt = builder1.toString();
					
					//null있을경우 삭제
					if (certificateTxt.contains("null")) {
						certificateTxt.replaceAll("null", "");
					}
					
					//맨 마지막의 , 삭제
					certificateTxt = certificateTxt.substring(0, certificateTxt.length()-1);
				      
				      
				      
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
					
					//null있을경우 삭제
					if (certificateImg.contains("null")) {
						certificateImg.replaceAll("null", "");
					}
					
					//맨 마지막의 , 삭제
					certificateImg = certificateImg.substring(0, certificateImg.length()-1);
				     

					
					Certificate c = null;
					for (int i = 0; i < certificateImage.length; i++) {
						c = Certificate.builder()
								.certificateText(certificateTxt)
								.certificateImg(certificateImg)
								.build();
					}
					
					lecture.put("certificate", c);
					String classType = mr.getParameter("classType");
					
					String oneday = null;
					String multipleClass = null;
					String vod = null;
					
					if (classType.equals("1")) {
						oneday = "원데이";
					} else if (classType.equals("2")) {
						multipleClass = "다회차";
					} else {
						vod = "VOD";
					}
//					String oneday = mr.getParameter("onedayClassType");
//					String multipleClass = mr.getParameter("multipleClassType");
//					String vod = mr.getParameter("VodClassType");
//					
//					if (oneday != null && oneday.equals("1")) {
//						oneday = "원데이";
//					} else if (multipleClass != null && multipleClass.equals("2")) {
//						multipleClass = "다회차";
//					} else {
//						vod = "VOD";
//					}
					String typeTemp = oneday + multipleClass + vod;
					String type = typeTemp.replaceAll("null", "");
				
					String bigCategory = mr.getParameter("bigCategory");
					String smallCategory = mr.getParameter("smallCategory");
					String lectureTitle = mr.getParameter("lectureTitle");

					String category = bigCategory +" "+ smallCategory;
					
					Lecture l = Lecture.builder()
							.lectureType(type)
							.lectureCategory(category)
							.lectureTitle(lectureTitle)
							.build();
					
					lecture.put("lecture", l);
					
					Enumeration<String> e=mr.getFileNames();//업로드된 파일들에 대한 파일명을 모두 가져옴
//					
//					List<String> classImgFiles = new ArrayList<>();
					String classImgFiles = "";
					while(e.hasMoreElements()) {
						String fileName = e.nextElement(); 
						if(fileName.startsWith("upfile")) {
							classImgFiles += (mr.getFilesystemName(fileName)) + ",";
						}
					}
					
					//맨 마지막의 , 삭제
					classImgFiles = classImgFiles.substring(0, classImgFiles.length()-1);
				     
					
					LectureImg lImg = LectureImg.builder()
							.lectureFileName(classImgFiles)
							.build();
					
					lecture.put("lectureImg", lImg);
					
					//4페이지------------------------------------------------------
					String lectureIntroduceValue = mr.getParameter("lectureIntroduce");
					String recommendValue = mr.getParameter("recommend");
					String curriculumValue = mr.getParameter("curriculum");
					String lectureNoticeValue = mr.getParameter("lectureNotice");
					
					LectureContent lc = LectureContent.builder()
							.lectureIntroduce(lectureIntroduceValue)
							.recommend(recommendValue)
							.curriculum(curriculumValue)
							.lectureNotice(lectureNoticeValue)
							.build();
					
					lecture.put("lectureContent", lc);
					
					//5페이지---------------------------------------
					String[] classDateTemp = new String[10];
					String[] classStartTime = new String[10];
					String[] classEndTime = new String[10];
					int classPrice = 0;
					
					Date[] classDate = new Date[10];
					
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

						if (oneday != null) {
							//원데이 선택했을경우에 들어오는 곳이다
						
						for (int i = 0; i < 10; i++) {
							classDateTemp[i] = mr.getParameter("classDate" + i);
							classStartTime[i] = mr.getParameter("startTime" + i);
							classEndTime[i] = mr.getParameter("endTime" + i);
							}
						for (int i = 0; i < 10; i++) {
							if (classDateTemp[i]!=null) {
								classDate[i] = Date.valueOf(classDateTemp[i]);
							}
							
						}

						lecture.put("classDate", classDate);
						
						classPrice = Integer.parseInt(mr.getParameter("onedayClassPrice"));
//						
////						String배열을 String으로 처리
//						for (int i = 0; i < 10; i++) {
//							onedayClassDate += onedayClassDateTemp[i] + ",";
//							onedayClassStartTime += onedayClassStartTimeTemp[i] + ",";
//							onedayClassEndTime += onedayClassEndTimeTemp[i] + ",";
//						}
//						
//
////						null값이 있을경우에 null없애기
//						if (onedayClassDate.contains("null")) {
//							onedayClassDate.replaceAll("null", "");
//							onedayClassStartTime.replaceAll("null", "");
//						}
						
						
////						마지막 문자열의 , 제거
//						onedayClassDate = onedayClassDate.substring(0, onedayClassDate.length()-1);
//						onedayClassStartTime = onedayClassStartTime.substring(0, onedayClassStartTime.length()-1);
//						onedayClassEndTime = onedayClassEndTime.substring(0, onedayClassEndTime.length()-1);
//						
						String temp1 = mr.getParameter("sido1");
						String temp2 = mr.getParameter("gugun1");
						String location = temp1 + " " + temp2;
						String address = mr.getParameter("address1");
						
						int numOfStu = Integer.parseInt(mr.getParameter("peopleNum2"));
						
						LectureSchedule ls = LectureSchedule.builder()
								.lecturePrice(classPrice)
								.lecturePersons(numOfStu)
								.lectureLocation(location)
								.lectureAddress(address)
								.build();
						
						lecture.put("LectureSchedule", ls);
						lecture.put("classStartTime", classStartTime);
						lecture.put("classEndTime", classEndTime);
						
						
					} else if (multipleClass != null) {
						
						//다회차일경우에 들어오는곳이다
						for (int i = 0; i < 10; i++) {
							classDateTemp[i] = mr.getParameter("classDateTwo" + i);
							classStartTime[i] = mr.getParameter("startTimeTwo" + i);
							classEndTime[i] = mr.getParameter("endTimeTwo" + i);
							}
						for (int i = 0; i < 10; i++) {
							
							if (classDateTemp[i] != null) {
								classDate[i] = Date.valueOf(classDateTemp[i]);
							}
							
						}
						
						lecture.put("classDate", classDate);
						
						classPrice = Integer.parseInt(mr.getParameter("multipleDayClassPrice"));
						
						String temp1 = mr.getParameter("sido2");
						String temp2 = mr.getParameter("gugun2");
						String location = temp1 + " " + temp2;
						String address = mr.getParameter("address2");
						
						int numOfStu = Integer.parseInt(mr.getParameter("peopleNum1"));
						
						LectureSchedule ls = LectureSchedule.builder()
								.lecturePrice(classPrice)
								.lecturePersons(numOfStu)
								.lectureLocation(location)
								.lectureAddress(address)
								.build();
						
						lecture.put("LectureSchedule", ls);
						lecture.put("classStartTime", classStartTime);
						lecture.put("classEndTime", classEndTime);
						
					} else {
						//VOD 선택했을떄 들어오는 곳
						String[] vodUrlAddrTemp0 = new String[10];
						String[] vodTitleTemp = new String[10];
						String[] vodClassinfoTemp = new String[10];
						
						String[] vodUrlAddrTemp = new String[10];
						for (int i = 0; i < 10; i++) {
							vodUrlAddrTemp0[i] = mr.getParameter("VODurlAddress" + i);
							vodTitleTemp[i] = mr.getParameter("VODTitlePerClass" + i);
							vodClassinfoTemp[i] = mr.getParameter("vodEachClassInformation" + i);
				
						}
						//유튜브 주소 = 뒤만 가져오기
						for (int i = 0; i < 10; i++) {
							if (vodUrlAddrTemp0[i] != null) {
								int index = vodUrlAddrTemp0[i].indexOf("=");
								vodUrlAddrTemp[i] = vodUrlAddrTemp0[i].substring(index + 1);
							}
							
						}
						
						int vodClassPrice = Integer.parseInt(mr.getParameter("vodTotalClassPrice"));
						
						lecture.put("vodUrlAddr", vodUrlAddrTemp);
						lecture.put("vodTitle", vodTitleTemp);
						lecture.put("vodClassinfo", vodClassinfoTemp);
						
						VodLecture vl = VodLecture.builder()
								.vodPrice(vodClassPrice)
								.build();
						
						lecture.put("vodLecture", vl);
						
						
					}
					
					
					
					
					
					int result = new LectureService().enrollLecture(lecture);
					
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			doGet(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}