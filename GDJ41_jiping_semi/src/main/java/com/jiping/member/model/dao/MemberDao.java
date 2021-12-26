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

import com.jiping.member.model.vo.Member;

import static com.jiping.common.JDBCTemplate.close;

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
			close(pstmt);
			close(rs);
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
			close(pstmt);
			close(rs);
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
						.gender(rs.getString("gender").charAt(0))
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
			close(pstmt);
			close(rs);
		}
		return list;
	}
}
