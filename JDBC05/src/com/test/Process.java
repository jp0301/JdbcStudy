package com.test;

import java.util.ArrayList;
import java.util.Scanner;

public class Process
{

	private MemberDAO dao;
	
	public Process()
	{
		dao = new MemberDAO();
	}
	
	// 1. 직원 정보 입력
	public void insert()
	{
		Scanner sc = new Scanner(System.in);
		
		try
		{
			// db연결
			dao.connection();
			
			
			// 지역, 부서, 직위 리스트 가져오기
			// 지역
			ArrayList<String> citylist = dao.citylist();
			// String 객체를 더하는 방식은 별로. 기존의 데이터에 더하는 방식
			StringBuilder citylistStr = new StringBuilder();
			for(String city : citylist)
			{
				citylistStr.append(city + "/");
			}
			// 부서
			ArrayList<String> buseolist = dao.buseolist();
			// String 객체를 더하는 방식은 별로. 기존의 데이터에 더하는 방식
			StringBuilder buseolistStr = new StringBuilder();
			for(String buseo : buseolist)
			{
				buseolistStr.append(buseo + "/");
			}
			
			// 직위
			ArrayList<String> jikwilist = dao.jikwilist();
			// String 객체를 더하는 방식은 별로. 기존의 데이터에 더하는 방식
			StringBuilder jikwilistStr = new StringBuilder();
			for(String jikwi : jikwilist)
			{
				jikwilistStr.append(jikwi + "/");
			}
			
			
			
			/*
			 *    직원 정보 입력 ---------------------------------------------------
			 *    이름 : 고연수
			 *    주민등록번호(yymmdd-nnnnnnn) : 940925-2234567
			 *    입사일(yyyy-mm-dd) : 2015-05-06
			 *    지역(강원/경기/경남/경북/부산/서울/인천/전남/전북/제주/충남/) : 서울  
			 *    --지역(강원/경기/경남/경북/부산/) : 지역을 담고있는 테이블 리스트를 가지고와서...
			 *    전화번호 : 010-1234-1234
			 *    부서(개발부/기획부/영업부/인사부/자재부/총무부/홍보부/) : 개발부
			 *    직위(사장/전무/상무/이사/부장/찾장/과장/대리/사원/) : 대리
			 *    기본급(최소 1250000 이상) : 1300000
			 *    수당 : 1000000
			 *    >> 직원 정보 입력 완료~!!!
			 *    ------------------------------------------------------------------
			 */
			
			System.out.println();
			System.out.println("직원 정보 입력 ---------------------------------------------------");
			
			System.out.printf("이름 : ");
			String empName = sc.next();
			System.out.printf("주민등록번호(yymmdd-nnnnnnn) : ");
			String ssn = sc.next();
			System.out.printf("입사일(yyyy-mm-dd) : ");
			String ibsaDate = sc.next();
			System.out.printf("지역(%s) : ", citylistStr.toString());
			String cityLoc = sc.next();
			System.out.printf("전화번호 : ");
			String tel = sc.next();
			System.out.printf("부서(%s) : ", buseolistStr.toString());
			String buseoName = sc.next();
			System.out.printf("직위(%s) : ", jikwilistStr.toString());
			String jikwiName = sc.next();
			System.out.printf("기본급(최소 %d 이상) : ", dao.basicPayCheck(jikwiName));
			int basicPay = sc.nextInt();
			System.out.printf("수당 : ");
			int sudang = sc.nextInt();
			
			MemberDTO dto = new MemberDTO();
			
			dto.setEmpName(empName);
			dto.setSsn(ssn);
			dto.setIbsaDate(ibsaDate);
			dto.setCityLoc(cityLoc);
			dto.setTel(tel);
			dto.setBuseoName(buseoName);
			dto.setJikwiName(jikwiName);
			dto.setBasicPay(basicPay);
			dto.setSudang(sudang);
			
			int result = dao.add(dto);
			if(result > 0)
				System.out.println("\n>> 직원 정보 입력 완료~!!!");
			
			System.out.println("------------------------------------------------------------------");
			System.out.println();
			
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
	}
	
	// 2. 직원 전체 출력
	public void allSelect()
	{
		Scanner sc = new Scanner(System.in);
		
		System.out.println();
		System.out.println("1. 사번 정렬");
		System.out.println("2. 이름 정렬");
		System.out.println("3. 부서 정렬");
		System.out.println("4. 직위 정렬");
		System.out.println("5. 급여 내림차순 정렬");
		System.out.println();
		System.out.printf(">> 항목 선택(1~5, -1 종료) : ");
		String menus = sc.next();
		
		try
		{
			//연결
			dao.connection();
			
			int menu = Integer.parseInt(menus);
			
			if(menu == -1)
				return;
			
			String key="";
			
			switch(menu)
			{
				case 1:
					key = "EMP_ID";
					break;
				case 2:
					key = "EMP_NAME";
					break;
				case 3:
					key = "BUSEO_NAME";
					break;
				case 4:
					key = "JIKWI_NAME";
					break;
				case 5:
					key = "PAY DESC";
					break;
			}
			
			
			System.out.println();
			System.out.printf("전체 인원 : %d명\n", dao.count());
			System.out.println("------------------------------------------------------------------------------------------");
			System.out.println("사번   이름   주민번호       입사일     지역   전화번호      부서   직위   기본급   수당");
			System.out.println("------------------------------------------------------------------------------------------");
			ArrayList<MemberDTO> arraylist = dao.list(key);
			for(MemberDTO dto : arraylist)
			{
				System.out.printf("%d %5s %s %s %2s %15s %s %s %8d %8d\n"
						, dto.getEmpId(), dto.getEmpName(), dto.getSsn(), dto.getIbsaDate()
						, dto.getCityLoc(), dto.getTel(), dto.getBuseoName(), dto.getJikwiName()
						, dto.getBasicPay(), dto.getSudang());
			}
			System.out.println("------------------------------------------------------------------------------------------");
			System.out.println();
			
			
			
			dao.close();
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
	}
	
	
	//3. 직원 검색 출력
	public void search()
	{
		Scanner sc = new Scanner(System.in);
		
		System.out.println();
		System.out.println("1. 사번 검색");
		System.out.println("2. 이름 검색");
		System.out.println("3. 부서 검색");
		System.out.println("4. 직위 검색");
		System.out.println();
		System.out.printf(">> 항목 선택(1~4, -1 종료) : ");
		String menus = sc.next();
		
		
		try
		{
			dao.connection();
			
			int menu = Integer.parseInt(menus);
			if(menu == -1)
				return;
			
			String key = "";
			String value = "";
			
			switch (menu)
			{
				case 1:
					key = "EMP_ID";
					System.out.printf("검색할 사원번호 : ");
					value = sc.next();
					break;
	
				case 2:
					key = "EMP_NAME";
					System.out.printf("검색할 사원명 : ");
					value = sc.next();
					break;
			
				case 3:
					key = "BUSEO_NAME";
					System.out.printf("검색할 부서명 : ");
					value = sc.next();
					break;
	
			
				case 4:
					key = "JIKWI_NAME";
					System.out.printf("검색할 직위명 : ");
					value = sc.next();
					break;
			}
			
			//직원 검색 결과 출력
			System.out.println();
			System.out.printf("전체 인원 : %d명\n", dao.count(key, value));
			System.out.println("------------------------------------------------------------------------------------------");
			System.out.println("사번   이름   주민번호       입사일     지역   전화번호      부서   직위   기본급   수당");
			System.out.println("------------------------------------------------------------------------------------------");
			ArrayList<MemberDTO> searchlist = dao.list(key, value);
			for(MemberDTO dto : searchlist)
			{
				System.out.printf("%d %5s %s %s %2s %15s %s %s %8d %8d\n"
						, dto.getEmpId(), dto.getEmpName(), dto.getSsn(), dto.getIbsaDate()
						, dto.getCityLoc(), dto.getTel(), dto.getBuseoName(), dto.getJikwiName()
						, dto.getBasicPay(), dto.getSudang());
			}
			System.out.println("------------------------------------------------------------------------------------------");
			System.out.println();
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
	}
	
	
	//4. 직원 정보 수정
	public void update()
	{
		Scanner sc = new Scanner(System.in);
		
		try
		{
			dao.connection();
			
			System.out.printf("수정할 사원의 사원번호 입력 : ");
			String value = sc.next();
			
			ArrayList<MemberDTO> arraylist = dao.list("EMP_ID", value);
			
			
			if (arraylist.size() > 0)
			{
				
				for(MemberDTO dto : arraylist)
				{
					System.out.println();
					System.out.println("수정할 사원 정보 ---------------------------------------------------");
					System.out.printf("이름 : %s\n", dto.getEmpName());
					System.out.printf("주민등록번호(yymmdd-nnnnnnn) : %s\n", dto.getSsn());
					System.out.printf("입사일(yyyy-mm-dd) : %s\n",dto.getIbsaDate());
					System.out.printf("지역 : %s\n",dto.getCityLoc());
					System.out.printf("전화번호 : %s\n",dto.getTel());
					System.out.printf("부서 : %s\n",dto.getBuseoName());
					System.out.printf("직위 : %s\n", dto.getJikwiName());
					System.out.printf("기본급 : %d\n",dto.getBasicPay());
					System.out.printf("수당 : %d\n",dto.getSudang());
					System.out.println("--------------------------------------------------------------------");
				}
				
				
				// 지역, 부서, 직위 리스트 가져오기
				// 지역
				ArrayList<String> citylist = dao.citylist();
				StringBuilder citylistStr = new StringBuilder();
				for(String city : citylist)
					citylistStr.append(city + "/");
				// 부서
				ArrayList<String> buseolist = dao.buseolist();
				StringBuilder buseolistStr = new StringBuilder();
				for(String buseo : buseolist)
					buseolistStr.append(buseo + "/");
				
				// 직위
				ArrayList<String> jikwilist = dao.jikwilist();
				StringBuilder jikwilistStr = new StringBuilder();
				for(String jikwi : jikwilist)
					jikwilistStr.append(jikwi + "/");

				
				System.out.println();
				System.out.println("해당 사원 수정 ---------------------------------------------------");
				
				System.out.printf("이름 : ");
				String empName = sc.next();
				System.out.printf("주민등록번호(yymmdd-nnnnnnn) : ");
				String ssn = sc.next();
				System.out.printf("입사일(yyyy-mm-dd) : ");
				String ibsaDate = sc.next();
				System.out.printf("지역(%s) : ", citylistStr.toString());
				String cityLoc = sc.next();
				System.out.print("전화번호 : ");
				String tel = sc.next();
				System.out.printf("부서(%s) : ", buseolistStr.toString());
				String buseoName = sc.next();
				System.out.printf("직위(%s) : ", jikwilistStr.toString());
				String jikwiName = sc.next();
				System.out.printf("기본급(최소 %d 이상) : ", dao.basicPayCheck(jikwiName));
				int basicPay = sc.nextInt();
				System.out.printf("수당 : ");
				int sudang = sc.nextInt();
				
				MemberDTO dto = new MemberDTO();
				
				dto.setEmpName(empName);
				dto.setSsn(ssn);
				dto.setIbsaDate(ibsaDate);
				dto.setCityLoc(cityLoc);
				dto.setTel(tel);
				dto.setBuseoName(buseoName);
				dto.setJikwiName(jikwiName);
				dto.setBasicPay(basicPay);
				dto.setSudang(sudang);
				
				int temp = Integer.parseInt(value);
				dto.setEmpId(temp);
				
				int result = dao.modify(dto);
				
				if(result > 0)
					System.out.println(">> 수정이 완료되었습니다~!!!");
				System.out.println("---------------------------------------------------------------------");
				System.out.println();
			}
			else
			{
				System.out.println("해당 사원은 없습니다.");
			}
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	
	//5. 직원 정보 삭제
	public void delete()
	{
		try
		{
			Scanner sc = new Scanner(System.in);
			
			System.out.printf("삭제할 사원의 사원번호 입력 : ");
			String value = sc.next();
			
			dao.connection();
			
			ArrayList<MemberDTO> arraylist = dao.list("EMP_ID", value);
			
			if (arraylist.size() > 0)
			{
				System.out.println();
				for(MemberDTO dto : arraylist)
				{
					System.out.println();
					System.out.println("삭제할 사원 정보 ---------------------------------------------------");
					System.out.printf("이름 : %s\n", dto.getEmpName());
					System.out.printf("주민등록번호(yymmdd-nnnnnnn) : %s\n", dto.getSsn());
					System.out.printf("입사일(yyyy-mm-dd) : %s\n",dto.getIbsaDate());
					System.out.printf("지역 : %s\n",dto.getCityLoc());
					System.out.printf("전화번호 : %s\n",dto.getTel());
					System.out.printf("부서 : %s\n",dto.getBuseoName());
					System.out.printf("직위 : %s\n", dto.getJikwiName());
					System.out.printf("기본급 : %d\n",dto.getBasicPay());
					System.out.printf("수당 : %d\n",dto.getSudang());
					System.out.println("--------------------------------------------------------------------");
				}
				System.out.print("정말 삭제하시겠습니까?(Y/N) : ");
				String response = sc.next();
				
				if (response.equals("Y") || response.equals("y"))
				{
					int result = dao.remove(Integer.parseInt(value));
					if(result > 0)
						System.out.println("사원 정보가 정상 삭제되었습니다.");
				}
				else
				{
					System.out.println("취소되었습니다.");
				}
			}
			else
			{
				System.out.println("해당 사원은 없습니다.");
			}

			System.out.println();
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
	}
	
	
	
	
}
