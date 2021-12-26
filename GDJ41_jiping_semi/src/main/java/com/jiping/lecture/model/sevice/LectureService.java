package com.jiping.lecture.model.sevice;

import static com.jiping.common.JDBCTemplate.close;
import static com.jiping.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.jiping.lecture.model.dao.LectureDao;
import com.jiping.lecture.model.vo.Lecture;
import com.jiping.lecture.model.vo.LectureContent;
import com.jiping.lecture.model.vo.LectureImg;
import com.jiping.lecture.model.vo.LectureSchedule;
import com.jiping.lecture.model.vo.VodLecture;
import com.jiping.member.model.vo.Tutor;

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

}
