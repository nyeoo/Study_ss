SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TBL_��ǰ;
--==>>
/*
H001	�ٹ��	600	    30
H002	�ҽ���	500	    30
H003	������	500	    20         �� �׽�Ʈ�� �׸�(��� 35�� -> 15�� ��� -> ��� 20��)
H004	������	600	    70
H005	�ֹֽ�	700	    0
H006	���ڹ�	500	    0
H007	�˲���	500	    0
C001	������	1600	20
C002	������	1500	20
C003	��Ÿ��	1500	20
C004	������	1600	20
C005	������	1700	0
E001	���Ǿ�	2600	0
E002	���Դ�	2500	0
E003	�Ϻ���	2500	0
E004	������	2600	0
E005	������	2700	0
*/

SELECT *
FROM TBL_�԰�;
--==>>
/*
1	H001	2023-11-06	30	500
2	H002	2023-11-06	20	400
3	H001	2023-11-06	50	500
4	H002	2023-11-06	30	400
5	H003	2023-11-06	35	400         �� �׽�Ʈ�� �׸�
6	H004	2023-11-06	70	500
7	C001	2023-11-06	26	1400
8	C001	2023-11-06	24	1400
9	C001	2023-11-06	20	1500
10	C002	2023-11-06	20	1000
11	C003	2023-11-06	20	1000
12	C004	2023-11-06	20	1000
*/

SELECT *
FROM TBL_���;
--==>>
/*
1	H001	2023-11-06	10	600
2	H001	2023-11-06	10	600
3	C001	2023-11-06	20	1500
4	C001	2023-11-06	20	1500
5	C001	2023-11-06	10	1500
6	H001	2023-11-06	10	500
7	H001	2023-11-06	10	500
8	H001	2023-11-06	10	500
9	H002	2023-11-06	20	500
10	H003	2023-11-06	15	500         �� �׽�Ʈ�� �׸�
*/


--�� ������ ���ν����� ����� �۵��ϴ� ���� ���� Ȯ�� -> ���ν��� ȣ��
EXEC PRC_���_UPDATE(10, 40);
--==>> ���� �߻� (ORA-20002: �������)

EXEC PRC_���_UPDATE(10, 25);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.




SELECT *
FROM TBL_���;
--==>>
/*
1	H001	2023-11-06	10	600
2	H001	2023-11-06	10	600
3	C001	2023-11-06	20	1500
4	C001	2023-11-06	20	1500
5	C001	2023-11-06	10	1500
6	H001	2023-11-06	10	500
7	H001	2023-11-06	10	500
8	H001	2023-11-06	10	500
9	H002	2023-11-06	20	500
10	H003	2023-11-06	25	500
*/

SELECT *
FROM TBL_�԰�;
--==>>
/*
1	H001	2023-11-06	30	500
2	H002	2023-11-06	20	400
3	H001	2023-11-06	50	500
4	H002	2023-11-06	30	400
5	H003	2023-11-06	35	400
6	H004	2023-11-06	70	500
7	C001	2023-11-06	26	1400
8	C001	2023-11-06	24	1400
9	C001	2023-11-06	20	1500
10	C002	2023-11-06	20	1000
11	C003	2023-11-06	20	1000
12	C004	2023-11-06	20	1000
*/


SELECT *
FROM TBL_��ǰ;
--==>>
/*
H001	�ٹ��	600	    30
H002	�ҽ���	500	    30
H003	������	500	    10
H004	������	600	    70
H005	�ֹֽ�	700	    0
H006	���ڹ�	500	    0
H007	�˲���	500	    0
C001	������	1600	20
C002	������	1500	20
C003	��Ÿ��	1500	20
C004	������	1600	20
C005	������	1700	0
E001	���Ǿ�	2600	0
E002	���Դ�	2500	0
E003	�Ϻ���	2500	0
E004	������	2600	0
E005	������	2700	0
*/

EXEC PRC_�԰�_UPDATE(5, 10);

EXEC PRC_�԰�_DELETE(5);

EXEC PRC_���_DELETE(10);

EXEC PRC_���_DELETE(1);


-------------------------------------------------------------------------------------


--���� AFTER STATEMENT TRIGGER ��Ȳ �ǽ� ����--
--�� DML �۾��� ���� �̺�Ʈ ���

--�� �ǽ��� ���� �غ� -> ���̺� ����(TBL_TEST1)
CREATE TABLE TBL_TEST1
( ID    NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(60)
, CONSTRAINT TEST1_ID_PK PRIMARY KEY(ID)
);
--==>> Table TBL_TEST1��(��) �����Ǿ����ϴ�.

--�� �ǽ��� ���� �غ� -> ���̺� ����(TBL_EVENTLOG)
CREATE TABLE TBL_EVENTLOG
( MEMO  VARCHAR2(200)
, ILJA  DATE DEFAULT SYSDATE
);
--==>> Table TBL_EVENTLOG��(��) �����Ǿ����ϴ�.


--�� ��¥ ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_TEST1;

SELECT *
FROM TBL_EVENTLOG;

--�� ������ TRIGGER �۵����� Ȯ��
--  -> TBL_TEST1 ���̺��� ������� INSERT, UPDATE, DELETE ����

INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(1, '������', '010-1111-1111');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(2, '������', '010-2222-2222');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(3, '����ȯ', '010-3333-3333');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

UPDATE TBL_TEST1
SET NAME = '�ڰ���', TEL = '010-4444-4444'
WHERE ID = 1;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.


DELETE
FROM TBL_TEST1
WHERE ID IN (2,3);
--==>> 2�� �� ��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_TEST1;
--==>> 1	�ڰ���	010-4444-4444

DELETE
FROM TBL_TEST1
WHERE ID =1;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_TEST1;
--==>> ��ȸ ��� ����

SELECT *
FROM TBL_EVENTLOG;
--==>>
/*
INSERT ������ ����Ǿ����ϴ�.	2023-11-07 16:14:36
INSERT ������ ����Ǿ����ϴ�.	2023-11-07 16:15:08
INSERT ������ ����Ǿ����ϴ�.	2023-11-07 16:17:18
UPDATE ������ ����Ǿ����ϴ�.	2023-11-07 16:18:48
DELETE ������ ����Ǿ����ϴ�.	2023-11-07 16:19:29
DELETE ������ ����Ǿ����ϴ�.	2023-11-07 16:20:22
*/



--���� BEFORE STATEMENT TRIGGER ��Ȳ �ǽ� ����--
--�� DML �۾��� �����ϱ� ���� �۾��� ���� ���ɿ��� Ȯ��

SELECT SYSDATE
FROM DUAL;
--==>> 2023-11-07 18:47:04

INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(1, '��ٽ�', '010-1111-1111');
--==>> ���� �߻� (ORA-20003: �۾� �ð��� 09:00 - 18:00 ������ �����մϴ�.)


SELECT SYSDATE
FROM DUAL;
--==>> 2023-11-07 16:49:07

INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(1, '��ٽ�', '010-1111-1111');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


COMMIT;
--==>> Ŀ�� �Ϸ�.

UPDATE TBL_TEST1
SET NAME ='������', TEL = '010-2222-2222'
WHERE ID=1;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(2, '�����', '010-3333-3333');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


SELECT *
FROM TBL_TEST1;
--==>>
/*
2	�����	010-3333-3333
1	������	010-2222-2222
*/

COMMIT;
--==>> Ŀ�� �Ϸ�.


SELECT SYSDATE
FROM DUAL;
--==>> 2023-11-07 06:02:14

UPDATE TBL_TEST1
SET NAME = '�ڹ���', TEL = '010-4444-4444'
WHERE ID=1;
--==>> ���� �߻�

DELETE
FROM TBL_TEST1
WHERE ID=2;
--==>> ���� �߻� (ORA-20003: �۾� �ð��� 09:00 - 18:00 ������ �����մϴ�.)

--------------------------------------------------------------------------------

--���� BEFORE ROW TRIGGER ��Ȳ �ǽ� ����--
--�� ���� ���谡 ������ ������(�ڽ�) ������ ���� �����ϴ� ��

--�� �ǽ� ȯ�� ������ ���� ���̺� ���� -> TBL_TEST2
CREATE TABLE TBL_TEST2
( CODE NUMBER
, NAME VARCHAR2(40)
, CONSTRAINT TEST2_CODE_PK PRIMARY KEY(CODE)
);
--==>> Table TBL_TEST2��(��) �����Ǿ����ϴ�.

CREATE TABLE TBL_TEST3
( SID NUMBER
, CODE NUMBER
, SU NUMBER
, CONSTRAINT TEST3_SID_PK PRIMARY KEY(SID)
, CONSTRAINT TEST3_CODE_FK FOREIGN KEY(CODE)
        REFERENCES TBL_TEST2(CODE)
);
--==>> Table TBL_TEST3��(��) �����Ǿ����ϴ�.

--�� �ǽ� ���� ������ �Է�
INSERT INTO TBL_TEST2(CODE,NAME) VALUES(1, '�ڷ�����');
INSERT INTO TBL_TEST2(CODE,NAME) VALUES(2, '�����');
INSERT INTO TBL_TEST2(CODE,NAME) VALUES(3, '��Ź��');
INSERT INTO TBL_TEST2(CODE,NAME) VALUES(4, '������');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. *4

SELECT *
FROM TBL_TEST2;
--==>>
/*
1	�ڷ�����
2	�����
3	��Ź��
4	������
*/

COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� �ǽ� ���� ������ �Է�
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(1, 1, 30); -- �ڷ�����
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(2, 1, 50); -- �ڷ�����
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(3, 1, 60); -- �ڷ�����
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(4, 2, 20); -- �����
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(5, 2, 20); -- �����
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(6, 3, 40); -- ��Ź��
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(7, 1, 30); -- �ڷ�����
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(8, 4, 30); -- ������
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(9, 3, 10); -- ��Ź��

--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 9

SELECT *
FROM TBL_TEST3;
--==>>
/*
1	1	30
2	1	50
3	1	60
4	2	20
5	2	20
6	3	40
7	1	30
8	4	30
9	3	10
*/

COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� �θ� ���̺�(TBL_TEST2)�� ������ ���� �õ�

DELETE
FROM TBL_TEST2
WHERE CODE=1;
--==>> ���� �߻� (ORA-02292: integrity constraint (SCOTT.TEST3_CODE_FK) violated - child record found)



--�� TRIGGER ���� ���� Ȯ��
DELETE
FROM TBL_TEST2
WHERE CODE=1;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_TEST2;
--==>
/*
2	�����
3	��Ź��
4	������
*/

SELECT *
FROM TBL_TEST3;
--==>>
/*
4	2	20
5	2	20
6	3	40
8	4	30
9	3	10
*/


DELETE
FROM TBL_TEST2
WHERE CODE=2;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.




SELECT *
FROM TBL_TEST2;
--==>
/*
3	��Ź��
4	������
*/

SELECT *
FROM TBL_TEST3;
--==>>
/*
6	3	40
8	4	30
9	3	10
*/


------------------------------------------------------------------------------------

--���� AFTER ROW TRIGGER ��Ȳ �ǽ� ����--
--�� ���� ���̺� ���� Ʈ����� ó��


--�� �ǽ��� ���� �غ�
UPDATE TBL_��ǰ
SET ������� = 0;
--==>> 17�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

TRUNCATE TABLE TBL_�԰�;
--==>> Table TBL_�԰���(��) �߷Ƚ��ϴ�.

TRUNCATE TABLE TBL_���;
--==>> Table TBL_�����(��) �߷Ƚ��ϴ�.


ROLLBACK;
-- TRUNCATE : ���̺��� ������ �������� ��... �ѹ��� �ȵ�(AUTO COMMIT��)


SELECT *
FROM TBL_�԰�;
--==>> ��ȸ ��� ����

SELECT *
FROM TBL_���;
--==>> ��ȸ ��� ����



SELECT *
FROM TBL_��ǰ;
--==>>
/*
H001	�ٹ��	600 	0
H002	�ҽ���	500	    0
H003	������	500	    0
H004	������	600	    0
H005	�ֹֽ�	700	    0
H006	���ڹ�	500	    0
H007	�˲���	500	    0
C001	������	1600	0
C002	������	1500	0
C003	��Ÿ��	1500	0
C004	������	1600	0
C005	������	1700	0
E001	���Ǿ�	2600	0
E002	���Դ�	2500	0
E003	�Ϻ���	2500	0
E004	������	2600	0
E005	������	2700	0
*/



--�� TRIGGER(Ʈ����) ���� ���� �ǽ� �׽�Ʈ
INSERT INTO TBL_�԰�(�԰���ȣ, ��ǰ�ڵ�, �԰�����, �԰�����, �԰��ܰ�)
VALUES(1, 'H001', SYSDATE, 40, 1000);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


INSERT INTO TBL_�԰�(�԰���ȣ, ��ǰ�ڵ�, �԰�����, �԰�����, �԰��ܰ�)
VALUES(2, 'H001', SYSDATE, 20, 1000);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_�԰�;     
--==>>
/*
1	H001	2023-11-08	40	1000
2	H001	2023-11-08	20	1000
*/


SELECT *
FROM TBL_��ǰ;
--==>>
/*
H001	�ٹ��	600	    60
H002	�ҽ���	500	    0
H003	������	500	    0
H004	������	600	    0
H005	�ֹֽ�	700	    0
H006	���ڹ�	500	    0
H007	�˲���	500	    0
C001	������	1600	0
C002	������	1500	0
C003	��Ÿ��	1500	0
C004	������	1600	0
C005	������	1700	0
E001	���Ǿ�	2600	0
E002	���Դ�	2500	0
E003	�Ϻ���	2500	0
E004	������	2600	0
E005	������	2700	0
*/


--�� Ʈ���� ���� �� �׽�Ʈ(Ȯ��)
UPDATE TBL_�԰�
SET �԰����� = 40
WHERE �԰���ȣ = 2;

DELETE
FROM TBL_�԰�
WHERE �԰���ȣ =1;

ROLLBACK;































