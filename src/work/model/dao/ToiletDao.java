package work.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import work.model.dto.Borough;
import work.model.dto.City;
import work.model.dto.Toilet;

public class ToiletDao extends BaseDao {

	public ArrayList<Toilet> getAll(int boroughId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Toilet> list = new ArrayList<>();

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select c.name as city_name ,b.name as borough_name ,t.BOROUGH_ID,t.ID,t.NAME,t.TYPE,t.IS_COMMON,t.COUNT_MAN_FECES,t.COUNT_MAN_URINE,t.COUNT_MAN_FECES_WITH_HANDICAP,t.COUNT_MAN_URIN_WITH_HANDICAP,t.COUNT_MAN_CHILD_FECES,t.COUNT_MAN_CHILD_URINE,t.COUNT_LADY_FECES,t.COUNT_LADY_FECES_WITH_HANDICAP,t.COUNT_LADY_CHILD_FECES,t.MANAGE_AGENCY,t.PHONE,t.OPEN_TIME,t.INSTALLATION_DATE,t.LAT,t.LON,t.STD_DATE,t.PHONE2,t.COUNT_REVIEW,t.SUM_REVIEW,t.REG_DATE  from  toilets t, cities c, boroughs b where b.id=? and b.id=t.borough_id and b.city_id = c.id");
			pstmt.setInt(1, boroughId);
			rs = pstmt.executeQuery();

			Toilet temp = null;
			while (rs.next()) {
				temp = new Toilet(rs.getInt("id"));
				temp.setCityName(rs.getString("city_name"));
				temp.setBoroughName(rs.getString("borough_name"));
				temp.setName(rs.getString("NAME"));
				temp.setType(rs.getString("TYPE"));
				temp.setIsCommon(rs.getString("IS_COMMON").charAt(0));
				temp.setCountManFeces(rs.getInt("COUNT_MAN_FECES"));
				temp.setCountManUrine(rs.getInt("COUNT_MAN_URINE"));
				temp.setCountManFecesForHandicapped(rs.getInt("COUNT_MAN_FECES_WITH_HANDICAP"));
				temp.setCountManUrineForHandicapped(rs.getInt("COUNT_MAN_URIN_WITH_HANDICAP"));
				temp.setCountManChildFeces(rs.getInt("COUNT_MAN_CHILD_FECES"));
				temp.setCountManChildUrine(rs.getInt("COUNT_MAN_CHILD_URINE"));
				temp.setCountLadyFeces(rs.getInt("COUNT_LADY_FECES"));
				temp.setCountLadyFecesForHandicapped(rs.getInt("COUNT_LADY_FECES_WITH_HANDICAP"));
				temp.setCountLadyChildFeces(rs.getInt("COUNT_LADY_CHILD_FECES"));
				temp.setManagementAgency(rs.getString("MANAGE_AGENCY"));
				temp.setPhone(rs.getString("PHONE"));
				temp.setOpenTime(rs.getString("OPEN_TIME"));
				temp.setInstallationDate(rs.getString("INSTALLATION_DATE"));
				temp.setLat(rs.getDouble("LAT"));
				temp.setLon(rs.getDouble("LON"));
				temp.setStdDate(rs.getString("STD_DATE"));
				temp.setPhone2(rs.getString("PHONE2"));
				temp.setRegDate(rs.getString("REG_DATE"));
				temp.setSumReview(rs.getInt("SUM_REVIEW"));
				temp.setCountReview(rs.getInt("COUNT_REVIEW"));

				list.add(temp);
			}

		} catch (SQLException e) {
			System.out.println("Toilet > Dao > getAll");
			e.printStackTrace();
			list.clear();

		} finally {
			close(rs, pstmt, conn);

		}

		return list;
	}

	public ArrayList<City> getCityList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<City> list = new ArrayList<>();

		try {

			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM cities");
			rs = pstmt.executeQuery();

			City temp = null;
			while (rs.next()) {

				temp = new City(rs.getInt("id"));
				temp.setName(rs.getString("name"));
				temp.setRegDate(rs.getString("reg_date"));

				list.add(temp);

			}

		} catch (SQLException e) {
			System.out.println("Toilet > Dao > getCityList");
			e.printStackTrace();

			list.clear();
		} finally {
			close(rs, pstmt, conn);

		}

		return list;

	}

	public ArrayList<Borough> getBoroughList(int city) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Borough> list = new ArrayList<>();

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM boroughs WHERE city_id=?");
			pstmt.setInt(1, city);

			rs = pstmt.executeQuery();

			Borough temp = null;
			while (rs.next()) {
				temp = new Borough(rs.getInt("id"));
				temp.setName(rs.getString("name"));
				temp.setRegDate(rs.getString("reg_date"));

				list.add(temp);
			}

		} catch (SQLException e) {
			System.out.println("Toilet > DAO > getBoroughList");
			e.printStackTrace();

			list.clear();
		} finally {
			close(rs, pstmt, conn);
		}

		return list;
	}

}
