package com.jiping.member.model.service;

import static com.jiping.common.JDBCTemplate.close;
import static com.jiping.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.jiping.member.model.dao.MemberDao;
import com.jiping.member.model.vo.Member;

public class MemberService {
	
	private MemberDao dao = new MemberDao();
	
	public List<String> selectAllEmail() {
		Connection conn = getConnection();
		List<String> list = dao.selectAllEmail(conn);
		close(conn);
		return list;
	}
	
	public Member findEmail(String userName, String phone) {
		Connection conn = getConnection();
		Member m = dao.findEmail(conn,userName,phone);
		close(conn);
		return m;
	}
}
