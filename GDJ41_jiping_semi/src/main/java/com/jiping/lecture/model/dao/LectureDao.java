package com.jiping.lecture.model.dao;

import static com.jiping.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.jiping.lecture.model.vo.Lecture;
import com.jiping.lecture.model.vo.LectureContent;
import com.jiping.lecture.model.vo.LectureSchedule;
import com.jiping.member.model.vo.Member;
import com.jiping.tutor.model.vo.Certificate;
import com.jiping.tutor.model.vo.Tutor;

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
	
	public int enrollTutorImage (Connection conn, Member m) {
		//to-do:이메일은 세션에서 받아온 값으로 설정해야함. 추후 try문 추가 필요 
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("enrollTutorImg");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, m.getProfileImg());
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} 
		return result;
	}
	
public int enrollTutorInformation (Connection conn, Tutor t) {
		//to-do:이메일은 세션에서 받아온 값으로 설정해야함. 추후 try문 추가 필요 
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("enrollTutorInformation");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, t.getInsta());
			pstmt.setString(2, t.getFacebook());
			pstmt.setString(3, t.getBlog());
			pstmt.setString(4, t.getTutorMsg());
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} 
		return result;
		
	}
public int enrollCertificateInformation (Connection conn, Certificate c) {
		//to-do:이메일은 세션에서 받아온 값으로 설정해야함. 추후 try문 추가 필요 
		PreparedStatement pstmt=null;
		int result = 0;
		String sql=prop.getProperty("enrollCertificateInformation");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getCertificateText());
			pstmt.setString(2, c.getCertificateImg());
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} 
		return result;
	
	}

public int enrollLectureInoformation (Connection conn, Lecture l) {
	//to-do:닉네임은 세션에서 받아온 값으로 설정해야함. 추후 try문 setString.1 수정 필요 
	PreparedStatement pstmt = null;
	int result = 0;
	String sql = prop.getProperty("enrollLectureInformation");
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "화이자");
		pstmt.setString(2, l.getLectureType());
		pstmt.setString(3, l.getLectureCategory());
		pstmt.setString(4, l.getLectureTitle());
		result=pstmt.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	} 
	return result;
	}
	
}
