/*=========================
 *  DBConn.java
 *  - try ~ catch
 ==========================*/

package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn
{
	private static Connection conn;

	public static Connection getConnection()
	{
		
		if (conn == null)
		{
			try
			{
				String url = "jdbc:oracle:thin:@211.238.142.58:1521:xe";
				String user = "scott";
				String pwd = "tiger";

				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection(url, user, pwd);

			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		return conn;
	}

	
	public static Connection getConnection(String url, String user, String pwd)
			throws ClassNotFoundException, SQLException
	{
		if (conn == null)
		{
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection(url, user, pwd);

			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}

		return conn;
	}

	public static void close() throws SQLException
	{
		if (conn != null)
		{
				if (!conn.isClosed())
				{
					conn.close();
				}

		}
		conn=null;

	}

}