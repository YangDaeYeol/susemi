package com.jiping.lecture.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.jiping.common.FileRename;
import static com.jiping.common.StringCustomUtils.getStringOrNull;
import static com.jiping.common.StringCustomUtils.getIntOrNull;
import static com.jiping.common.JDBCTemplate.close;
import static com.jiping.common.JDBCTemplate.commit;
import static com.jiping.common.JDBCTemplate.getConnection;
import static com.jiping.common.JDBCTemplate.rollback;
import com.jiping.lecture.model.sevice.LectureService;
import com.jiping.lecture.model.vo.Lecture;
import com.jiping.lecture.model.vo.LectureContent;
import com.jiping.lecture.model.vo.LectureImg;
import com.jiping.lecture.model.vo.LectureSchedule;
import com.jiping.lecture.model.vo.VodLecture;
import com.jiping.member.model.dao.MemberDao;
import com.jiping.member.model.vo.Member;
import com.jiping.tutor.model.vo.Certificate;
import com.jiping.tutor.model.vo.Tutor;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class EnrollLectureServlet
 */
@WebServlet("/lecture/enrolllecture.do")
//@MultipartConfig(
//		fileSizeThreshold=1024*1024*10, 	// 10 MB 
//		maxFileSize=1024*1024*50,      	// 50 MB
//		maxRequestSize=1024*1024*100
//		)  
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

//					?????? ?????????????????? ?????????????????? ??????
		String path = request.getServletContext().getRealPath("/upload/");
		// String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;
		int maxSize = 1024 * 1024 * 100;
		String encode = "UTF-8";
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginMember");

		Connection conn = getConnection();
		Member memberPhone = new MemberDao().findPhoneNumber(conn, member);
		close(conn);

		MultipartRequest mr = new MultipartRequest(request, path, maxSize, encode, new FileRename());

		Map<String, Object> lecture = new HashMap<>();

		Member m = Member.builder().email(member.getEmail()).phone(memberPhone.getPhone())
				.nickname(member.getNickname()).profileImg(mr.getFilesystemName("tutorImgFile")).build();

		lecture.put("member", m);

		String tutorComment = mr.getParameter("tutorComment");
		String tutorInsta = mr.getParameter("instaAddr");
		String tutorFacebook = mr.getParameter("facebookAddr");
		String tutorBlog = mr.getParameter("blogAddr");

		Tutor t = Tutor.builder().insta(tutorInsta).facebook(tutorFacebook).blog(tutorBlog).tutorMsg(tutorComment)
				.build();

		lecture.put("tutor", t);
		
		List<String> certificateText = new ArrayList<>();
		List<String> certificateImage = new ArrayList<>();
		
		int TextNum = 1;
		for (int i = 0; i < 5; i++) {
			if ((mr.getParameter("text-career" + TextNum)) != null) {
				// text-career??? null??? ?????? ???????????? ????????? ??? ??????
				certificateText.add(mr.getParameter("text-career" + TextNum));
				TextNum++;
			}
		}
		
		int FileNum = 1;
		for (int i = 0; i < 5; i++) {
			if ((mr.getFilesystemName("file-career" + FileNum)) != null) {
				// text-career??? null??? ?????? ???????????? ????????? ??? ??????
				certificateImage.add(mr.getFilesystemName("file-career" + FileNum));
				FileNum++;
			}
		}
		
		lecture.put("certificateText", certificateText);
		lecture.put("certificateImage", certificateImage);
		

		String classType = mr.getParameter("classType");

		String oneday = null;
		String multipleClass = null;
		String vod = null;

		if (classType.equals("1")) {
			oneday = "?????????";
		} else if (classType.equals("2")) {
			multipleClass = "?????????";
		} else {
			vod = "VOD";
		}
//					
		String typeTemp = oneday + multipleClass + vod;
		String type = typeTemp.replaceAll("null", "");

		String bigCategory = mr.getParameter("bigCategory");
		String smallCategory = mr.getParameter("smallCategory");
		String lectureTitle = mr.getParameter("lectureTitle");

		String category = bigCategory + " " + smallCategory;

		int priceTemp = 0;

		if (!(mr.getParameter("onedayClassPrice").equals("")) && mr.getParameter("onedayClassPrice") != null) {
			priceTemp = Integer.parseInt(mr.getParameter("onedayClassPrice"));
		} else if (!(mr.getParameter("multipleDayClassPrice").equals(""))
				&& mr.getParameter("multipleDayClassPrice") != null) {
			priceTemp = Integer.parseInt(mr.getParameter("multipleDayClassPrice"));
		} else {
			priceTemp = Integer.parseInt(mr.getParameter("vodTotalClassPrice"));
		}

		Enumeration<String> e = mr.getFileNames();// ???????????? ???????????? ?????? ???????????? ?????? ?????????

		String classImgFile = "";
		while (e.hasMoreElements()) {
			String fileName = e.nextElement();
			for (int i = 0; i < 1; i++) {
				if (fileName.startsWith("upfile")) {
					classImgFile += (mr.getFilesystemName(fileName));
				}
			}
		}

		Lecture l = Lecture.builder().lectureType(type).lectureCategory(category).lectureTitle(lectureTitle)
				.price(priceTemp).thumbNail(classImgFile).tutorImg(mr.getFilesystemName("tutorImgFile"))

				.build();

		lecture.put("lecture", l);

		Enumeration<String> e1 = mr.getFileNames();// ???????????? ???????????? ?????? ???????????? ?????? ?????????

		String classImgFiles = "";
		while (e1.hasMoreElements()) {
			String fileName = e1.nextElement();
			if (fileName.startsWith("upfile")) {
				classImgFiles += (mr.getFilesystemName(fileName)) + ",";
			}
		}

		// ??? ???????????? , ??????
		classImgFiles = classImgFiles.substring(0, classImgFiles.length() - 1);

		LectureImg lImg = LectureImg.builder().lectureFileName(classImgFiles).build();

		lecture.put("lectureImg", lImg);

		// 4?????????------------------------------------------------------
		String lectureIntroduceValue = mr.getParameter("lectureIntroduce");
		String recommendValue = mr.getParameter("recommend");
		String curriculumValue = mr.getParameter("curriculum");
		String lectureNoticeValue = mr.getParameter("lectureNotice");

		LectureContent lc = LectureContent.builder().lectureIntroduce(lectureIntroduceValue).recommend(recommendValue)
				.curriculum(curriculumValue).lectureNotice(lectureNoticeValue).build();

		lecture.put("lectureContent", lc);

		// 5?????????---------------------------------------
		String[] classDateTemp = new String[10];
		String[] classStartTime = new String[10];
		String[] classEndTime = new String[10];
		int classPrice = 0;

		Date[] classDate = new Date[10];

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		if (oneday != null) {
			// ????????? ????????????????????? ???????????? ?????????

			for (int i = 0; i < classEndTime.length; i++) {
				classDateTemp[i] = getStringOrNull(mr.getParameter("classDate" + i));
				classStartTime[i] = getStringOrNull(mr.getParameter("startTime" + i));
				classEndTime[i] = getStringOrNull(mr.getParameter("endTime" + i));
			}
			for (int i = 0; i < classStartTime.length; i++) {
				if (classDateTemp[i] != null) {
					classDate[i] = Date.valueOf(classDateTemp[i]);
				}

			}

			lecture.put("classDate", classDate);

			classPrice = getIntOrNull((mr.getParameter("onedayClassPrice")));

			String temp1 = mr.getParameter("sido1");
			String temp2 = mr.getParameter("gugun1");
			String location = temp1 + " " + temp2;
			String address = mr.getParameter("address1");

			int numOfStu = Integer.parseInt(mr.getParameter("peopleNum2"));

			LectureSchedule ls = LectureSchedule.builder().lecturePrice(classPrice).lecturePersons(numOfStu)
					.lectureLocation(location).lectureAddress(address).build();

			lecture.put("LectureSchedule", ls);
			lecture.put("classStartTime", classStartTime);
			lecture.put("classEndTime", classEndTime);

		} else if (multipleClass != null) {

			// ????????????????????? ?????????????????????
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

			LectureSchedule ls = LectureSchedule.builder().lecturePrice(classPrice).lecturePersons(numOfStu)
					.lectureLocation(location).lectureAddress(address).build();

			lecture.put("LectureSchedule", ls);
			lecture.put("classStartTime", classStartTime);
			lecture.put("classEndTime", classEndTime);

		} else {
			// VOD ??????????????? ???????????? ???
			String[] vodUrlAddrTemp0 = new String[10];
			String[] vodTitleTemp = new String[10];
			String[] vodClassinfoTemp = new String[10];

			String[] vodUrlAddrTemp = new String[10];
			for (int i = 0; i < 10; i++) {
				vodUrlAddrTemp0[i] = mr.getParameter("VODurlAddress" + i);
				vodTitleTemp[i] = mr.getParameter("VODTitlePerClass" + i);
				vodClassinfoTemp[i] = mr.getParameter("vodEachClassInformation" + i);

			}
			// ????????? ?????? = ?????? ????????????
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

			VodLecture vl = VodLecture.builder().vodPrice(vodClassPrice).build();

			lecture.put("vodLecture", vl);

		}

		int result = new LectureService().enrollLecture(lecture);
		response.setContentType("application.json;");
		new Gson().toJson(result, response.getWriter());
		// request.getRequestDispatcher("index.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
