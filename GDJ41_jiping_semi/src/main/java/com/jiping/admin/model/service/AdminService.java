package com.jiping.admin.model.service;

import static com.jiping.common.JDBCTemplate.close;
import static com.jiping.common.JDBCTemplate.commit;
import static com.jiping.common.JDBCTemplate.rollback;
import static com.jiping.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.jiping.admin.model.dao.AdminDao;
import com.jiping.admin.model.vo.Report;

public class AdminService {
	
	private AdminDao dao = new AdminDao();

	public Report reprtDetail(int commentNo) {
		Connection conn = getConnection();
		Report re = dao.reprtDetail(conn,commentNo);
		close(conn);
		return re;
	}

	public int reportDelete(int commentNo) {
		Connection conn = getConnection();
		int result= dao.reportDelete(conn, commentNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	
}
