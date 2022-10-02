/*====================================================
 * Test002.java
 * - CallbaleStatement 를 활용한 SQL 구문 전송 실습2
 =====================================================*/


package com.test;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

import com.util.DBConn;

import oracle.jdbc.OracleTypes;

public class Test002
{
	public static void main(String[] args)
	{
		try
		{
			Connection conn = DBConn.getConnection();
			
			
			if (conn != null)
			{
				System.out.println(">> 데이터베이스 연결 성공~!!!");
				
				try
				{
					String sql = "{call PRC_MEMBERSELECT(?)}";
					CallableStatement cstmt = conn.prepareCall(sql);
					
					// check~!!!
					// 프로시저 내부에서 SYS_REFCURSOR 를 사용하고 있기 때문에
					// OracleTypes.CURSOR 를 사용하기 위한 등록 과정이 필요한 상황
					
					
					// 1. 프로젝트명을 마우스 우클릭 → Build Path → Configure Build Path...
					//    > 대화창 호출
					// 2. Tab에 Libraries 클릭 >  add External JAR file
					//    > 『ojdbc6.jar』 파일 추가 등록
					// 3. import oracle.jdbc.OracleTypes; 구문 추가
					
					cstmt.registerOutParameter(1, OracleTypes.CURSOR); // check~!!!
					cstmt.execute(); // check~!!!
					ResultSet rs = (ResultSet)cstmt.getObject(1); // check~!!!
					
					while (rs.next())
					{
						String sid = rs.getString("SID");
						String name = rs.getString("NAME");
						String tel = rs.getString("TEL");
						
						String str = String.format("%3s %7s %12s", sid, name, tel);
						
						System.out.println(str);
					}
					
					rs.close();
					cstmt.close();
					
				} catch (Exception e)
				{
					System.out.println(e.toString());
				}
			}
			
			DBConn.close();
			System.out.println("\n>> 데이터베이스 연결 닫힘~!!!");
			System.out.println(">> 프로그램 종료됨~!!!");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	} // end main()
}// end class Test002





/*
>> 데이터베이스 연결 성공~!!!
  1     조영관 010-2222-2222
  2     박원석 010-3333-3333
  3     최동현 010-4444-4444
  4     최나윤 010-5555-5555
  5     정영준 010-6666-6666
  7     임시연 010-7777-7777
  8     홍길동 010-8888-8888
  9     고길동 010-9999-9999
 10     박효신 010-1010-1010

>> 데이터베이스 연결 닫힘~!!!
>> 프로그램 종료됨~!!!
*/










