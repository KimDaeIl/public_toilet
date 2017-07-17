package work.model.dao;

import work.model.dto.Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by KimDaeil on 2017. 7. 15..
 */
public class MemberDao extends BaseDao {

	public int insert(Member member) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"INSERT INTO members(id, member_id, member_pw, nickname) values(seq_user_id.NEXTVAL, ?, ?, ?)");
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPw());
			pstmt.setString(3, member.getNickname());

			result = pstmt.executeUpdate();
			conn.commit();

			return result;
		} catch (SQLException e) {

			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}

		} finally {
			close(null, pstmt, conn);

		}

		return result;
	}

	public Member selectOne(String id, String pw) {

		Member member = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM members WHERE member_id=? and member_pw=?");
			pstmt.setString(1, id);
			pstmt.setString(2, pw);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				member = new Member();
				member.setId(rs.getInt("id"));
				member.setMemberId(rs.getString("member_id"));
				member.setMemberPw(rs.getString("member_pw"));
				member.setNickname(rs.getString("nickname"));
				member.setEntryDate(rs.getString("entry_date"));
			}

		} catch (SQLException e) {

			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}

		} finally {
			close(rs, pstmt, conn);

		}

		return member;
	}

	public String selectMemberId(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM members WHERE member_id=?");
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs.getString("member_id");
			}

		} catch (SQLException e) {

			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}

		} finally {
			close(rs, pstmt, conn);

		}
		return null;

	}
}
