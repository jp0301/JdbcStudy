SELECT USER
FROM dual;
--==>> scott

--○ 실습 테이블 생성
CREATE TABLE TBL_CITY
( CITY_ID NUMBER(8)
, CITY_LOC VARCHAR2(10)
, CONSTRAINT CITY_CITY_ID_PK PRIMARY KEY(CITY_ID)
);
--==>> Table TBL_CITY이(가) 생성되었습니다.


--○ 시퀀스 생성
CREATE SEQUENCE CITYSEQ
NOCACHE;
--==>> Sequence CITYSEQ이(가) 생성되었습니다.

--강원/경기/경남/경북/부산/서울/인천/전남/전북/제주/충남/
--○ 데이터 입력
INSERT INTO TBL_CITY(CITY_ID, CITY_LOC) VALUES(CITYSEQ.NEXTVAL, '강원'); --1
INSERT INTO TBL_CITY(CITY_ID, CITY_LOC) VALUES(CITYSEQ.NEXTVAL, '경기'); --2
INSERT INTO TBL_CITY(CITY_ID, CITY_LOC) VALUES(CITYSEQ.NEXTVAL, '경남'); --3
INSERT INTO TBL_CITY(CITY_ID, CITY_LOC) VALUES(CITYSEQ.NEXTVAL, '경북'); --4
INSERT INTO TBL_CITY(CITY_ID, CITY_LOC) VALUES(CITYSEQ.NEXTVAL, '부산'); --5
INSERT INTO TBL_CITY(CITY_ID, CITY_LOC) VALUES(CITYSEQ.NEXTVAL, '서울'); --6
INSERT INTO TBL_CITY(CITY_ID, CITY_LOC) VALUES(CITYSEQ.NEXTVAL, '인천'); --7
INSERT INTO TBL_CITY(CITY_ID, CITY_LOC) VALUES(CITYSEQ.NEXTVAL, '전남'); --8
INSERT INTO TBL_CITY(CITY_ID, CITY_LOC) VALUES(CITYSEQ.NEXTVAL, '전북');-- 9
INSERT INTO TBL_CITY(CITY_ID, CITY_LOC) VALUES(CITYSEQ.NEXTVAL, '제주'); --10
INSERT INTO TBL_CITY(CITY_ID, CITY_LOC) VALUES(CITYSEQ.NEXTVAL, '충남'); --11
--==>> 1 행 이(가) 삽입되었습니다. * 11


--○ 커밋
COMMIT;
--==>> 커밋 완료.

--○ 테이블 조회
SELECT *
FROM TBL_CITY;
/*
1	강원
2	경기
3	경남
4	경북
5	부산
6	서울
7	인천
8	전남
9	전북
10	제주
11	충남
*/


--○ 실습 테이블 생성
CREATE TABLE TBL_BUSEO
( BUSEO_ID NUMBER(5)
, BUSEO_NAME VARCHAR2(15)
, CONSTRAINT BUSEO_BUSEO_ID_PK PRIMARY KEY(BUSEO_ID)
);
--==>> Table TBL_BUSEO이(가) 생성되었습니다.

--○ 시퀀스 생성
CREATE SEQUENCE BUSEOSEQ
NOCACHE;


--○ 데이터 입력
INSERT INTO TBL_BUSEO(BUSEO_ID, BUSEO_NAME) VALUES(BUSEOSEQ.NEXTVAL, '개발부');
INSERT INTO TBL_BUSEO(BUSEO_ID, BUSEO_NAME) VALUES(BUSEOSEQ.NEXTVAL, '기획부');
INSERT INTO TBL_BUSEO(BUSEO_ID, BUSEO_NAME) VALUES(BUSEOSEQ.NEXTVAL, '영업부');
INSERT INTO TBL_BUSEO(BUSEO_ID, BUSEO_NAME) VALUES(BUSEOSEQ.NEXTVAL, '인사부');
INSERT INTO TBL_BUSEO(BUSEO_ID, BUSEO_NAME) VALUES(BUSEOSEQ.NEXTVAL, '자재부');
INSERT INTO TBL_BUSEO(BUSEO_ID, BUSEO_NAME) VALUES(BUSEOSEQ.NEXTVAL, '총무부');
INSERT INTO TBL_BUSEO(BUSEO_ID, BUSEO_NAME) VALUES(BUSEOSEQ.NEXTVAL, '홍보부');
--==>> 1 행 이(가) 삽입되었습니다. * 7

--○ 테이블 조회
SELECT *
FROM TBL_BUSEO;
/*
1	개발부
2	기획부
3	영업부
4	인사부
5	자재부
6	총무부
7	홍보부
*/

--○ 커밋
COMMIT;



--○ 실습 테이블 생성
CREATE TABLE TBL_JIKWI
( JIKWI_ID  NUMBER(5)
, JIKWI_NAME VARCHAR2(15)
, MIN_BASICPAY NUMBER(10)
, CONSTRAINT JIKWI_JIKWI_ID_PK PRIMARY KEY(JIKWI_ID)
);


-- 시퀀스 생성
CREATE SEQUENCE JIKWISEQ
NOCACHE;

--○ 데이터 입력
INSERT INTO TBL_JIKWI(JIKWI_ID, JIKWI_NAME, MIN_BASICPAY) VALUES(JIKWISEQ.NEXTVAL, '사장', 4250000);
INSERT INTO TBL_JIKWI(JIKWI_ID, JIKWI_NAME, MIN_BASICPAY) VALUES(JIKWISEQ.NEXTVAL, '전무', 3800000);
INSERT INTO TBL_JIKWI(JIKWI_ID, JIKWI_NAME, MIN_BASICPAY) VALUES(JIKWISEQ.NEXTVAL, '상무', 3500000);
INSERT INTO TBL_JIKWI(JIKWI_ID, JIKWI_NAME, MIN_BASICPAY) VALUES(JIKWISEQ.NEXTVAL, '이사', 3100000);
INSERT INTO TBL_JIKWI(JIKWI_ID, JIKWI_NAME, MIN_BASICPAY) VALUES(JIKWISEQ.NEXTVAL, '부장', 2450000);
INSERT INTO TBL_JIKWI(JIKWI_ID, JIKWI_NAME, MIN_BASICPAY) VALUES(JIKWISEQ.NEXTVAL, '차장', 2350000);
INSERT INTO TBL_JIKWI(JIKWI_ID, JIKWI_NAME, MIN_BASICPAY) VALUES(JIKWISEQ.NEXTVAL, '과장', 2260000);
INSERT INTO TBL_JIKWI(JIKWI_ID, JIKWI_NAME, MIN_BASICPAY) VALUES(JIKWISEQ.NEXTVAL, '대리', 1250000);
INSERT INTO TBL_JIKWI(JIKWI_ID, JIKWI_NAME, MIN_BASICPAY) VALUES(JIKWISEQ.NEXTVAL, '사원', 840000);
--==>> 1 행 이(가) 삽입되었습니다. * 9


SELECT *
FROM TBL_JIKWI;
/*
1	사장	    4250000
2	전무  	3800000
3	상무  	3500000
4	이사	    3100000
5	부장	    2450000
6	차장  	2350000
7	과장  	2260000
8	대리  	1250000
9	사원  	 840000
*/


COMMIT;


-- 기존 테이블 제거
DROP TABLE TBL_EMP PURGE;
--==>> Table TBL_EMP이(가) 삭제되었습니다.

--○ 실습 테이블 생성
CREATE TABLE TBL_EMP
( EMP_ID        NUMBER(5)
, EMP_NAME      VARCHAR2(20)
, SSN           CHAR(14)
, IBSADATE      DATE
, CITY_ID       NUMBER(5)
, TEL           VARCHAR2(15)
, BUSEO_ID      NUMBER(5)
, JIKWI_ID      NUMBER(5)
, BASICPAY      NUMBER(10)
, SUDANG        NUMBER(10)
);
--==>> Table TBL_EMP이(가) 생성되었습니다.

--○ 제약조건 설정
ALTER TABLE TBL_EMP
ADD ( CONSTRAINT EMP_EMP_ID_PK PRIMARY KEY(EMP_ID)
    , CONSTRAINT EMP_CITY_ID_FK FOREIGN KEY(CITY_ID) REFERENCES TBL_CITY(CITY_ID)
    , CONSTRAINT EMP_BUSEO_ID_FK FOREIGN KEY(BUSEO_ID) REFERENCES TBL_BUSEO(BUSEO_ID)
    , CONSTRAINT EMP_JIKWI_ID_FK FOREIGN KEY(JIKWI_ID) REFERENCES TBL_JIKWI(JIKWI_ID) );
    
    
    
    
--○ 시퀀스 생성
CREATE SEQUENCE EMPSEQ
START WITH 1001
NOCACHE;
--==>> Sequence EMPSEQ이(가) 생성되었습니다.


INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '홍길동', '771212-1022432', '1998-10-11', 6, '011-2356-4528', 2, 5, 2610000, 200000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '이순신', '801007-1544236', '2000-11-29', 2, '010-4758-6532', 6, 9, 1320000, 200000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '이순애', '770922-2312547', '1999-02-25', 7, '010-4231-1236', 1, 5, 2550000, 160000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '김정훈', '790304-1788896', '2000-10-01', 9, '019-5236-4221', 3, 8, 1954200, 170000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '한석봉', '811112-1566789', '2004-08-13', 6, '018-5211-3542', 6, 9, 1420000, 160000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '이기자', '780505-2978541', '2002-02-11', 7, '010-3214-5357', 1, 7, 2265000, 150000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '장인철', '780506-1625148', '1998-03-16', 10, '011-2345-2525', 1, 8, 1250000, 150000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '김영년', '821011-2362514', '2002-04-30', 6, '016-2222-4444', 7, 9, 950000 , 145000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '나윤균', '810810-1552147', '2003-10-10', 2, '019-1111-2222', 4, 9, 840000 , 220400);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '김종서', '751010-1122233', '1997-08-08', 5, '011-3214-5555', 3, 5, 2540000, 130000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '유관순', '801010-2987897', '2000-07-07', 6, '010-8888-4422', 3, 9, 1020000, 140000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '정한국', '760909-1333333', '1999-10-16', 1, '018-2222-4242', 7, 9, 880000 , 114000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '조미숙', '790102-2777777', '1998-06-07', 2, '019-6666-4444', 7, 8, 1601000, 103000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '황진이', '810707-2574812', '2002-02-15', 7, '010-3214-5467', 1, 9, 1100000, 130000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '이현숙', '800606-2954687', '1999-07-26', 2, '016-2548-3365', 6, 9, 1050000, 104000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '이상헌', '781010-1666678', '2001-11-29', 2, '010-4526-1234', 1, 7, 2350000, 150000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '엄용수', '820507-1452365', '2000-08-28', 7, '010-3254-2542', 1, 9, 950000 , 210000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '이성길', '801028-1849534', '2004-08-08', 9, '018-1333-3333', 1, 9, 880000 , 123000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '박문수', '780710-1985632', '1999-12-10', 6, '017-4747-4848', 4, 7, 2300000, 165000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '유영희', '800304-2741258', '2003-10-10', 8, '011-9595-8585', 5, 9, 880000 , 140000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '홍길남', '801010-1111111', '2001-09-07', 2, '011-9999-7575', 1, 9, 875000 , 120000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '이영숙', '800501-2312456', '2003-02-25', 8, '017-5214-5282', 2, 8, 1960000, 180000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '김인수', '731211-1214576', '1995-02-23', 6, NULL           , 3, 5, 2500000, 170000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '김말자', '830225-2633334', '1999-08-28', 6, '011-5248-7789', 2, 8, 1900000, 170000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '우재옥', '801103-1654442', '2000-10-01', 6, '010-4563-2587', 3, 9, 1100000, 160000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '김숙남', '810907-2015457', '2002-08-28', 2, '010-2112-5225', 3, 9, 1050000, 150000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '김영길', '801216-1898752', '2000-10-18', 6, '019-8523-1478', 6, 7, 2340000, 170000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '이남신', '810101-1010101', '2001-09-07', 10, '016-1818-4848', 4, 9, 892000 , 110000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '김말숙', '800301-2020202', '2000-09-08', 6, '016-3535-3636', 6, 9, 920000 , 124000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '정정해', '790210-2101010', '1999-10-17', 5, '019-6564-6752', 6, 7, 2304000, 124000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '지재환', '771115-1687988', '2001-01-21', 6, '019-5552-7511', 2, 5, 2450000, 160000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '심심해', '810206-2222222', '2000-05-05', 9, '016-8888-7474', 5, 9, 880000 , 108000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '김미나', '780505-2999999', '1998-06-07', 6, '011-2444-4444', 3, 9, 1020000, 104000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '이정석', '820505-1325468', '2005-09-26', 2, '011-3697-7412', 2, 9, 1100000, 160000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '정영희', '831010-2153252', '2002-05-16', 7, NULL           , 1, 9, 1050000, 140000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '이재영', '701126-2852147', '2003-08-10', 6, '011-9999-9999', 5, 9, 960400 , 190000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '최석규', '770129-1456987', '1998-10-15', 7, '011-7777-7777', 7, 7, 2350000, 187000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '손인수', '791009-2321456', '1999-11-15', 5, '010-6542-7412', 3, 8, 2000000, 150000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '고순정', '800504-2000032', '2003-12-28', 2, '010-2587-7895', 3, 8, 2010000, 160000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '박세열', '790509-1635214', '2000-09-10', 4, '016-4444-7777', 4, 8, 2100000, 130000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '문길수', '721217-1951357', '2001-12-10', 11, '016-4444-5555', 5, 7, 2300000, 150000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '채정희', '810709-2000054', '2003-10-17', 2, '011-5125-5511', 1, 9, 1020000, 200000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '양미옥', '830504-2471523', '2003-09-24', 6, '016-8548-6547', 3, 9, 1100000, 210000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '지수환', '820305-1475286', '2004-01-21', 6, '011-5555-7548', 3, 9, 1060000, 220000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '홍원신', '690906-1985214', '2003-03-16', 9, '011-7777-7777', 3, 9, 960000 , 152000);			
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '허경운', '760105-1458752', '1999-05-04', 3, '017-3333-3333', 6, 5, 2650000, 150000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '산마루', '780505-1234567', '2001-07-15', 6, '018-0505-0505', 3, 8, 2100000, 112000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '이기상', '790604-1415141', '2001-06-07', 8, NULL           , 1, 8, 2050000, 106000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '이미성', '830908-2456548', '2000-04-07', 7, '010-6654-8854', 1, 9, 1300000, 130000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '이미인', '810403-2828287', '2003-06-07', 2, '011-8585-5252', 7, 8, 1950000, 103000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '권영미', '790303-2155554', '2000-06-04', 6, '011-5555-7548', 3, 7, 2260000, 104000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '권옥경', '820406-2000456', '2000-10-10', 2, '010-3644-5577', 2, 9, 1020000, 105000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '김싱식', '800715-1313131', '1999-12-12', 9, '011-7585-7474', 5, 9, 960000 , 108000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '정상호', '810705-1212141', '1999-10-16', 1, '016-1919-4242', 7, 9, 980000 , 114000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '정한나', '820506-2425153', '2004-06-07', 6, '016-2424-4242', 3, 9, 1000000, 104000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '전용재', '800605-1456987', '2004-08-13', 7, '010-7549-8654', 3, 8, 1950000, 200000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '이미경', '780406-2003214', '1998-02-11', 2, '016-6542-7546', 5, 5, 2520000, 160000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '김신제', '800709-1321456', '2003-08-08', 7, '010-2415-5444', 2, 8, 1950000, 180000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '임수봉', '810809-2121244', '2001-10-10', 6, '011-4151-4154', 1, 9, 890000 , 102000);
INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG) 
VALUES (EMPSEQ.NEXTVAL, '김신애', '810809-2111111', '2001-10-10', 6, '011-4151-4444', 1, 9, 900000 , 102000);
--==>> 1 행 이(가) 삽입되었습니다.


SELECT *
FROM TBL_EMP;
/*
EMP_ID EMP_NAME SSN           IBSADATE   CITY_ID  TEL     BUSEO_ID JIKWI_ID  BASICPAY  SUDANG
------ -------- -------------- ----------- -----  -----------  --- --   ------- ------

1001	홍길동	771212-1022432	1998-10-11	6	011-2356-4528	2	5	2610000	200000
1002	이순신	801007-1544236	2000-11-29	2	010-4758-6532	6	9	1320000	200000
1003	이순애	770922-2312547	1999-02-25	7	010-4231-1236	1	5	2550000	160000
1004	김정훈	790304-1788896	2000-10-01	9	019-5236-4221	3	8	1954200	170000
1005	한석봉	811112-1566789	2004-08-13	6	018-5211-3542	6	9	1420000	160000
1006	이기자	780505-2978541	2002-02-11	7	010-3214-5357	1	7	2265000	150000
1007	장인철	780506-1625148	1998-03-16	10	011-2345-2525	1	8	1250000	150000
1008	김영년	821011-2362514	2002-04-30	6	016-2222-4444	7	9	950000	145000
1009	나윤균	810810-1552147	2003-10-10	2	019-1111-2222	4	9	840000	220400
1010	김종서	751010-1122233	1997-08-08	5	011-3214-5555	3	5	2540000	130000
1011	유관순	801010-2987897	2000-07-07	6	010-8888-4422	3	9	1020000	140000
1012	정한국	760909-1333333	1999-10-16	1	018-2222-4242	7	9	880000	114000
1013	조미숙	790102-2777777	1998-06-07	2	019-6666-4444	7	8	1601000	103000
1014	황진이	810707-2574812	2002-02-15	7	010-3214-5467	1	9	1100000	130000
1015	이현숙	800606-2954687	1999-07-26	2	016-2548-3365	6	9	1050000	104000
1016	이상헌	781010-1666678	2001-11-29	2	010-4526-1234	1	7	2350000	150000
1017	엄용수	820507-1452365	2000-08-28	7	010-3254-2542	1	9	950000	210000
1018	이성길	801028-1849534	2004-08-08	9	018-1333-3333	1	9	880000	123000
1019	박문수	780710-1985632	1999-12-10	6	017-4747-4848	4	7	2300000	165000
1020	유영희	800304-2741258	2003-10-10	8	011-9595-8585	5	9	880000	140000
1021	홍길남	801010-1111111	2001-09-07	2	011-9999-7575	1	9	875000	120000
1022	이영숙	800501-2312456	2003-02-25	8	017-5214-5282	2	8	1960000	180000
1023	김인수	731211-1214576	1995-02-23	6		            3	5	2500000	170000
1024	김말자	830225-2633334	1999-08-28	6	011-5248-7789	2	8	1900000	170000
1025	우재옥	801103-1654442	2000-10-01	6	010-4563-2587	3	9	1100000	160000
1026	김숙남	810907-2015457	2002-08-28	2	010-2112-5225	3	9	1050000	150000
1027	김영길	801216-1898752	2000-10-18	6	019-8523-1478	6	7	2340000	170000
1028	이남신	810101-1010101	2001-09-07	10	016-1818-4848	4	9	892000	110000
1029	김말숙	800301-2020202	2000-09-08	6	016-3535-3636	6	9	920000	124000
1030	정정해	790210-2101010	1999-10-17	5	019-6564-6752	6	7	2304000	124000
1031	지재환	771115-1687988	2001-01-21	6	019-5552-7511	2	5	2450000	160000
1032	심심해	810206-2222222	2000-05-05	9	016-8888-7474	5	9	880000	108000
1033	김미나	780505-2999999	1998-06-07	6	011-2444-4444	3	9	1020000	104000
1034	이정석	820505-1325468	2005-09-26	2	011-3697-7412	2	9	1100000	160000
1035	정영희	831010-2153252	2002-05-16	7		            1	9	1050000	140000
1036	이재영	701126-2852147	2003-08-10	6	011-9999-9999	5	9	960400	190000
1037	최석규	770129-1456987	1998-10-15	7	011-7777-7777	7	7	2350000	187000
1038	손인수	791009-2321456	1999-11-15	5	010-6542-7412	3	8	2000000	150000
1039	고순정	800504-2000032	2003-12-28	2	010-2587-7895	3	8	2010000	160000
1040	박세열	790509-1635214	2000-09-10	4	016-4444-7777	4	8	2100000	130000
1041	문길수	721217-1951357	2001-12-10	11	016-4444-5555	5	7	2300000	150000
1042	채정희	810709-2000054	2003-10-17	2	011-5125-5511	1	9	1020000	200000
1043	양미옥	830504-2471523	2003-09-24	6	016-8548-6547	3	9	1100000	210000
1044	지수환	820305-1475286	2004-01-21	6	011-5555-7548	3	9	1060000	220000
1045	홍원신	690906-1985214	2003-03-16	9	011-7777-7777	3	9	960000	152000
1046	허경운	760105-1458752	1999-05-04	3	017-3333-3333	6	5	2650000	150000
1047	산마루	780505-1234567	2001-07-15	6	018-0505-0505	3	8	2100000	112000
1048	이기상	790604-1415141	2001-06-07	8		            1	8	2050000	106000
1049	이미성	830908-2456548	2000-04-07	7	010-6654-8854	1	9	1300000	130000
1050	이미인	810403-2828287	2003-06-07	2	011-8585-5252	7	8	1950000	103000
1051	권영미	790303-2155554	2000-06-04	6	011-5555-7548	3	7	2260000	104000
1052	권옥경	820406-2000456	2000-10-10	2	010-3644-5577	2	9	1020000	105000
1053	김싱식	800715-1313131	1999-12-12	9	011-7585-7474	5	9	960000	108000
1054	정상호	810705-1212141	1999-10-16	1	016-1919-4242	7	9	980000	114000
1055	정한나	820506-2425153	2004-06-07	6	016-2424-4242	3	9	1000000	104000
1056	전용재	800605-1456987	2004-08-13	7	010-7549-8654	3	8	1950000	200000
1057	이미경	780406-2003214	1998-02-11	2	016-6542-7546	5	5	2520000	160000
1058	김신제	800709-1321456	2003-08-08	7	010-2415-5444	2	8	1950000	180000
1059	임수봉	810809-2121244	2001-10-10	6	011-4151-4154	1	9	890000	102000
1060	김신애	810809-2111111	2001-10-10	6	011-4151-4444	1	9	900000	102000
*/


--○ 행의 갯수 레코드 수 확인
SELECT COUNT(*) AS COUNT
FROM TBL_EMP;
--==>> 60

COMMIT;


--○ 전체 내용 조회(JOIN)
SELECT E.EMP_ID, E.EMP_NAME, E.SSN, E.IBSADATE
       , C.CITY_LOC, E.TEL, B.BUSEO_NAME, J.JIKWI_NAME
       , J.MIN_BASICPAY, E.BASICPAY, E.SUDANG
       , (E.BASICPAY + E.SUDANG) AS PAY
FROM TBL_EMP E, TBL_CITY C, TBL_BUSEO B, TBL_JIKWI J
WHERE E.CITY_ID = C.CITY_ID
  AND E.BUSEO_ID = B.BUSEO_ID
  AND E.JIKWI_ID = J.JIKWI_ID;
/*
1001	홍길동	771212-1022432	1998-10-11	서울	011-2356-4528	기획부	부장	2450000	2610000	200000	2810000
1002	이순신	801007-1544236	2000-11-29	경기	010-4758-6532	총무부	사원	840000	1320000	200000	1520000
1003	이순애	770922-2312547	1999-02-25	인천	010-4231-1236	개발부	부장	2450000	2550000	160000	2710000
1004	김정훈	790304-1788896	2000-10-01	전북	019-5236-4221	영업부	대리	1250000	1954200	170000	2124200
1005	한석봉	811112-1566789	2004-08-13	서울	018-5211-3542	총무부	사원	840000	1420000	160000	1580000
1006	이기자	780505-2978541	2002-02-11	인천	010-3214-5357	개발부	과장	2260000	2265000	150000	2415000
1007	장인철	780506-1625148	1998-03-16	제주	011-2345-2525	개발부	대리	1250000	1250000	150000	1400000
1008	김영년	821011-2362514	2002-04-30	서울	016-2222-4444	홍보부	사원	840000	950000	145000	1095000
1009	나윤균	810810-1552147	2003-10-10	경기	019-1111-2222	인사부	사원	840000	840000	220400	1060400
1010	김종서	751010-1122233	1997-08-08	부산	011-3214-5555	영업부	부장	2450000	2540000	130000	2670000
1011	유관순	801010-2987897	2000-07-07	서울	010-8888-4422	영업부	사원	840000	1020000	140000	1160000
1012	정한국	760909-1333333	1999-10-16	강원	018-2222-4242	홍보부	사원	840000	880000	114000	994000
1013	조미숙	790102-2777777	1998-06-07	경기	019-6666-4444	홍보부	대리	1250000	1601000	103000	1704000
1014	황진이	810707-2574812	2002-02-15	인천	010-3214-5467	개발부	사원	840000	1100000	130000	1230000
1015	이현숙	800606-2954687	1999-07-26	경기	016-2548-3365	총무부	사원	840000	1050000	104000	1154000
1016	이상헌	781010-1666678	2001-11-29	경기	010-4526-1234	개발부	과장	2260000	2350000	150000	2500000
1017	엄용수	820507-1452365	2000-08-28	인천	010-3254-2542	개발부	사원	840000	950000	210000	1160000
1018	이성길	801028-1849534	2004-08-08	전북	018-1333-3333	개발부	사원	840000	880000	123000	1003000
1019	박문수	780710-1985632	1999-12-10	서울	017-4747-4848	인사부	과장	2260000	2300000	165000	2465000
1020	유영희	800304-2741258	2003-10-10	전남	011-9595-8585	자재부	사원	840000	880000	140000	1020000
1021	홍길남	801010-1111111	2001-09-07	경기	011-9999-7575	개발부	사원	840000	875000	120000	995000
1022	이영숙	800501-2312456	2003-02-25	전남	017-5214-5282	기획부	대리	1250000	1960000	180000	2140000
1023	김인수	731211-1214576	1995-02-23	서울		            영업부	부장	2450000	2500000	170000	2670000
1024	김말자	830225-2633334	1999-08-28	서울	011-5248-7789	기획부	대리	1250000	1900000	170000	2070000
1025	우재옥	801103-1654442	2000-10-01	서울	010-4563-2587	영업부	사원	840000	1100000	160000	1260000
1026	김숙남	810907-2015457	2002-08-28	경기	010-2112-5225	영업부	사원	840000	1050000	150000	1200000
1027	김영길	801216-1898752	2000-10-18	서울	019-8523-1478	총무부	과장	2260000	2340000	170000	2510000
1028	이남신	810101-1010101	2001-09-07	제주	016-1818-4848	인사부	사원	840000	892000	110000	1002000
1029	김말숙	800301-2020202	2000-09-08	서울	016-3535-3636	총무부	사원	840000	920000	124000	1044000
1030	정정해	790210-2101010	1999-10-17	부산	019-6564-6752	총무부	과장	2260000	2304000	124000	2428000
1031	지재환	771115-1687988	2001-01-21	서울	019-5552-7511	기획부	부장	2450000	2450000	160000	2610000
1032	심심해	810206-2222222	2000-05-05	전북	016-8888-7474	자재부	사원	840000	880000	108000	988000
1033	김미나	780505-2999999	1998-06-07	서울	011-2444-4444	영업부	사원	840000	1020000	104000	1124000
1034	이정석	820505-1325468	2005-09-26	경기	011-3697-7412	기획부	사원	840000	1100000	160000	1260000
1035	정영희	831010-2153252	2002-05-16	인천		            개발부	사원	840000	1050000	140000	1190000
1036	이재영	701126-2852147	2003-08-10	서울	011-9999-9999	자재부	사원	840000	960400	190000	1150400
1037	최석규	770129-1456987	1998-10-15	인천	011-7777-7777	홍보부	과장	2260000	2350000	187000	2537000
1038	손인수	791009-2321456	1999-11-15	부산	010-6542-7412	영업부	대리	1250000	2000000	150000	2150000
1039	고순정	800504-2000032	2003-12-28	경기	010-2587-7895	영업부	대리	1250000	2010000	160000	2170000
1040	박세열	790509-1635214	2000-09-10	경북	016-4444-7777	인사부	대리	1250000	2100000	130000	2230000
1041	문길수	721217-1951357	2001-12-10	충남	016-4444-5555	자재부	과장	2260000	2300000	150000	2450000
1042	채정희	810709-2000054	2003-10-17	경기	011-5125-5511	개발부	사원	840000	1020000	200000	1220000
1043	양미옥	830504-2471523	2003-09-24	서울	016-8548-6547	영업부	사원	840000	1100000	210000	1310000
1044	지수환	820305-1475286	2004-01-21	서울	011-5555-7548	영업부	사원	840000	1060000	220000	1280000
1045	홍원신	690906-1985214	2003-03-16	전북	011-7777-7777	영업부	사원	840000	960000	152000	1112000
1046	허경운	760105-1458752	1999-05-04	경남	017-3333-3333	총무부	부장	2450000	2650000	150000	2800000
1047	산마루	780505-1234567	2001-07-15	서울	018-0505-0505	영업부	대리	1250000	2100000	112000	2212000
1048	이기상	790604-1415141	2001-06-07	전남		            개발부	대리	1250000	2050000	106000	2156000
1049	이미성	830908-2456548	2000-04-07	인천	010-6654-8854	개발부	사원	840000	1300000	130000	1430000
1050	이미인	810403-2828287	2003-06-07	경기	011-8585-5252	홍보부	대리	1250000	1950000	103000	2053000
1051	권영미	790303-2155554	2000-06-04	서울	011-5555-7548	영업부	과장	2260000	2260000	104000	2364000
1052	권옥경	820406-2000456	2000-10-10	경기	010-3644-5577	기획부	사원	840000	1020000	105000	1125000
1053	김싱식	800715-1313131	1999-12-12	전북	011-7585-7474	자재부	사원	840000	960000	108000	1068000
1054	정상호	810705-1212141	1999-10-16	강원	016-1919-4242	홍보부	사원	840000	980000	114000	1094000
1055	정한나	820506-2425153	2004-06-07	서울	016-2424-4242	영업부	사원	840000	1000000	104000	1104000
1056	전용재	800605-1456987	2004-08-13	인천	010-7549-8654	영업부	대리	1250000	1950000	200000	2150000
1057	이미경	780406-2003214	1998-02-11	경기	016-6542-7546	자재부	부장	2450000	2520000	160000	2680000
1058	김신제	800709-1321456	2003-08-08	인천	010-2415-5444	기획부	대리	1250000	1950000	180000	2130000
1059	임수봉	810809-2121244	2001-10-10	서울	011-4151-4154	개발부	사원	840000	890000	102000	992000
1060	김신애	810809-2111111	2001-10-10	서울	011-4151-4444	개발부	사원	840000	900000	102000	1002000
*/

--○ 뷰 생성
CREATE OR REPLACE VIEW EMPVIEW
AS
SELECT E.EMP_ID, E.EMP_NAME, E.SSN, E.IBSADATE
       , C.CITY_LOC, E.TEL, B.BUSEO_NAME, J.JIKWI_NAME
       , J.MIN_BASICPAY, E.BASICPAY, E.SUDANG
       , (E.BASICPAY + E.SUDANG) AS PAY
FROM TBL_EMP E, TBL_CITY C, TBL_BUSEO B, TBL_JIKWI J
WHERE E.CITY_ID = C.CITY_ID
  AND E.BUSEO_ID = B.BUSEO_ID
  AND E.JIKWI_ID = J.JIKWI_ID;
--==>> View EMPVIEW이(가) 생성되었습니다.

--○ 확인
SELECT *
FROM EMPVIEW;


commit;


