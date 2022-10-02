-- JDBC01_scott.sql

SELECT USER
FROM DUAL;
--==>> SCOTT

--�� ���� ���̺� ����
DROP TABLE TBL_MEMBER PURGE;
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.

--�� �ǽ� ���̺� ����(TBL_MEMBER)
CREATE TABLE TBL_MEMBER
( SID   NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(60)
, CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.

--�� ������ �Է� ������ ����
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(1, '���α�', '010-1111-1111')
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_MEMBER;
--==>> 1	���α�	010-1111-1111

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� Test002.java ���� �� Ȯ��
SELECT *
FROM TBL_MEMBER;
--==>>
/*
1	���α�	010-1111-1111
2	������	010-2222-2222
*/

--�� Test003.java ���� �� Ȯ��
SELECT *
FROM TBL_MEMBER;
--==>>
/*
3	�ֳ���	010-3333-3333
4	������	010-4444-4444
5	������	010-5555-5555
1	���α�	010-1111-1111
2	������	010-2222-2222
*/

--�� ��ȸ ������ ����
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY 1;
--> �� �� ����
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY 1
;
--==>>
/*
1	���α�	010-1111-1111
2	������	010-2222-2222
3	�ֳ���	010-3333-3333
4	������	010-4444-4444
5	������	010-5555-5555
*/












