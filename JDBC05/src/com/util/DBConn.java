package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn
{
	private static Connection conn;
	
	public static Connection getConnection()
	{
		if (conn == null)
		{
			try
			{
				//String url = "jdbc:oracle:thin:@211.238.142.58:1521:xe";
				String url = "jdbc:oracle:thin:@localhost:1521:xe";
				//String user = "scott";
				String user = "pwshome";
				//String pwd = "tiger";
				String pwd = "jp0301";

				
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
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pwd);
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return conn;
	}
	
	
	public static void close()
	{
		if (conn != null)
		{
			try
			{
				if (!conn.isClosed())
				{
					conn.close();
				}
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		conn = null;
	}
	
}
