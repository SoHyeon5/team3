package member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import interior.service.InteriorNotFoundException;
import jdbc.connection.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;


public class ListMemberService {

	private MemberDao memberDao = new MemberDao();
	private int size = 10;

	public MemberPage getMemberPage(int pageNum) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			int total = memberDao.selectCount(conn);
			List<Member> content = memberDao.select(
					conn, (pageNum - 1) * size + 1, pageNum * size);
			return new MemberPage(total, pageNum, size, content);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public Member getMember(String id) {
		try (Connection conn = ConnectionProvider.getConnection()){
			Member member = memberDao.selectById(conn, id);
			if (id == null) {
				throw new InteriorNotFoundException();
			}

			return member;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
