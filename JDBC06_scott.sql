SELECT USER
FROM DUAL;
--==>> SCOTT


--�� Ȯ��
SELECT *
FROM TBL_MEMBER;

create sequence MEMBERSEQ
NOCACHE;


--�� �Է� ������
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '������', '010-6666-6666')
;


COMMIT;

-- Test001.java ���� �� Ȯ��
select *
from tbl_member;
/*
1	���α�	010-1111-1111
2	������	010-2222-2222
3	�ֳ���	010-3333-3333
4	������	010-4444-4444
5	������	010-5555-5555
6	������	010-6666-6666
7	�ӽÿ�	010-7777-7777
*/


--�� ��ü ��ȸ ������ ����
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
--> �� �� ����
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID
;

select *
from tbl_member
where name like '%��%';




