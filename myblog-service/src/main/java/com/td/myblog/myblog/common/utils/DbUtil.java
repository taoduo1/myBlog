package com.td.myblog.myblog.common.utils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public final class DbUtil {

	// 字符串常量
	public interface SQL_STR {
		String	SELECT				= "SELECT";
		String	FROM				= "FROM";
		String	WHERE				= "WHERE";
		String	NULL				= "null";
		String	ZERO_LENGTH			= "";
		String	IN					= " IN ";
		String	ORDER_BY			= " ORDER BY ";
		String	TWO_SINGLE_QUOTAS	= "''";
		String	AND					= " AND ";
	}

	// 字符常量
	public interface SQL_CHR {
		String	SINGLE_QUOTA	= "'";
		String	CLOSE_PAREN		= ")";
		String	OPEN_PAREN		= "(";
		String	BLANK			= " ";
		String	EQUAL			= "=";
	}

	private static final Logger LOGGER = LoggerFactory.getLogger(DbUtil.class);

	private DbUtil() {}

	/**
	 * 执行SQL
	 * 
	 * @param sql
	 * @param statement
	 * @throws SQLException
	 */
	public static void tryToRunSql(String sql, Statement statement) throws SQLException {
		LOGGER.info("执行SQL:{}", sql);
		if (sql.toUpperCase().startsWith(SQL_STR.SELECT)) {
			ResultSet resultSet = statement.executeQuery(sql);
			release(resultSet);
		} else {
			int n = statement.executeUpdate(sql);
			LOGGER.info("影响的行数：{}", n);
		}
	}

	/**
	 * 执行SQL查询
	 * 
	 * @param sql
	 * @param statement
	 * @throws SQLException
	 */
	public static String tryToRunSqlToString(String sql, Statement statement) throws SQLException {
		LOGGER.info("执行SQL:{}", sql);
		String string = null;
		if (sql.toUpperCase().startsWith(SQL_STR.SELECT)) {
			ResultSet resultSet = statement.executeQuery(sql);
			if (resultSet.next()) string = resultSet.getString(1);
			release(resultSet);
		} else {
			LOGGER.error("期望查询语句，但传入了更新语句：{}", sql);
			int n = statement.executeUpdate(sql);
			LOGGER.info("影响的行数：{}", n);
		}
		return string;
	}

	/**
	 * 执行SQL查询
	 * 
	 * @param sql
	 * @param statement
	 * @throws SQLException
	 */
	public static List<String> tryToRunSqlToListString(String sql, Statement statement) throws SQLException {
		LOGGER.info("执行SQL:{}", sql);
		List<String> list = new ArrayList<>();
		if (sql.toUpperCase().startsWith(SQL_STR.SELECT)) {
			ResultSet resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				list.add(resultSet.getString(1));
			}
			release(resultSet);
		} else {
			LOGGER.error("期望查询语句，但传入了更新语句：{}", sql);
			int n = statement.executeUpdate(sql);
			LOGGER.info("影响的行数：{}", n);
		}
		return list;
	}

	/**
	 * 关闭 rs
	 * @param resultset
	 */
	public static void release(ResultSet resultset) {
		if (resultset != null) {
			try {
				resultset.close();
			} catch (SQLException e) {
				LOGGER.error("", e);
			}
		}
	}

	/**
	 * 关闭 Statement 和 Connection
	 * @param statement
	 * @param conn
	 */
	public static void release(Statement statement) {
		if (statement != null) {
			try {
				statement.close();
			} catch (SQLException e) {
				LOGGER.error("", e);
			}
		}

	}

	/**
	 * 关闭 Statement 和 Connection
	 * @param statement
	 * @param connection
	 */
	public static void release(Connection connection) {

		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				LOGGER.error("", e);
			}
		}
	}

	/**
	 * 退回connection
	 * @param connection
	 */
	public static void rollback(Connection connection) {
		try {
			if (connection != null) connection.rollback();
		} catch (SQLException e) {
			LOGGER.error("", e);
		}
	}

	public static String toSqlValue(Object object) {
		return object == null ? SQL_STR.NULL : (SQL_CHR.SINGLE_QUOTA + StringUtils.replaceChars(DataUtil.toString(object), SQL_CHR.SINGLE_QUOTA, SQL_STR.TWO_SINGLE_QUOTAS) + SQL_CHR.SINGLE_QUOTA);
	}

}
