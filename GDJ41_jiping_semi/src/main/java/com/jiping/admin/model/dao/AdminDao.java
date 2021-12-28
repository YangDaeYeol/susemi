package com.jiping.admin.model.dao;

import static com.jiping.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.jiping.admin.model.vo.Report;
import com.jiping.member.model.dao.MemberDao;
import com.jiping.member.model.vo.Member;

public class AdminDao {
	
private Properties prop = new Properties();
	
	public AdminDao() {
		String path = AdminDao.class.getResource("/sql/admin/adminsql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public Report reprtDetail(Connection conn, int commentNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=prop.getProperty("reprtDetail");
		Report re=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, commentNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				re=Report.builder()
						.commentNo(rs.getInt("comment_No"))
						.reportUser(rs.getString("report_user"))
						.reportType(rs.getString("report_type"))
						.reportContent(rs.getString("report_content"))
						.reportDate(rs.getDate("report_Date"))
						.build();
			}

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return re;		
	}


	public int reportDelete(Connection conn, int commentNo) {
		PreparedStatement pstmt = null;
		int result=0;
		String sql=prop.getProperty("reportDelete");
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, commentNo);
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

}
