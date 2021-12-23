package com.jiping.member.model.service;

import static com.jiping.common.JDBCTemplate.getConnection;
import static com.jiping.common.JDBCTemplate.close;

import java.sql.Connection;
import java.util.List;

import com.jiping.member.model.dao.MemberDao;

public class MemberService {
	
	private MemberDao dao = new MemberDao();
	
	public List<String> selectAllEmail() {
		Connection conn = getConnection();
		List<String> list = dao.selectAllEmail(conn);
		close(conn);
		return list;
	}
}
