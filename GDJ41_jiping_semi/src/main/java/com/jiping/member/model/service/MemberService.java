package com.jiping.member.model.service;

import static com.jiping.common.JDBCTemplate.close;
import static com.jiping.common.JDBCTemplate.getConnection;
import static com.jiping.common.JDBCTemplate.rollback;
import static com.jiping.common.JDBCTemplate.commit;

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
	

	public Member loginMember(String email, String password) {
		Connection conn=getConnection();
		Member m=dao.loginMember(conn, email, password);
		close(conn);
		return m;
	}
	
	public Member findEmail(String userName, String phone) {
		Connection conn = getConnection();
		Member m = dao.findEmail(conn,userName,phone);
		close(conn);
		return m;
	}
	
	public int dropMember(String email) {
		Connection conn=getConnection();
		int result=dao.dropMember(conn, email);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
}
