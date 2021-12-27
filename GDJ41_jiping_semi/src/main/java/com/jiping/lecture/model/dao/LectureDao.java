package com.jiping.lecture.model.dao;

import static com.jiping.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import java.util.Properties;

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
	
	public List<LectureSchedule> scheduleList(Connection conn,int lectureNo){
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		List <LectureSchedule> list= new ArrayList();
		String sql= prop.getProperty("scheduleList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, lectureNo);
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
		System.out.println("dao list:"+sc);
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
						.lectureFileName(rs.getString("lecture_filename"))
						.build();
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
	
	public Member tutorImg(Connection conn, int num) {
		PreparedStatement pstmt=null;
		ResultSet rs= null; 
		Member m=null;
		String sql=prop.getProperty("selectTutorImg");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m= Member.builder()
						.nickname(rs.getString("nickname"))
						.profileImg(rs.getString("profile_img")).build();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	
	public List<Certificate> certificate(Connection conn, int lectureNo){
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		List <Certificate> list= new ArrayList();
		String sql= prop.getProperty("certificateList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, lectureNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Certificate c= Certificate.builder()
						.certificateText(rs.getString("certificate_text")).build();
				list.add(c);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public VodLecture selectTitleVod(Connection conn, String title, int lectureNo) {
		PreparedStatement pstmt=null;
		ResultSet rs= null; 
		VodLecture v=null;
		String sql=prop.getProperty("selectTitleVod");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setInt(2, lectureNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				v= VodLecture.builder()
						.vodContent(rs.getString("vod_content")).build();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return v;
	}
	
	public Payment payment(Connection conn, int lectureNo, String email){
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		Payment p= null;
		String sql= prop.getProperty("selectPayment");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, lectureNo);
			pstmt.setString(2, email);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				p= Payment.builder()
						.lectureNo(rs.getInt("lecture_no"))
						.email(rs.getString("email")).build();
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return p;
	}
	
	public int insertComment(Connection conn, LectureComment lc) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertComment");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, lc.getLectureNo());
			pstmt.setString(2, lc.getWriter());
			pstmt.setString(3, lc.getStarRate());
			pstmt.setString(4, lc.getCommentContent());
			pstmt.setInt(5, lc.getCommentLevel());
			pstmt.setString(6, lc.getCommentRef()==0?null:String.valueOf(lc.getCommentRef()));
			pstmt.setString(7, lc.getLectureTitle());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public List<LectureComment> lcList(Connection conn, int lectureNo){
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		List <LectureComment> list= new ArrayList();
		String sql= prop.getProperty("commentList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, lectureNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				LectureComment lc= LectureComment.builder()
						.commentNo(rs.getInt("comment_No")).lectureNo(rs.getInt("lecture_no")).writer(rs.getString("writer"))
						.starRate(rs.getString("star_rate")).commentContent(rs.getString("comment_content")).enrollDate(rs.getDate("comment_enroll_date"))
						.commentLevel(rs.getInt("comment_level")).profileImg(rs.getString("profile_img")).build();
				list.add(lc);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	
//	----------------------------------------------------------------
	
	public int enrollTutorImage (Connection conn, Member m) {
		//to-do:이메일은 세션에서 받아온 값으로 설정해야함. 추후 try문 추가 필요 
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("enrollTutorImg");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, m.getProfileImg());
			//여기에 추가해야함
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} 
		return result;
	}
	
	public int enrollTutorInformation (Connection conn, Tutor t) {
			//to-do:1. 닉네임받아오기. 2. 핸드폰 번호 세션에서 받아온 값으로 설정해야함. 추후 try문 추가 필요 
			PreparedStatement pstmt = null;
			int result = 0;
			String sql = prop.getProperty("enrollTutorInformation");
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "myNickName");
				pstmt.setString(2, t.getInsta());
				pstmt.setString(3, t.getFacebook());
				pstmt.setString(4, t.getBlog());
				pstmt.setString(5, t.getTutorMsg());
				result=pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			} 
			return result;
			
		}
	public int enrollCertificateInformation (Connection conn, Certificate c) {
			//to-do:닉네임은 세션에서 받아온 값으로 설정해야함. 추후 try문 추가 필요 
			PreparedStatement pstmt=null;
			int result = 0;
			String sql=prop.getProperty("enrollCertificateInformation");
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "myNickName");
				pstmt.setString(2, c.getCertificateText());
				pstmt.setString(3, c.getCertificateImg());
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
			pstmt.setString(1, "myNickName");
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
	
	public int enrollLectureImg(Connection conn, LectureImg lImg, String fileNameArray) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("enrollLectureImg");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "myNickName");
			pstmt.setString(2, fileNameArray);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} 
		return result;
	}
	
	public int enrollLectureContent(Connection conn, LectureContent lc) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("enrollLectureContent");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "myNickName");
			pstmt.setString(2, lc.getLectureIntroduce());
			pstmt.setString(3, lc.getRecommend());
			pstmt.setString(4, lc.getCurriculum());
			pstmt.setString(5, lc.getLectureNotice());
			result = pstmt.executeUpdate();		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} 
		return result;
	}
	
	public List<Lecture> apprLectureList(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		List <Lecture> list= new ArrayList();
		String sql= prop.getProperty("apprLectureList");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Lecture apprLecture= Lecture.builder()
						.lectureNo(rs.getInt("lecture_No"))
						.lectureTitle(rs.getString("lecture_Title"))
						.nickName(rs.getString("nickname"))
						.confirm(rs.getString("confirm").charAt(0))
						.build();
				list.add(apprLecture);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public int apprLecture(Connection conn, int lectureNo) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("apprLecture");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, lectureNo);
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int enrollLectureSchedule(Connection conn, LectureSchedule ls, Date onedayClassDate, String onedayClassStartTime, String onedayClassEndTime) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("enrollLectureSchedule");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "myNickName");
			pstmt.setInt(2, ls.getLecturePrice());
			pstmt.setInt(3, ls.getLecturePersons());
			pstmt.setString(4, ls.getLectureLocation());
			pstmt.setString(5, ls.getLectureAddress());
			pstmt.setDate(6, onedayClassDate);
			pstmt.setString(7, onedayClassStartTime);
			pstmt.setString(8, onedayClassEndTime);
			result = pstmt.executeUpdate();		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} 
		return result;
	}
	
	public List<Lecture> onedayLectureList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Lecture> list = new ArrayList<Lecture>();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("onedayLectureList"));
			pstmt.setString(1, "원데이");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Lecture l = Lecture.builder()
						.lectureNo(rs.getInt("lecture_no"))
						.nickName(rs.getString("nickname"))
						.lectureType(rs.getString("lecture_type"))
						.lectureCategory(rs.getString("lecture_category"))
						.lectureTitle(rs.getString("lecture_title"))
						.wishCount(rs.getInt("wish_count"))
						.commentCount(rs.getInt("comment_count"))
						.price(rs.getInt("price"))
						.tutorImg(rs.getString("tutor_img"))
						.thumbnail(rs.getString("thumbnail"))
						.build();
				list.add(l);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public List<Lecture> everydayLectureList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Lecture> list = new ArrayList<Lecture>();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("everydayLectureList"));
			pstmt.setString(1, "다회차");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Lecture l = Lecture.builder()
						.lectureNo(rs.getInt("lecture_no"))
						.nickName(rs.getString("nickname"))
						.lectureType(rs.getString("lecture_type"))
						.lectureCategory(rs.getString("lecture_category"))
						.lectureTitle(rs.getString("lecture_title"))
						.wishCount(rs.getInt("wish_count"))
						.commentCount(rs.getInt("comment_count"))
						.price(rs.getInt("price"))
						.tutorImg(rs.getString("tutor_img"))
						.thumbnail(rs.getString("thumbnail"))
						.build();
				list.add(l);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public List<Lecture> vodLectureList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Lecture> list = new ArrayList<Lecture>();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("everydayLectureList"));
			pstmt.setString(1, "VOD");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Lecture l = Lecture.builder()
						.lectureNo(rs.getInt("lecture_no"))
						.nickName(rs.getString("nickname"))
						.lectureType(rs.getString("lecture_type"))
						.lectureCategory(rs.getString("lecture_category"))
						.lectureTitle(rs.getString("lecture_title"))
						.wishCount(rs.getInt("wish_count"))
						.commentCount(rs.getInt("comment_count"))
						.price(rs.getInt("price"))
						.tutorImg(rs.getString("tutor_img"))
						.thumbnail(rs.getString("thumbnail"))
						.build();
				list.add(l);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public List<Lecture> searchResult(Connection conn, String keyword, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Lecture> list = new ArrayList<Lecture>();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("searchResult"));
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, "%" + keyword + "%");
			pstmt.setString(3, "%" + keyword + "%");
			pstmt.setInt(4, (cPage-1)*numPerPage+1);
			pstmt.setInt(5, cPage*numPerPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Lecture l = Lecture.builder()
						.lectureNo(rs.getInt("lecture_no"))
						.nickName(rs.getString("nickname"))
						.lectureType(rs.getString("lecture_type"))
						.lectureCategory(rs.getString("lecture_category"))
						.lectureTitle(rs.getString("lecture_title"))
						.wishCount(rs.getInt("wish_count"))
						.commentCount(rs.getInt("comment_count"))
						.price(rs.getInt("price"))
						.tutorImg(rs.getString("tutor_img"))
						.thumbnail(rs.getString("thumbnail"))
						.build();
				list.add(l);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public int searchResultCount(Connection conn, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("searchResultCount"));
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, "%" + keyword + "%");
			pstmt.setString(3, "%" + keyword + "%");
			rs = pstmt.executeQuery();
			if(rs.next()) result = rs.getInt("count");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public int enrollVodLecture(Connection conn, String vodUrlAddr, String vodTitle, String vodClassInfo, VodLecture vl) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("enrollVodLecture");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "myNickName");
			pstmt.setString(2, vodUrlAddr);
			pstmt.setInt(3, vl.getVodPrice());
			pstmt.setString(4, vodTitle);
			pstmt.setString(5, vodClassInfo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} 
		return result;
	}
	public List<LectureComment> reportCommentList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		List <LectureComment> list= new ArrayList();
		String sql= prop.getProperty("reportCommentList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,(cPage-1)*numPerPage+1);
			pstmt.setInt(2,  cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				LectureComment reportCommentList = LectureComment.builder()
						.lectureNo(rs.getInt("lecture_no"))
						.writer(rs.getString("writer"))
						.lectureTitle(rs.getString("lecture_title"))
						.commentContent(rs.getString("comment_content"))
						.build();

				list.add(reportCommentList);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public int selectReportCommetAllCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		int result = 0;
		String sql= prop.getProperty("selectReportCommetAllCount");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
		
}
		
