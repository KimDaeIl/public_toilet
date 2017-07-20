package work.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLClientInfoException;
import java.sql.SQLException;
import java.util.ArrayList;

import work.Util.Util;
import work.model.dto.Member;
import work.model.dto.Review;
import work.model.dto.ReviewList;
import work.model.dto.Toilet;

public class ReviewDao extends BaseDao {

	public ReviewList getToiletReivews(int toiletId) {
		ReviewList reviewList = new ReviewList();
		Toilet toilet = getToilet(toiletId);

		if (Util.isValidId(toilet.getId())) {
			if (!Util.isNull(toilet) && Util.isValidId(toilet.getId())) {
				reviewList = getReviews(toiletId, 1);
			}

			reviewList.setToilet(toilet);
		}

		return reviewList;
	}

	public ReviewList getToiletReivewsWithMembers(int toiletId, int memberId) {

		ReviewList list = new ReviewList();

		Toilet toilet = getToilet(toiletId);

		if (!Util.isNull(toilet) && Util.isValidId(toilet.getId())) {

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				StringBuilder sql = new StringBuilder();

				sql.append("(select  m.id as m_id, m.nickname as m_nickname, review, score,r.reg_date as r_reg_date ")
						.append("from (select * ")
						.append(" from(select ROWNUM as num, toilet_id,writer_id, review, score,reg_date ")
						.append(" from (select * from reviews where toilet_id=? order by reg_date) WHERE ROWNUM<=?)   where num>?) r, members m ")
						.append(" where r.writer_id=m.id)").append("union")
						.append("(select m.id as m_id, m.nickname as m_nickname, review, score,r.reg_date as r_reg_date ")
						.append("from members m, reviews r where r.toilet_id=? and r.writer_id=? and m.id = r.writer_id)");

				conn = getConnection();

				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setInt(1, toilet.getId());
				pstmt.setInt(2, 15);
				pstmt.setInt(3, 0);
				pstmt.setInt(4, toilet.getId());
				pstmt.setInt(5, memberId);

				rs = pstmt.executeQuery();

				ArrayList<Review> reviewList = new ArrayList<>();
				Review rTemp = null;
				while (rs.next()) {
					rTemp = new Review(rs.getInt("m_id"));
					rTemp.setMemberNickname(rs.getString("m_nickname"));
					rTemp.setReview(rs.getString("review"));
					rTemp.setScore(rs.getInt("score"));
					rTemp.setRegDate(rs.getString("r_reg_date"));
					reviewList.add(rTemp);
				}

				list.setToilet(toilet);
				list.setList(reviewList);
				
			} catch (SQLException e) {
				System.out.println("review > dao > getToiletReivewsWithMembers");
				e.printStackTrace();

			} finally {
				close(rs, pstmt, conn);
			}
		}
		return list;

	}

	public ReviewList getReviewPage(int toiletId, int pageNum) {

		return getReviewPage(toiletId, pageNum, 15);
	}

	public ReviewList getReviewPage(int toiletId, int page, int dataCount) {
		ReviewList reviewList = new ReviewList();
		Toilet toilet = getToilet(toiletId);

		if (Util.isValidId(toilet.getId())) {
			if (!Util.isNull(toilet) && Util.isValidId(toilet.getId())) {
				reviewList = getReviews(toiletId, page);
			}

			reviewList.setToilet(toilet);
		}

		return reviewList;
	}

	private ReviewList getReviews(int toiletId, int pageNum) {
		return getReviews(toiletId, pageNum, 15);
	}

	private ReviewList getReviews(int toiletId, int pageNum, int dataCount) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ReviewList list = new ReviewList(pageNum);
		try {
			StringBuilder sql = new StringBuilder();
			sql.append("select  m.id as m_id, m.nickname as m_nickname, review, score,r.reg_date as r_reg_date ")
					.append("from (select * ")
					.append("from(select ROWNUM as num, toilet_id,writer_id, review, score,reg_date ")
					.append("from (select * from reviews where toilet_id = ? order by reg_date) WHERE ROWNUM <= ?)   where num > ?) r, members m ")
					.append("where r.writer_id = m.id");
			conn = getConnection();
			pstmt = conn.prepareStatement(sql.toString());

			pstmt.setInt(1, toiletId);
			pstmt.setInt(2, pageNum * dataCount);
			pstmt.setInt(3, (pageNum - 1) * dataCount);

			rs = pstmt.executeQuery();

			Review rTemp = null;
			ArrayList<Review> reviewList = new ArrayList<>();
			while (rs.next()) {
				rTemp = new Review(rs.getInt("m_id"));
				rTemp.setMemberNickname(rs.getString("m_nickname"));
				rTemp.setReview(rs.getString("review"));
				rTemp.setScore(rs.getInt("score"));
				rTemp.setRegDate(rs.getString("r_reg_date"));
				reviewList.add(rTemp);
			}

			list.setList(reviewList);

		} catch (SQLException e) {
			System.out.println("review > dao > gerReviewPage");
			e.printStackTrace();

			list.clear();
		} finally {
			close(rs, pstmt, conn);
		}

		return list;
	}

	private Toilet getToilet(int toiletId) {

		Connection conn = null;
		PreparedStatement toiletPstmt = null;
		ResultSet rs = null;

		Toilet tTemp = new Toilet();

		try {
			conn = getConnection();
			toiletPstmt = conn.prepareStatement(
					"select c.name as city, b.name as borough,t.ID as t_id,t. NAME as t_name,TYPE,IS_COMMON,COUNT_MAN_FECES,COUNT_MAN_URINE,COUNT_MAN_FECES_WITH_HANDICAP,COUNT_MAN_URIN_WITH_HANDICAP,COUNT_MAN_CHILD_FECES,COUNT_MAN_CHILD_URINE,COUNT_LADY_FECES,COUNT_LADY_FECES_WITH_HANDICAP,COUNT_LADY_CHILD_FECES,MANAGE_AGENCY,PHONE,OPEN_TIME,INSTALLATION_DATE,LAT,LON,STD_DATE,PHONE2,COUNT_REVIEW,SUM_REVIEW,t.REG_DATE as t_reg_date "
							+ "from cities c, boroughs b, toilets t	"
							+ "where t.id=? and t.borough_id = b.id and b.city_id=c.id");
			System.out.println(toiletId);
			toiletPstmt.setInt(1, toiletId);
			rs = toiletPstmt.executeQuery();

			if (rs.next()) {
				tTemp = new Toilet(rs.getInt("t_id"));
				tTemp.setCityName(rs.getString("city"));
				tTemp.setBoroughName(rs.getString("borough"));
				tTemp.setName(rs.getString("t_name"));
				tTemp.setType(rs.getString("TYPE"));
				tTemp.setIsCommon(rs.getString("IS_COMMON").charAt(0));
				tTemp.setCountManFeces(rs.getInt("COUNT_MAN_FECES"));
				tTemp.setCountManUrine(rs.getInt("COUNT_MAN_URINE"));
				tTemp.setCountManFecesForHandicapped(rs.getInt("COUNT_MAN_FECES_WITH_HANDICAP"));
				tTemp.setCountManUrineForHandicapped(rs.getInt("COUNT_MAN_URIN_WITH_HANDICAP"));
				tTemp.setCountManChildFeces(rs.getInt("COUNT_MAN_CHILD_FECES"));
				tTemp.setCountManChildUrine(rs.getInt("COUNT_MAN_CHILD_URINE"));
				tTemp.setCountLadyFeces(rs.getInt("COUNT_LADY_FECES"));
				tTemp.setCountLadyFecesForHandicapped(rs.getInt("COUNT_LADY_FECES_WITH_HANDICAP"));
				tTemp.setCountLadyChildFeces(rs.getInt("COUNT_LADY_CHILD_FECES"));
				tTemp.setManagementAgency(rs.getString("MANAGE_AGENCY"));
				tTemp.setPhone(rs.getString("PHONE"));
				tTemp.setOpenTime(rs.getString("OPEN_TIME"));
				tTemp.setInstallationDate(rs.getString("INSTALLATION_DATE"));
				tTemp.setLat(rs.getDouble("LAT"));
				tTemp.setLon(rs.getDouble("LON"));
				tTemp.setStdDate(rs.getString("STD_DATE"));
				tTemp.setPhone2(rs.getString("PHONE2"));
				tTemp.setRegDate(rs.getString("t_reg_date"));
				tTemp.setSumReview(rs.getInt("SUM_REVIEW"));
				tTemp.setCountReview(rs.getInt("COUNT_REVIEW"));

			}

		} catch (SQLException e) {
			System.out.println("review > dao > getToiletReivews");
			e.printStackTrace();
		} finally {

			close(rs, toiletPstmt, conn);

		}

		return tTemp;
	}

	public int add(int toiletId, int writerId, String review, int score) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		int result = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("INSERT INTO REVIEWS(toilet_id, writer_id, review, score) VALUES(?,?,?,?)");
			pstmt.setInt(1, toiletId);
			pstmt.setInt(2, writerId);
			pstmt.setString(3, review);
			pstmt.setInt(4, score);

			result = pstmt.executeUpdate();

			if (result > 0) {

				pstmt = conn.prepareStatement(
						"UPDATE toilets SET count_review = count_review + 1, sum_review = sum_review + ? WHERE id = ?");
				pstmt.setInt(1, score);
				pstmt.setInt(2, toiletId);

				result = pstmt.executeUpdate();

				conn.commit();
			}

		} catch (SQLException e) {
			System.out.println("review > dao > addReview");
			e.printStackTrace();

			try {
				conn.rollback();

			} catch (SQLException ee) {
				System.out.println("review > dao > addReview > catch > rollback()");
				e.printStackTrace();
			}
		}

		return result;
	}

	public int update(int toiletId, int writerId, String review, int score) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		int result = 0;

		try {
			conn = getConnection();
			pstmt = conn
					.prepareStatement("UPDATE reviews SET review=?,score=score+? WHERE toilet_id=? and writer_id=?");
			pstmt.setString(1, review);
			pstmt.setInt(2, score);
			pstmt.setInt(3, toiletId);
			pstmt.setInt(4, writerId);

			result = pstmt.executeUpdate();

			if (result > 0) {

				pstmt = conn.prepareStatement("UPDATE toilets SET sum_review = sum_review + ? WHERE id = ?");
				pstmt.setInt(1, score);
				pstmt.setInt(2, toiletId);

				result = pstmt.executeUpdate();

				conn.commit();
			}

		} catch (SQLException e) {
			System.out.println("review > dao > addReview");
			e.printStackTrace();

			try {
				conn.rollback();

			} catch (SQLException ee) {
				System.out.println("review > dao > addReview > catch > rollback()");
				e.printStackTrace();
			}
		}

		return result;
	}
}
