package work.model.dao;

import work.Util.Util;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by KimDaeil on 2017. 7. 15..
 */
public class FactoryDao {
	private DataSource ds;
	private static volatile FactoryDao instance = new FactoryDao();

	private FactoryDao() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/Oracle");

		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static FactoryDao getInstance() {

		return instance;
	}

	protected Connection getConnection() {
		try {

			return ds.getConnection();

		} catch (SQLException e) {
			System.out.println("BaseDao: getConnection");
			e.printStackTrace();
		}

		return null;
	}

	// Ŭ����
	private void close(Statement stmt, Connection conn) {
		close(null, stmt, conn);

	}

	protected void close(ResultSet rs, Statement stmt, Connection conn) {
		try {
			if (!Util.isNull(rs)) {
				if (!rs.isClosed()) {
					rs.close();
				}

				rs = null;
			}

			if (!Util.isNull(stmt)) {
				if (!stmt.isClosed()) {
					stmt.close();
				}

				stmt = null;
			}

			if (!Util.isNull(conn)) {
				if (!conn.isClosed()) {
					conn.close();
				}

				conn = null;
			}

		} catch (SQLException e) {
			System.out.println("error: close()");
			e.printStackTrace();
		}

	}

	protected void close(ResultSet rs, Connection conn, Statement... stmt) {
		try {
			if (!Util.isNull(rs)) {
				if (!rs.isClosed()) {
					rs.close();
				}

				rs = null;
			}

			Statement temp = null;
			for (int i = 0; i < stmt.length; i++) {
				temp = stmt[i];
				
				if (!Util.isNull(temp)) {
					if (!temp.isClosed()) {
						temp.close();
					}

					temp = null;
				}
			}

			if (!Util.isNull(conn)) {
				if (!conn.isClosed()) {
					conn.close();
				}

				conn = null;
			}

		} catch (SQLException e) {
			System.out.println("error: close(ResultSet, Connection, Statement...)");
			e.printStackTrace();
		}

	}

}
