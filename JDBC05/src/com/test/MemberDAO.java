package com.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

public class MemberDAO
{
	
	private Connection conn;
	
	
	// 주요 기능 구성
	// - 데이터베이스 연결 담당 메소드
	public Connection connection()
	{
		conn = DBConn.getConnection();
		
		return conn;
	}
	
	// 데이터 입력
	public int add(MemberDTO dto) throws SQLException
	{
		int result = 0;
		
		Statement stmt = conn.createStatement();
		
		String sql = String.format("INSERT INTO TBL_EMP"
				+ "(EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG)"
				+ " VALUES (EMPSEQ.NEXTVAL, '%s', '%s', TO_DATE('%s', 'YYYY-MM-DD')"
				+ ", (SELECT CITY_ID FROM TBL_CITY WHERE CITY_LOC='%s'), '%s'"
				+ ", (SELECT BUSEO_ID FROM TBL_BUSEO WHERE BUSEO_NAME='%s')"
				+ ", (SELECT JIKWI_ID FROM TBL_JIKWI WHERE JIKWI_NAME='%s'), %d, %d)"
				, dto.getEmpName(), dto.getSsn(), dto.getIbsaDate()
				, dto.getCityLoc(), dto.getTel(), dto.getBuseoName()
				, dto.getJikwiName(), dto.getBasicPay(), dto.getSudang()
				);
		
		result = stmt.executeUpdate(sql);
		stmt.close();
		
		return result;
		
	}
	
	// 전체 멤버 카운트 조회
	public int count() throws SQLException
	{
		int result = 0;
		
		Statement stmt = conn.createStatement();
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_EMP";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		if (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		rs.close();
		stmt.close();
		
		return result;
	}
	
	
	// 검색한 결과 멤버의 카운트 조회
	public int count(String key, String value) throws SQLException
	{
		int result = 0;
		
		Statement stmt = conn.createStatement();
		
		
		String sql= "";
		
		if(key.equals("EMP_ID")) // 얘는 숫자라서
			sql = String.format("SELECT COUNT(*) AS COUNT FROM EMPVIEW WHERE %s = %s", key, value);
		else
			sql = String.format("SELECT COUNT(*) AS COUNT FROM EMPVIEW WHERE %s = '%s'", key, value);
		
		ResultSet rs = stmt.executeQuery(sql);
		
		if (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		rs.close();
		stmt.close();
		
		return result;
	}
	
	// 전체 멤버 리스트 조회 기능(사번/이름/부서/직위/급여 내림차순 정렬)
	// 선택한 것을 받아서 해당 키값을 통해 정렬 시켜 조회
	public ArrayList<MemberDTO> list(String key) throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		Statement stmt = conn.createStatement();
		
		String sql = String.format("SELECT EMP_ID, EMP_NAME, SSN, TO_CHAR(IBSADATE, 'YYYY-MM-DD') AS IBSADATE"
				+ ", CITY_LOC, TEL, BUSEO_NAME, JIKWI_NAME, BASICPAY, SUDANG, PAY"
				+ " FROM EMPVIEW"
				+ " ORDER BY %s", key);
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			MemberDTO dto = new MemberDTO();
			dto.setEmpId(rs.getInt("EMP_ID"));
			dto.setEmpName(rs.getString("EMP_NAME"));
			dto.setSsn(rs.getString("SSN"));
			dto.setIbsaDate(rs.getString("IBSADATE"));
			dto.setCityLoc(rs.getString("CITY_LOC"));
			dto.setTel(rs.getString("TEL"));
			dto.setBuseoName(rs.getString("BUSEO_NAME"));
			dto.setJikwiName(rs.getString("JIKWI_NAME"));
			dto.setBasicPay(rs.getInt("BASICPAY"));
			dto.setSudang(rs.getInt("SUDANG"));
			dto.setPay(rs.getInt("PAY"));
		
			result.add(dto); // 저장
		}
		
		rs.close();
		stmt.close();
		
		return result;
	}
	
	
	
	
	// 직원 검색 출력(사번, 이름, 부서, 직위 검색)
	public ArrayList<MemberDTO> list(String key, String value) throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		Statement stmt = conn.createStatement();
		
		String sql = String.format("SELECT EMP_ID, EMP_NAME, SSN"
				+ ", TO_CHAR(IBSADATE, 'YYYY-MM-DD') AS IBSADATE"
				+ ", CITY_LOC, TEL, BUSEO_NAME, JIKWI_NAME"
				+ ", BASICPAY, SUDANG, PAY"
				+ " FROM EMPVIEW"
				+ " WHERE %s = '%s'", key, value);
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			MemberDTO dto = new MemberDTO();
			dto.setEmpId(rs.getInt("EMP_ID"));
			dto.setEmpName(rs.getString("EMP_NAME"));
			dto.setSsn(rs.getString("SSN"));
			dto.setIbsaDate(rs.getString("IBSADATE"));
			dto.setCityLoc(rs.getString("CITY_LOC"));
			dto.setTel(rs.getString("TEL"));
			dto.setBuseoName(rs.getString("BUSEO_NAME"));
			dto.setJikwiName(rs.getString("JIKWI_NAME"));
			dto.setBasicPay(rs.getInt("BASICPAY"));
			dto.setSudang(rs.getInt("SUDANG"));
			dto.setPay(rs.getInt("PAY"));
		
			result.add(dto); // 저장
		}
		
		rs.close();
		stmt.close();	
		
		return result;
	}
	

	
	// 지역 검색 출력 - 직원 정보 입력 시 표시
	public ArrayList<String> citylist() throws SQLException
	{
		ArrayList<String> result = new ArrayList<String>();
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT CITY_LOC FROM TBL_CITY";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
			result.add(rs.getString("CITY_LOC"));
		
		rs.close();
		stmt.close();
		return result;
	}
	
	
	
	// 부서 검색 출력 - 직원 정보 입력 시 표시
	public ArrayList<String> buseolist() throws SQLException
	{
		ArrayList<String> result = new ArrayList<String>();
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT BUSEO_NAME FROM TBL_BUSEO";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
			result.add(rs.getString("BUSEO_NAME"));
		
		rs.close();
		stmt.close();
		return result;
	}
	
	// 직위 검색 출력 - 직원 정보 입력 시 표시
	public ArrayList<String> jikwilist() throws SQLException
	{
		ArrayList<String> result = new ArrayList<String>();
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT JIKWI_NAME FROM TBL_JIKWI";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
			result.add(rs.getString("JIKWI_NAME"));
		
		rs.close();
		stmt.close();
		return result;
	}
	
	// 직위에 따라 최소 기본급 검색 - 직원 정보 입력 시 표시
	public int basicPayCheck(String jikwiName) throws SQLException
	{
		int result = 0;
		
		Statement stmt = conn.createStatement();
		String sql = String.format("SELECT MIN_BASICPAY FROM TBL_JIKWI WHERE JIKWI_NAME = '%s'", jikwiName);
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			result = rs.getInt("MIN_BASICPAY");
		}
		
		rs.close();
		stmt.close();
		
		return result;
	}
	
	
	
	
	// 직원 정보 수정
	public int modify(MemberDTO dto) throws SQLException
	{
		int result = 0;
		Statement stmt = conn.createStatement();
		
		String sql = String.format("UPDATE TBL_EMP SET"
				+ " EMP_NAME='%s'"
				+ ", SSN = '%s'"
				+ ", IBSADATE=TO_DATE('%s', 'YYYY-MM-DD')"
				+ ", CITY_ID=(SELECT CITY_ID FROM TBL_CITY WHERE CITY_LOC = '%s')"
				+ ", TEL='%s'"
				+ ", BUSEO_ID=(SELECT BUSEO_ID FROM TBL_BUSEO WHERE BUSEO_NAME = '%s')"
				+ ", JIKWI_ID=(SELECT JIKWI_ID FROM TBL_JIKWI WHERE JIKWI_NAME = '%s')"
				+ ", BASICPAY=%d"
				+ ", SUDANG=%d"
				+ " WHERE EMP_ID = %d"
				, dto.getEmpName(), dto.getSsn(), dto.getIbsaDate(), dto.getCityLoc()
				, dto.getTel(), dto.getBuseoName(), dto.getJikwiName(), dto.getBasicPay(), dto.getSudang(), dto.getEmpId());
		
		result = stmt.executeUpdate(sql);
		
		stmt.close();
		
		return result;
	}
	
	
	// 직원 정보 삭제
	public int remove(int empId) throws SQLException
	{
		int result = 0;
		
		Statement stmt = conn.createStatement();
		
		String sql = String.format("DELETE FROM TBL_EMP WHERE EMP_ID=%d", empId);
		result = stmt.executeUpdate(sql);
		
		stmt.close();
		return result;
	}
	

	// 데이터베이스 연결 종료 메소드
	public void close()
	{
		DBConn.close();
	}
	
}
