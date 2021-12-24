package com.jiping.lecture.model.sevice;

import static com.jiping.common.JDBCTemplate.close;
import static com.jiping.common.JDBCTemplate.commit;
import static com.jiping.common.JDBCTemplate.rollback;
import static com.jiping.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.Map;

import com.jiping.lecture.model.dao.LectureDao;
import com.jiping.lecture.model.vo.Lecture;
import com.jiping.lecture.model.vo.LectureContent;
import com.jiping.lecture.model.vo.LectureSchedule;
import com.jiping.member.model.vo.Member;
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
	
	public LectureSchedule lectureSchedule(int lectureNo) {
		Connection conn=getConnection();
		LectureSchedule schedule= dao.lectureSchedule(conn, lectureNo);
		close(conn);
		return schedule;
	}
	
	public int enrollLecture(Map lecture) {
		Connection conn = getConnection();
		int result = dao.enrollTutorImage(conn, lecture);
		if (result > 0) commit(conn);
		else rollback(conn);
//		if (result > 0) {
//			int result2 = dao.두번째값들
//		} else {
//			rollback(conn);
//		}
		close(conn);
		return result;
		
	}

}
