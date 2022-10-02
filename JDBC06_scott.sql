SELECT USER
FROM DUAL;
--==>> SCOTT


--○ 확인
SELECT *
FROM TBL_MEMBER;

create sequence MEMBERSEQ
NOCACHE;


--○ 입력 쿼리문
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '정영준', '010-6666-6666')
;


COMMIT;

-- Test001.java 실행 후 확인
select *
from tbl_member;
/*
1	김인교	010-1111-1111
2	민찬우	010-2222-2222
3	최나윤	010-3333-3333
4	조현하	010-4444-4444
5	김유림	010-5555-5555
6	정영준	010-6666-6666
7	임시연	010-7777-7777
*/


--○ 전체 조회 쿼리문 구성
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
--> 한 줄 구성
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID
;

select *
from tbl_member
where name like '%영%';




