package com.jiping.lecture.model.dao;

import static com.jiping.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.jiping.lecture.model.vo.Lecture;
import com.jiping.lecture.model.vo.LectureContent;
import com.jiping.lecture.model.vo.LectureImg;
import com.jiping.lecture.model.vo.LectureSchedule;
import com.jiping.lecture.model.vo.VodLecture;
import com.jiping.member.model.vo.Tutor;

public class LectureDao {
	
	private Properties prop= new Properties();
	
	public LectureDao() {
		String path= LectureDao.class.getResource("/sql/lecture/lecturesql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public Lecture lectureInfo(Connection conn, int num ) {
		PreparedStatement pstmt=null;
		ResultSet rs= null; 
		Lecture le=null;
		String sql=prop.getProperty("lectureInfo");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				le= Lecture.builder()
						.lectureNo(rs.getInt("lecture_no")).nickName(rs.getString("nickname"))
						.lectureType(rs.getString("lecture_type")).lectureTitle(rs.getString("lecture_title")).build();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return le;
	}
	
	public LectureContent lectureContent(Connection conn, int num ) {
		PreparedStatement pstmt=null;
		ResultSet rs= null; 
		LectureContent content=null;
		String sql=prop.getProperty("lecutreContent");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				content= LectureContent.builder()
						.lectureNo(rs.getInt("lecture_no")).lectureIntroduce(rs.getString("lecture_introduce"))
						.recommend(rs.getString("recommend")).curriculum(rs.getString("curriculum"))
						.lectureNotice(rs.getString("lecture_notice")).build();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return content;
	}
	
//	public LectureSchedule lectureSchedule(Connection conn, int num ) {
//		PreparedStatement pstmt=null;
//		ResultSet rs= null; 
//		LectureSchedule schedule=null;
//		String sql=prop.getProperty("lectureSchedule");
//		try {
//			pstmt=conn.prepareStatement(sql);
//			pstmt.setInt(1, num);
//			rs=pstmt.executeQuery();
//			if(rs.next()) {
//				schedule= LectureSchedule.builder()
//						.lectureNo(rs.getInt("lecture_no")).lecturePrice(rs.getInt("lecture_price"))
//						.lecturePersons(rs.getInt("lecture_persons")).lectureLocation(rs.getString("lecture_location"))
//						.lectureAddress(rs.getString("lecture_address")).lectureDate(rs.getDate("lecture_date")).build();
//			}
//		}catch(SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(rs);
//			close(pstmt);
//		}
//		return schedule;
//	}
	
	public List<LectureSchedule> scheduleList(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		List <LectureSchedule> list= new ArrayList();
		String sql= prop.getProperty("scheduleList");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				LectureSchedule schedule= LectureSchedule.builder()
						.scheduleNo(rs.getInt("schedule_No"))
						.lectureNo(rs.getInt("lecture_no")).lecturePrice(rs.getInt("lecture_price"))
						.lecturePersons(rs.getInt("lecture_persons")).lectureLocation(rs.getString("lecture_location"))
						.lectureAddress(rs.getString("lecture_address")).lectureDate(rs.getDate("lecture_date"))
						.startDate(rs.getString("start_date")).endDate(rs.getString("end_date")).build();
				list.add(schedule);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
//		System.out.println("dao list:"+list);
		return list;
		
	}
	
	public LectureSchedule scheduleSelectList(Connection conn, int scheduleNo){
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		LectureSchedule sc=null;
		String sql= prop.getProperty("scheduleSelectList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, scheduleNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				sc= LectureSchedule.builder()
						.scheduleNo(rs.getInt("schedule_No"))
						.lectureNo(rs.getInt("lecture_no")).lecturePrice(rs.getInt("lecture_price"))
						.lecturePersons(rs.getInt("lecture_persons")).lectureLocation(rs.getString("lecture_location"))
						.lectureAddress(rs.getString("lecture_address")).lectureDate(rs.getDate("lecture_date"))
						.startDate(rs.getString("start_date")).endDate(rs.getString("end_date")).build();
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
//		System.out.println("dao list:"+list);
		return sc;
		
	}
	
	
	public List<LectureImg> imgList(Connection conn, int lectureNo){
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		List <LectureImg> list= new ArrayList();
		String sql= prop.getProperty("imgList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, lectureNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				LectureImg img= LectureImg.builder()
						.lectureNo(rs.getInt("lecture_no"))
						.lectureFileName(rs.getString("lecture_filename")).build();
				list.add(img);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
		
	}
	
	public Tutor tutorInfo(Connection conn, int num) {
		PreparedStatement pstmt=null;
		ResultSet rs= null; 
		Tutor tutor=null;
		String sql=prop.getProperty("tutorInfo");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				tutor= Tutor.builder()
						.nickname(rs.getString("nickname")).phone(rs.getString("phone")).insta(rs.getString("insta")).facebook(rs.getString("blog"))
						.tutorMsg(rs.getString("tutor_msg")).build();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println("dao:"+tutor);
		return tutor;
	}
	
	public List<VodLecture> vodList(Connection conn, int lectureNo){
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		List <VodLecture> list= new ArrayList();
		String sql= prop.getProperty("vodList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, lectureNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				VodLecture vod= VodLecture.builder()
						.vodUrl(rs.getString("vod_url")).vodPrice(rs.getInt("vod_price")).vodTitle(rs.getString("vod_title"))
						.vodContent(rs.getString("vod_content")).build();
				list.add(vod);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
}
