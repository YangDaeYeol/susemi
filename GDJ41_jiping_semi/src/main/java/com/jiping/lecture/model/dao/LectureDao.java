package com.jiping.lecture.model.dao;

import static com.jiping.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.jiping.lecture.model.vo.Lecture;
import com.jiping.lecture.model.vo.LectureContent;
import com.jiping.lecture.model.vo.LectureSchedule;

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
	
	public LectureSchedule lectureSchedule(Connection conn, int num ) {
		PreparedStatement pstmt=null;
		ResultSet rs= null; 
		LectureSchedule schedule=null;
		String sql=prop.getProperty("lectureSchedule");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				schedule= LectureSchedule.builder()
						.lectureNo(rs.getInt("lecture_no")).lecturePrice(rs.getInt("lecture_price"))
						.lecturePersons(rs.getInt("lecture_persons")).lectureLocation(rs.getString("lecture_location"))
						.lectureAddress(rs.getString("lecture_address")).lectureDate(rs.getDate("lecture_date")).build();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return schedule;
	}
	
}
