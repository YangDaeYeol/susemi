package com.jiping.member.model.dao;

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
}
