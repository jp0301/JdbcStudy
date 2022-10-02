/* =============================
 *  MemberMain.java
================================*/

/*
 * ○ 직원 관리 프로그램을 구현한다.
 * 	  - 데이터베이스 연동 프로그램을 구현한다.
 *    - MemberDTO, MemberDAO 를 활용한다.
 *    - 메뉴 구성 및 기능을 구현한다. → Process 활용
 *    
 *    
 *    실행 예)
 *    
 *    =======[직원 관리]=======
 *    1. 직원 정보 입력
 *    2. 직원 전체 출력
 *        - 사번 정렬
 *        - 이름 정렬
 *        - 부서 정렬
 *        - 직위 정렬
 *        - 급여 내림차순 정렬
 *    3. 직원 검색 출력
 *        - 사번 검색
 *        - 이름 검색
 *        - 부서 검색
 *        - 직위 검색
 *    4. 직원 정보 수정
 *    5. 직원 정보 삭제
 *    =========================
 *    >> 메뉴 선택(1~5, -1 종료) : 	1
 *    
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
 *    
 *    =======[직원 관리]=======
 *    1. 직원 정보 입력
 *    2. 직원 전체 출력
 *        - 사번 정렬
 *        - 이름 정렬
 *        - 부서 정렬
 *        - 직위 정렬
 *        - 급여 내림차순 정렬
 *    3. 직원 검색 출력
 *        - 사번 검색
 *        - 이름 검색
 *        - 부서 검색
 *        - 직위 검색
 *    4. 직원 정보 수정
 *    5. 직원 정보 삭제
 *    =========================
 *    >> 메뉴 선택(1~5, -1 종료) : 	2
 *     
 *    1. 사번 정렬
 *    2. 이름 정렬
 *    3. 부서 정렬
 *    4. 직위 정렬
 *    5. 급여 내림차순 정렬
 *    >> 선택(1~5, -1 종료) : 1
 *    
 *    전체 인원 : xx명
 *    사번 이름 주민번호 입사일 지역 전화번호 부서 직위 기본급 수당
 *    ...
 *    
 * */

package com.test;

import java.util.Scanner;

public class MemberMain
{
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		Process prc = new Process();
		
		do
		{
			System.out.println("=======[직원 관리]=======    ");
			System.out.println("1. 직원 정보 입력              ");
			System.out.println("2. 직원 전체 출력              ");
			System.out.println("3. 직원 검색 출력              ");
			System.out.println("4. 직원 정보 수정              ");
			System.out.println("5. 직원 정보 삭제              ");
			System.out.println("=========================");
			System.out.print(">> 메뉴 선택(1~5, -1 종료) : ");
			
			String menus = sc.next();
			
			try
			{
				int menu = Integer.parseInt(menus);
				
				if(menu == -1)
						break;
				
				switch (menu)
				{
					case 1:
						//직원 정보 입력
						prc.insert();
						break;
					
					case 2:
						// 직원 전체 출력
						prc.allSelect();
						break;
						
					case 3:
						// 직원 검색 기능
						prc.search();
						break;
						
					case 4:
						// 직원 정보 수정 기능
						prc.update();
						break;
						
					case 5:
						// 직원 정보 삭제 기능
						prc.delete();
						break;
				}
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		while (true);
		
		System.out.println();
		System.out.println("프로그램이 종료되었습니다.");
             
	}                                  
}                                  
             