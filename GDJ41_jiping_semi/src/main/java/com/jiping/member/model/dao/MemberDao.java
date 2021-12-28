package com.jiping.member.model.dao;

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
import com.jiping.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		String path = MemberDao.class.getResource("/sql/member/member.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public List<String> selectAllEmail(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> list = new ArrayList<String>();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectAllEmail"));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String email = rs.getString("email");
				list.add(email);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public Member loginMember(Connection conn, String email, String password) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=prop.getProperty("loginMember");
		Member m=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=Member.builder()
						.email(rs.getString("email"))
						.memberGrade(rs.getString("member_grade"))
//						.memberName(rs.getString("member_name"))
//						.gender(rs.getString("gender").charAt(0))
//						.phone(rs.getString("phone"))
//						.marketing(rs.getString("marketing").charAt(0))
						.profileImg(rs.getString("profile_img"))
						.nickname(rs.getString("nickname"))
						.build();
			}								
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;		
	}


	public Member findEmail(Connection conn, String userName, String phone) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		String sql=prop.getProperty("findEmail");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, phone);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=Member.builder()
						.email(rs.getString("EMAIL"))
						.build();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}

	public Member selectMember(Connection conn, String email) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		String sql=prop.getProperty("selectMember");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=Member.builder()
						.email(rs.getString("email"))
						.memberGrade(rs.getString("member_grade"))
						.memberName(rs.getString("member_name"))
						.gender(rs.getString("gender"))
						.phone(rs.getString("phone"))
						.marketing(rs.getString("marketing").charAt(0))
						.profileImg(rs.getString("profile_img"))
						.nickname(rs.getString("nickname"))
						.build();
				if(m.getMemberGrade().equals("수강생")) {										
					m.setMemberLocation(rs.getString("member_location")==null?"":rs.getString("member_location"));
					m.setMemberCategory(rs.getString("member_category")==null?"":rs.getString("member_category"));
					
				}
			}
					
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
			
				
	}

	public int dropMember(Connection conn, String email) {
		PreparedStatement pstmt = null;
		int result=0;
		String sql=prop.getProperty("dropMember");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, email);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public List<String> selectAllNickname(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> list = new ArrayList<String>();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectAllNickname"));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String name = rs.getString("nickname");
				list.add(name);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int passwordUpdate(Connection conn, String email, String password) {
		PreparedStatement pstmt = null;
		int result=0;
		String sql=prop.getProperty("passwordUpdate");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, password);
			pstmt.setString(2, email);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int enrollMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("enrollMember"));
			pstmt.setString(1, m.getEmail());
			pstmt.setString(2, m.getMemberGrade());
			pstmt.setString(3, m.getPassword());
			pstmt.setString(4, m.getMemberName());
			pstmt.setString(5, m.getGender());
			pstmt.setString(6, m.getPhone());
			pstmt.setString(7, String.valueOf(m.getMarketing()));
			pstmt.setString(8, m.getNickname());
			pstmt.setString(9, m.getMemberLocation());
			pstmt.setString(10, m.getMemberCategory());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public Member nicknameDuplicateCheck(Connection conn, String newNick) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m=null;
		String sql=prop.getProperty("selectNickname");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, newNick);
			if(rs.next()) {
				m=Member.builder()
						.email(rs.getString("email"))
						.nickname(rs.getString("nickname"))
						.build();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;				
	}

	public List<Member> normalMemberList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		List <Member> list= new ArrayList();
		String sql= prop.getProperty("normalMemberList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,(cPage-1)*numPerPage+1);
			pstmt.setInt(2,  cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Member normalMemberList= Member.builder()
						.memberName(rs.getString("member_name"))
						.nickname(rs.getString("nickname"))
						.email(rs.getString("email"))
						.phone(rs.getString("phone"))
						.build();
				list.add(normalMemberList);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public List<Member> tutorList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		List <Member> list= new ArrayList();
		String sql= prop.getProperty("tutorList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,(cPage-1)*numPerPage+1);
			pstmt.setInt(2,  cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Member normalMemberList= Member.builder()
						.memberName(rs.getString("member_name"))
						.nickname(rs.getString("nickname"))
						.email(rs.getString("email"))
						.phone(rs.getString("phone"))
						.build();
				list.add(normalMemberList);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int selectNormalMemberAllCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		int result = 0;
		String sql= prop.getProperty("selectNormalMemberAllCount");
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

	public int selectTutorAllCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		int result = 0;
		String sql= prop.getProperty("selectTutorAllCount");
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
	
	
	public Member findPhoneNumber(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=prop.getProperty("findPhoneNumber");
		Member m2 = null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, m.getEmail());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m2 =Member.builder()
						.phone(rs.getString("phone"))
						.build();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m2;			
	}
	
	
}
