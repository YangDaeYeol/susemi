package com.jiping.lecture.model.sevice;

import static com.jiping.common.JDBCTemplate.close;
import static com.jiping.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.jiping.lecture.model.dao.LectureDao;
import com.jiping.lecture.model.vo.Lecture;
import com.jiping.lecture.model.vo.LectureContent;
import com.jiping.lecture.model.vo.LectureSchedule;

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
	
	public List<LectureSchedule> scheduleSelectList(int scheduleNo){
		Connection conn=getConnection();
		List<LectureSchedule> list=dao.scheduleSelectList(conn, scheduleNo);
		close(conn);
		return list;
	}

}
