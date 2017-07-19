package work.model.dao;

import java.sql.*;

/**
 * Created by KimDaeil on 2017. 7. 15..
 */
public class BaseDao {

	protected Connection getConnection() {
		return FactoryDao.getInstance().getConnection();
	}

	protected void close(ResultSet rs, Statement stmt, Connection conn) {
		FactoryDao.getInstance().close(rs, stmt, conn);
	}

	protected void close(ResultSet rs, Connection conn, Statement... stmt) {
		FactoryDao.getInstance().close(rs, conn, stmt);
	}

}
