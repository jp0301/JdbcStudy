package com.test;

import java.util.ArrayList;
import java.util.Scanner;

import com.util.DBConn;

public class ScoreProcess
{

	private ScoreDAO dao;
	
	
	public ScoreProcess()
	{
		dao = new ScoreDAO();
	}
	
	
	//1. 성적 입력 기능
	public void insert()
	{
		try
		{
			dao.connection();
			int count = dao.count();
			
			Scanner sc = new Scanner(System.in);
			
			do
			{
				System.out.printf("%d번 학생 성적 입력(이름 국어 영어 수학) : ", (++count));
				String name = sc.next();
				
				if (name.equals("."))
				{
					break;
				}
				
				int kor = sc.nextInt();
				int eng = sc.nextInt();
				int mat = sc.nextInt();
				
				ScoreDTO dto = new ScoreDTO();
				
				dto.setName(name);
				dto.setKor(kor);
				dto.setEng(eng);
				dto.setMat(mat);
				
				int result = dao.add(dto);
				if (result > 0)
				{
					System.out.println(">> 성적 입력이 완료되었습니다.");
				}
				
				
				
			} while (true);
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}	
	}
	
	//2. 성적 전체 조회
	public void printAll()
	{
		try
		{
			
			dao.connection();
			int count = dao.count();
			
			System.out.println();
			System.out.printf("전체 인원 : %d명\n", count);
			System.out.println("---------------------------------------------------------------");
			System.out.println(" 번호   이름    국어   영어   수학   총점    평균   석차");
			System.out.println("---------------------------------------------------------------");
			
			for(ScoreDTO dto : dao.list())
			{
				System.out.printf("%3s %6s %6d %6d %6d %6d %7.1f %5d\n"
						, dto.getSid(),dto.getName(),dto.getKor(),dto.getEng(),dto.getMat(),dto.getTot(), dto.getAvg(), dto.getRank());
			}
			System.out.println("---------------------------------------------------------------");
			
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	//3. 이름 검색
	public void searchName()
	{
		
		try
		{
			Scanner sc = new Scanner(System.in);
			
			System.out.print("검색할 학생 이름 입력 : ");
			String name = sc.next();
			
			dao.connection();

			ArrayList<ScoreDTO> arraylist = dao.list(name);
			
			if(arraylist.size() > 0)
			{
				System.out.println();
				System.out.println("---------------------------------------------------------------");
				System.out.println(" 번호   이름    국어   영어   수학   총점    평균   석차");
				System.out.println("---------------------------------------------------------------");	
					
				for(ScoreDTO dto : arraylist)
				{
					System.out.printf("%3s %6s %6d %6d %6d %6d %7.1f %5d\n"
							, dto.getSid(),dto.getName(),dto.getKor(),dto.getEng(),dto.getMat(),dto.getTot(), dto.getAvg(), dto.getRank());
				}
				System.out.println("---------------------------------------------------------------");
				
			}
			else
			{
				System.out.println("검색 대상이 없습니다.");
			}
			
			
			dao.close();

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	
	
	
	//4. 성적 수정
	public void update()
	{
		Scanner sc = new Scanner(System.in);
		
		System.out.println();
		System.out.print("수정할 학생번호 입력 : ");
		int sid = sc.nextInt();
		
		try
		{
			dao.connection();
			
			ArrayList<ScoreDTO> arraylist = dao.list(sid);
			
			System.out.println();
			System.out.println("---------------------------------------------------------------");
			System.out.println(" 번호   이름    국어   영어   수학   총점    평균   석차");
			System.out.println("---------------------------------------------------------------");
			
			for(ScoreDTO dto : arraylist)
			{
				System.out.printf("%3s %6s %6d %6d %6d %6d %7.1f %5d\n"
						, dto.getSid(),dto.getName(),dto.getKor(),dto.getEng(),dto.getMat(),dto.getTot(), dto.getAvg(), dto.getRank());
			}
			System.out.println("---------------------------------------------------------------");
			
			System.out.print("수정할 데이터 입력(이름 국어 영어 수학) : ");
			String name = sc.next();
			
			int kor = sc.nextInt();
			int eng = sc.nextInt();
			int mat = sc.nextInt();
			
			ScoreDTO dto = new ScoreDTO();
			
			dto.setName(name);
			dto.setKor(kor);
			dto.setEng(eng);
			dto.setMat(mat);
			dto.setSid(String.valueOf(sid));
			
			
			int result = dao.modify(dto);
			
			if (result > 0)
			{
				System.out.println(">> 성적 수정이 완료되었습니다.");
			}
			else
			{
				System.out.println("수정 대상이 없습니다.");
			}
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
	}
	
	//5. 성적 삭제
	public void delete()
	{
		Scanner sc = new Scanner(System.in);
		
		System.out.println();
		System.out.print("삭제할 학생번호 입력 : ");
		int sid = sc.nextInt();
		
		try
		{
			dao.connection();
			
			ArrayList<ScoreDTO> arraylist = dao.list(sid);
			
			if (arraylist.size() > 0)
			{
				System.out.println();
				System.out.println("---------------------------------------------------------------");
				System.out.println(" 번호   이름    국어   영어   수학   총점    평균   석차");
				System.out.println("---------------------------------------------------------------");
				
				for(ScoreDTO dto : arraylist)
				{
					System.out.printf("%3s %6s %6d %6d %6d %6d %7.1f %5d\n"
							, dto.getSid(),dto.getName(),dto.getKor(),dto.getEng(),dto.getMat(),dto.getTot(), dto.getAvg(), dto.getRank());
				}
				System.out.println("---------------------------------------------------------------");
				
				System.out.print(">> 정말 삭제하시겠습니까?(Y/N) : ");
				String response = sc.next();
				
				
				if(response.equals("Y") || response.contentEquals("y"))
				{
					int result = dao.remove(sid);
					
					if (result > 0)
					{
						System.out.println("삭제가 완료되었습니다.");
					}
				}
				else
				{
					System.out.println("삭제가 취소되었습니다.");
				}
			}
			else
			{
				System.out.println("삭제 대상이 존재하지 않습니다.");
			}
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
	}
	
}
