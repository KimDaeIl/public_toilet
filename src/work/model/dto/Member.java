package work.model.dto;

/**
 * Created by KimDaeil on 2017. 7. 15..
 */
public class Member {

	private int id;
	private String memberId;
	private String memberPw;
	private String nickname;
	private String entryDate;

	public Member() {
	}

	public Member(String memberId, String memberPw) {
		this.memberId = memberId;
		this.memberPw = memberPw;

	}

	public Member(String memberId, String memberPw, String nickname) {
		this(memberId, memberPw);
		this.nickname = nickname;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(String entryDate) {
		this.entryDate = entryDate;
	}
}
