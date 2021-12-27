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
	
	public List<LectureSchedule> scheduleList(){
		Connection conn=getConnection();
		List<LectureSchedule> list=dao.scheduleList(conn);
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
	
	public List<Payment> payment(int lectureNo){
		Connection conn=getConnection();
		List<Payment> p= dao.payment(conn, lectureNo);
		close(conn);
		return p;
	}
	
	public int insertComment(LectureComment lc) {
		Connection conn=getConnection();
		int result= dao.insertComment(conn,lc);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	
//	-----------------------------------------------------------
	
	public int enrollLecture(Map lecture) {
		Connection conn = getConnection();
		Member m = (Member)lecture.get("member");
		int result = dao.enrollTutorImage(conn, m);
		if (result > 0) {
			commit(conn);
			Tutor t = (Tutor)lecture.get("tutor");
			int result2 = dao.enrollTutorInformation(conn, t);
			if (result2 > 0) {
				commit(conn);
				Certificate c = (Certificate)lecture.get("certificate");
				int result3 = dao.enrollCertificateInformation(conn, c);
				if (result3 > 0) {
					commit(conn);
					Lecture l = (Lecture)lecture.get("lecture");
					int result4 = dao.enrollLectureInoformation(conn, l);
					if (result4 > 0) {
						commit(conn);
						LectureImg lImg = (LectureImg)lecture.get("lectureImg");
						int result5 = 0;
						String[] fileNameArray = lImg.getLectureFileName().split(",");
						for (int i = 0; i < fileNameArray.length; i++) {
							result5 = dao.enrollLectureImg(conn, lImg, fileNameArray[i]);
						}
						if (result5 > 0) {
							commit(conn);
							LectureContent lc = (LectureContent)lecture.get("lectureContent");
							int result6 = dao.enrollLectureContent(conn, lc);
							if (result6 > 0) {
								commit(conn);
								String[] classStartTime = (String[])lecture.get("classStartTime");
								String[] classEndTime = (String[])lecture.get("classEndTime");
								Date[] classDate = (Date[])lecture.get("classDate");
								LectureSchedule ls = (LectureSchedule)lecture.get("LectureSchedule");
								int result7 = 0;
								if (classStartTime[0] != null) { //원데이 / 다회차를 선택했을경우에 이쪽에서 처리한다
									for (int i = 0; i < 10; i++) {
										if (classStartTime[i] != null) {
											result7 = dao.enrollLectureSchedule(conn, ls, classDate[i], classStartTime[i], classEndTime[i]);
											}
										}
										if (result7 > 0) {
											commit(conn);
									} else {
										rollback(conn);
									}
									
								} else { //VOD 를 선택했을떄 들어오는곳이다
									
									
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

	public List<Lecture> apprLectureList() {
		Connection conn=getConnection();
		List<Lecture> apprLectureList= dao.apprLectureList(conn);
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
	
	
	

}
