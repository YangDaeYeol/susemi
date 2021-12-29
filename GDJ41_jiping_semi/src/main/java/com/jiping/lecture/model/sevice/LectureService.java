package com.jiping.lecture.model.sevice;

import static com.jiping.common.JDBCTemplate.close;
import static com.jiping.common.JDBCTemplate.commit;
import static com.jiping.common.JDBCTemplate.getConnection;
import static com.jiping.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.jiping.lecture.model.dao.LectureDao;
import com.jiping.lecture.model.vo.Lecture;
import com.jiping.lecture.model.vo.LectureComment;
import com.jiping.lecture.model.vo.LectureContent;
import com.jiping.lecture.model.vo.LectureImg;
import com.jiping.lecture.model.vo.LectureSchedule;
import com.jiping.lecture.model.vo.VodLecture;
import com.jiping.member.model.vo.Member;
import com.jiping.payment.model.vo.Payment;
import com.jiping.tutor.model.vo.Certificate;
import com.jiping.tutor.model.vo.Tutor;

public class LectureService {
	
	private LectureDao dao= new LectureDao();
	
	public Lecture lectureInfo(int lectureNo) {
		Connection conn=getConnection();
		Lecture le= dao.lectureInfo(conn, lectureNo);
		close(conn);
		return le;
	}
	
	public LectureContent lectureContent(int lectureNo) {
		Connection conn=getConnection();
		LectureContent content= dao.lectureContent(conn, lectureNo);
		close(conn);
		return content;
	}
	
//	public LectureSchedule lectureSchedule(int lectureNo) {
//		Connection conn=getConnection();
//		LectureSchedule schedule= dao.lectureSchedule(conn, lectureNo);
//		close(conn);
//		return schedule;
//	}
	
	public List<LectureSchedule> scheduleList(int lectureNo){
		Connection conn=getConnection();
		List<LectureSchedule> list=dao.scheduleList(conn, lectureNo);
		close(conn);
		return list;
	}
	
	public LectureSchedule scheduleSelectList(int scheduleNo){
		Connection conn=getConnection();
		LectureSchedule sc=dao.scheduleSelectList(conn, scheduleNo);
		close(conn);
		return sc;
	}
	
	public Tutor totorInfo(int lectureNo) {
		Connection conn=getConnection();
		Tutor tutor= dao.tutorInfo(conn, lectureNo);
		close(conn);
		return tutor;
	}
	
	public List<LectureImg> imgList(int lectureNo){
		Connection conn=getConnection();
		List<LectureImg> imgList= dao.imgList(conn, lectureNo);
		close(conn);
		return imgList;
	}
	
	public List<VodLecture> vodList(int lectureNo){
		Connection conn=getConnection();
		List<VodLecture> vodList= dao.vodList(conn, lectureNo);
		close(conn);
		return vodList;
	}
	
	public Member tutorImg(int lectureNo) {
		Connection conn=getConnection();
		Member m= dao.tutorImg(conn, lectureNo);
		close(conn);
		return m;
	}
	
	public List<Certificate> certificate(int lectureNo){
		Connection conn=getConnection();
		List<Certificate> c= dao.certificate(conn, lectureNo);
		close(conn);
		return c;
	}
	
	public VodLecture selectTitleVod(String vodTitle, int lectureNo) {
		Connection conn=getConnection();
		VodLecture v= dao.selectTitleVod(conn, vodTitle, lectureNo);
		close(conn);
		return v;
	}
	
	public Payment payment(int lectureNo, String email){
		Connection conn=getConnection();
		Payment p= dao.payment(conn, lectureNo, email);
		close(conn);
		return p;
	}
	

	public int insertComment(LectureComment lc) {
		Connection conn=getConnection();
		int result= dao.insertComment(conn,lc);
		if(result>0) {
			commit(conn);
			int result2 =dao.addCommentCount(conn, lc.getLectureNo());
		}
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public List<LectureComment> lcList(int lectureNo){
		Connection conn=getConnection();
		List<LectureComment> lc= dao.lcList(conn, lectureNo);
		close(conn);
		return lc;
	}
	
	public List<Payment> payList(int lectureNo){
		Connection conn=getConnection();
		List<Payment> p= dao.payList(conn, lectureNo);
		close(conn);
		return p;
	}
	

//	-----------------------------------------------------------
	
	/**
	 * @param lecture
	 * @return
	 */
	public int enrollLecture(Map lecture) {
		Connection conn = getConnection();
		Member m = (Member)lecture.get("member");
		int result = dao.enrollTutorImage(conn, m);
		if (result > 0) {
			Tutor t = (Tutor)lecture.get("tutor");
			int result2 = dao.enrollTutorInformation(conn, t, m);
			if (result2 > 0) {
				
				List<String> certificateText = (List<String>)lecture.get("certificateText");
				List<String> certificateImage = (List<String>)lecture.get("certificateImage");
				int result3 = 0;
				for (int i = 0; i < certificateText.size(); i++) {
					if (certificateText.get(i) == null || certificateText.get(i).equals("")) {
						i++;
					} else {
						result3 = dao.enrollCertificateInformation(conn, certificateText.get(i), certificateImage.get(i), m);
					}
					
				}
				
				if (result3 > 0) {
					Lecture l = (Lecture)lecture.get("lecture");
					int result4 = dao.enrollLectureInoformation(conn, l, m);
					int seqNum=dao.selectLectureSeq(conn);
					
					if (result4 > 0) {
						LectureImg lImg = (LectureImg)lecture.get("lectureImg");
						int result5 = 0;
						String[] fileNameArray = lImg.getLectureFileName().split(",");
						for (int i = 0; i < fileNameArray.length; i++) {
							result5 = dao.enrollLectureImg(conn, seqNum, fileNameArray[i]);
						}
						if (result5 > 0) {
							LectureContent lc = (LectureContent)lecture.get("lectureContent");
							int result6 = dao.enrollLectureContent(conn, lc, seqNum);
							if (result6 > 0) {
								String[] classStartTime = (String[])lecture.get("classStartTime");
								String[] classEndTime = (String[])lecture.get("classEndTime");
								Date[] classDate = (Date[])lecture.get("classDate");
								LectureSchedule ls = (LectureSchedule)lecture.get("LectureSchedule");
								int result7 = 0;
								if (classStartTime==null) {  //VOD 를 선택했을떄 들어오는곳이다
									String[] vodUrlAddr = (String[])lecture.get("vodUrlAddr");
									String[] vodTitle = (String[])lecture.get("vodTitle");
									String[] vodClassInfo = (String[])lecture.get("vodClassinfo");
									VodLecture vl = (VodLecture)lecture.get("vodLecture");
									vl.setLectureNo(seqNum);
									int result8 = 0;
									for (int i = 0 ; i < 10; i++) {
										if(vodUrlAddr[i] != null) {
											result8 = dao.enrollVodLecture(conn, m, vodUrlAddr[i], vodTitle[i], vodClassInfo[i], vl);
										}
									}
									if (result8 > 0) {
										commit(conn);
									} else {
										rollback(conn);
									}
									
								} else  { //원데이 / 다회차를 선택했을경우에 이쪽에서 처리한다
									ls.setLectureNo(seqNum);
									for (int i = 0; i < 10; i++) {
										if (classStartTime[i] != null) {
											result7 = dao.enrollLectureSchedule(conn, m, ls, classDate[i], classStartTime[i], classEndTime[i]);
											}
										}
									if (result7 > 0) {
										commit(conn);
									} else {
										rollback(conn);
									}
									
									
								}
								
								
								
							} else {
								rollback(conn);
							}
						} else {
							rollback(conn);
						}
					} else {
						rollback(conn);
					}
				} else {
					rollback(conn);
				}
			} else {
				rollback(conn);
			}
			
		} else {
			rollback(conn);	
		}
		close(conn);
		return result;
		
	}

	public List<Lecture> apprLectureList(int cPage, int numPerPage) {
		Connection conn=getConnection();
		List<Lecture> apprLectureList= dao.apprLectureList(conn,cPage,numPerPage);
		close(conn);
		return apprLectureList;
	}

	public int apprLecture(int lectureNo) {
		Connection conn=getConnection();
		int result=dao.apprLecture(conn, lectureNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public List<LectureComment> reportCommentList(int cPage, int numPerPage) {
		Connection conn=getConnection();
		List<LectureComment> reportCommentList= dao.reportCommentList(conn,cPage,numPerPage);
		close(conn);
		return reportCommentList;
	}

	public int selectReportCommetAllCount() {
		Connection conn=getConnection();
		int result = dao.selectReportCommetAllCount(conn);
		close(conn);
		return result;
	}

	
	public List<Lecture> onedayLectureList() {
		Connection conn = getConnection();
		List<Lecture> list = dao.onedayLectureList(conn);
		close(conn);
		return list;
	}
	
	public List<Lecture> everydayLectureList() {
		Connection conn = getConnection();
		List<Lecture> list = dao.everydayLectureList(conn);
		close(conn);
		return list;
	}
	
	public List<Lecture> vodLectureList() {
		Connection conn = getConnection();
		List<Lecture> list = dao.vodLectureList(conn);
		close(conn);
		return list;
	}
	
	public List<Lecture> searchResult(String keyword, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Lecture> list = dao.searchResult(conn,keyword,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public int searchResultCount(String keyword) {
		Connection conn = getConnection();
		int result = dao.searchResultCount(conn, keyword);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int commentDelete(int commentNo) {
		Connection conn = getConnection();
		int result= dao.commentDelete(conn, commentNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
//	------------------------------------------------------------
	public int deleteComment(int num) {
		Connection conn=getConnection();
		int result= dao.deleteComment(conn,num);
		if(result>0) { 
			commit(conn);
//			int result2 = dao.deleteCommentCount(conn);
		}
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public List<Certificate> selectCertificate(String nickName) {
		Connection conn = getConnection();
		List<Certificate> list = dao.selectCertificate(conn, nickName);
		close(conn);
		return list;
	}

	public int paymentInfoEnroll(Payment pay) {
		Connection conn=getConnection();
		int result= dao.paymentInfoEnroll(conn, pay);
		if(result>0) commit(conn);
		close(conn);
		return result;
	}

	public int checkStudentCount(int scheduleNo) {
		Connection conn = getConnection();
		int result = dao.checkStudentCount(conn, scheduleNo);
		close(conn);
		return result;
	}
	
	public int countPayMember(int num) {
		Connection conn=getConnection();
		int result= dao.countPayMember(conn,num);
		if(result>0) { 
			commit(conn);
		}
		else rollback(conn);
		close(conn);
		return result;
	}

	public List<Lecture> lectureAllList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Lecture> list = dao.lectureAllList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}

	public int selectLectureAllCount() {
		Connection conn=getConnection();
		int result = dao.selectLectureAllCount(conn);
		close(conn);
		return result;
	}

	public int dropLecture(int lectureNo) {
		Connection conn=getConnection();
		int result=dao.dropLecture(conn, lectureNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int selectApprLectureAllCount() {
		Connection conn=getConnection();
		int result = dao.selectApprLectureAllCount(conn);
		close(conn);
		return result;
	}
	
}
