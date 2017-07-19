package work.model.service;

import work.Util.Util;
import work.model.dao.MemberDao;
import work.model.dto.Member;

/**
 * Created by KimDaeil on 2017. 7. 15..
 */
public class MemberService {

	private MemberDao dao = new MemberDao();

	public Member signUp(String id, String pw, String nickname) {

		if (isValidMemberId(id) && isValidPw(pw) && isValidNickname(nickname)) {

			Member member = new Member(id.toUpperCase(), pw.toUpperCase(), nickname.toUpperCase());
			if (dao.insert(member) > 0) {
				return member;
			}

		}

		return null;
	}

	public Member login(String id, String pw) {
		Member member = null;

		if (isValidLoginInfo(id, pw)) {
			member = dao.selectOne(id.toUpperCase(), pw);
		}

		return member;

	}

	public int delete(String id, String pw) {

		if (isValidMemberId(id) && isValidPw(pw)) {
			return dao.delete(id.trim().toUpperCase(), pw.trim());
		}

		return 0;
	}

	public boolean isDuplicatedId(String id) {
		if (isValidMemberId(id)) {
			return !Util.isEqualsNull(dao.selectMemberId(id));
		}

		return false;
	}

	public boolean isValidLoginInfo(String id, String pw) {

		if (!isValidMemberId(id)) {
			return false;
		}

		if (!isValidPw(pw)) {
			return false;
		}

		return true;
	}

	private boolean isValidMemberId(String id) {

		if (Util.isNull(id) || id.isEmpty()) {
			return false;
		}

		if (Util.isMatched("[A-Za-z]{1}[a-zA-Z0-9]+", id)) {
			return Util.isValidStringLength(id, 2, 16);

		}

		return false;
	}

	private boolean isValidPw(String pw) {
		return Util.isValidStringLength(pw, 2, 16);
	}

	private boolean isValidNickname(String nickname) {
		return Util.isValidStringLength(nickname, 2, 16);
	}

}
