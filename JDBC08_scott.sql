SELECT USER
FROM DUAL;
--==>> SCOTT


--○ 
SELECT *
FROM TBL_MEMBER
ORDER BY SID;
/*
1	조영관	010-2222-2222
2	박원석	010-3333-3333
3	최동현	010-4444-4444
4	최나윤	010-5555-5555
5	정영준	010-6666-6666
7	임시연	010-7777-7777
8	홍길동	010-8888-8888
9	고길동	010-9999-9999
*/


DESC TBL_MEMBER;
/*
이름   널?       유형           
---- -------- ------------ 
SID  NOT NULL NUMBER       
NAME          VARCHAR2(30) 
TEL           VARCHAR2(60)
*/


--○ CallableStatement 실습을 위한 프로시저 생성(작성)
--   프로시저 명 : PRC_MEMBERINSERT
--   프로시저 기능 : TBL_MEMBER 테이블에 데이터를 입력하는 INSERT 프로시저
CREATE OR REPLACE PROCEDURE PRC_MEMBERINSERT
( VSID   IN TBL_MEMBER.SID%TYPE
, VNAME  IN TBL_MEMBER.NAME%TYPE
, VTEL   IN TBL_MEMBER.TEL%TYPE
)
IS 
BEGIN
    -- 데이터 입력 쿼리문 구성
    INSERT INTO TBL_MEMBER(SID, NAME, TEL)
    VALUES(VSID, VNAME, VTEL);
    
    -- 커밋
    COMMIT;
END;
--==>> Procedure PRC_MEMBERINSERT이(가) 컴파일되었습니다.



--○ Test001.java 실행 후 확인
SELECT *
FROM TBL_MEMBER
ORDER BY SID;
/*
1	조영관	010-2222-2222
2	박원석	010-3333-3333
3	최동현	010-4444-4444
4	최나윤	010-5555-5555
5	정영준	010-6666-6666
7	임시연	010-7777-7777
8	홍길동	010-8888-8888
9	고길동	010-9999-9999
10	박효신	010-1010-1010 <<< 제대로 입력들어감
*/


--○ CallabaleStatement 실습을 위한 프로시저 생성(작성)
-- 프로시저 명 : PRC_MEMBERSELECT
-- 프로시저 기능: TBL_MEMBER 테이블의 데이터를 읽어오는 SELECT 프로시저
-- ※ SYS_REFCURSOR 자료형을 이용하여 커서 다루기
CREATE OR REPLACE PROCEDURE PRC_MEMBERSELECT
( VRESULT   OUT SYS_REFCURSOR
)
IS
BEGIN

    OPEN VRESULT FOR
    SELECT SID, NAME, TEL
    FROM TBL_MEMBER
    ORDER BY SID;
    --CLOSE VRESULT;
END;
--==>> Procedure PRC_MEMBERSELECT이(가) 컴파일되었습니다.











