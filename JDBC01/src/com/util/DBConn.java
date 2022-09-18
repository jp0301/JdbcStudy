package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn
{
 private static Connection dbConn;
 
 public static Connection getConnection()
 {
    if (dbConn == null)
    {
       try
       {
          //String url = "jdbc:oracle:thin:@211.238.142.58:1521:xe";
    	   // 학원컴에 문제가 있는건지 일단은 집컴으로 연결해서 scott 계정만들고
    	   // 일단 연결시켜봄. 결과는 성공.
          String url = "jdbc:oracle:thin:@localhost:1521:xe";
          String user = "scott";
                String pwd = "tiger";
                
                Class.forName("oracle.jdbc.driver.OracleDriver");
                dbConn = DriverManager.getConnection(url, user, pwd);
          
       } catch (Exception e) {
          System.out.println(e.toString());
       }
    }
    
    return dbConn;
 }
 
 public static Connection getConnection(String url, String user, String pwd)
 {
    if (dbConn == null)
    {
       try
       {
          Class.forName("oracle.jdbc.driver.OracleDriver");
          dbConn = DriverManager.getConnection(url, user, pwd);
       } catch (Exception e) {
          System.out.println(e.toString());
       }
    }
    
    return dbConn;
 }
 
 
 public static void close()
 {
    if (dbConn != null)
    {
       try
       {
          if(!dbConn.isClosed())
          {
             dbConn.close();
          }
       }
       catch (Exception e) {
          System.out.println(e.toString());
       }
    }
    
    dbConn = null;
 }
 
 
 
}



