/*=========================
   ScoreDAO.java
========================== */

package com.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

public class ScoreDAO
{
	// 주요 속성 구성
	// 연결 객체
	private Connection conn;

	// 주요 기능 구성
	// - 데이터베이스 연결 담당 메소드
	public Connection connection()
	{
		conn = DBConn.getConnection();

		return conn;
	}

	// - 데이버 입력 담당 메소드
	public int add(ScoreDTO dto) throws SQLException
	{
		int result = 0;

		Statement stmt = conn.createStatement();

		String sql = String.format(
				"INSERT INTO" + " TBL_SCORE(SID,NAME,KOR,ENG, MAT)" + " VALUES(SCORESEQ.NEXTVAL, '%s', %d, %d, %d)",
				dto.getName(), dto.getKor(), dto.getEng(), dto.getMat());

		result = stmt.executeUpdate(sql);
		stmt.close();

		return result;
	}

	// - 전체 리스트 출력 담당 메소드
	public ArrayList<ScoreDTO> list() throws SQLException
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT SID, NAME, KOR, ENG, MAT"
				+ ", (KOR + ENG + MAT) AS TOT"
				+ ", (KOR + ENG + MAT) / 3 AS AVG"
				+ ", RANK() OVER(ORDER BY (KOR + ENG + MAT) DESC) AS RANK"
				+ " FROM TBL_SCORE"
				+ " ORDER BY SID ASC"; 
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			ScoreDTO dto = new ScoreDTO();

			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getInt("KOR"));
			dto.setEng(rs.getInt("ENG"));
			dto.setMat(rs.getInt("MAT"));
			dto.setTot(rs.getInt("TOT"));
			dto.setAvg(rs.getDouble("AVG"));
			dto.setRank(rs.getInt("RANK"));
			
			result.add(dto);
		}
		
		rs.close();
		stmt.close();
		
		return result;
	}
	// 컨트롤 + 방향키 하면 화면 이동 가능
	
	// - 인원 수 확인 담당 메소드
	public int count() throws SQLException
	{
		int result = 0;
		
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_SCORE";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())					// if(rs.next())
			result = rs.getInt("COUNT");
		
		rs.close();
		stmt.close();
		
		return result;
	}
	
	
	// - 이름 검색 담당 메소드
	public ArrayList<ScoreDTO> list(String name) throws SQLException
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		
		Statement stmt = conn.createStatement();
		String sql = String.format("SELECT SID, NAME, KOR, ENG, MAT, TOT, AVG"
				+ ", RANK FROM( SELECT SID, NAME, KOR, ENG, MAT,(KOR + ENG + MAT) AS TOT"
				+ ", (KOR + ENG + MAT) / 3 AS AVG"
				+ ", RANK() OVER(ORDER BY (KOR + ENG + MAT) DESC) AS RANK FROM TBL_SCORE )"
				+ " WHERE NAME LIKE '%%%s%%'", name);
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			ScoreDTO dto = new ScoreDTO();
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getInt("KOR"));
			dto.setEng(rs.getInt("ENG"));
			dto.setMat(rs.getInt("MAT"));
			dto.setTot(rs.getInt("TOT"));
			dto.setAvg(rs.getDouble("AVG"));
			dto.setRank(rs.getInt("RANK"));
			
			result.add(dto);
		}
	
		rs.close();
		stmt.close();
		
		return result;
	}
	
	
	// - 번호 검색 담당 메소드
	public ArrayList<ScoreDTO> list(int sid) throws SQLException
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		
		Statement stmt = conn.createStatement();
		String sql = String.format("SELECT SID, NAME, KOR, ENG, MAT, TOT, AVG"
				+ ", RANK FROM( SELECT SID, NAME, KOR, ENG, MAT,(KOR + ENG + MAT) AS TOT"
				+ ", (KOR + ENG + MAT) / 3 AS AVG"
				+ ", RANK() OVER(ORDER BY (KOR + ENG + MAT) DESC) AS RANK FROM TBL_SCORE )"
				+ " WHERE SID = %d", sid);
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())				// if(rs.next())
		{
			ScoreDTO dto = new ScoreDTO();
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getInt("KOR"));
			dto.setEng(rs.getInt("ENG"));
			dto.setMat(rs.getInt("MAT"));
			dto.setTot(rs.getInt("TOT"));
			dto.setAvg(rs.getDouble("AVG"));
			dto.setRank(rs.getInt("RANK"));
			
			result.add(dto);
		}
	
		rs.close();
		stmt.close();
		
		return result;		
	}
	
	
	
	// - 데이터 수정 담당 메소드
	public int modify(ScoreDTO dto) throws SQLException
	{
		int result = 0;
		
		Statement stmt = conn.createStatement();
		
		String sql = String.format("UPDATE TBL_SCORE"
				+ " SET NAME='%s', KOR=%d, ENG=%d, MAT=%d"
				+ " WHERE SID=%s"
				, dto.getName(), dto.getKor(), dto.getEng(), dto.getMat(), dto.getSid());
		
		result = stmt.executeUpdate(sql);
		
		stmt.close();	
		
		return result;
	}
	
	
	
	// - 성적 삭제 담당 메소드
	public int remove(int sid) throws SQLException
	{
		int result = 0;
		
		Statement stmt = conn.createStatement();
		String sql = String.format("DELETE FROM TBL_SCORE WHERE SID = %d", sid);
		result = stmt.executeUpdate(sql);
		
		stmt.close();
		
		return result;
	}
	
	
	public void close() throws SQLException
	{
		DBConn.close();
	}
		
	
}