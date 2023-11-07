SELECT USER
FROM DUAL;
--==>> SCOTT

/* 6-문제 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
--○ TBL_STUDENT 테이블 조회
SELECT *
FROM TBL_STUDENTS;
--==>>
/*
moon	문정환	010-1111-1111	제주도 서귀포시
wool	정한울	010-2222-2222	서울 강남구
*/

SELECT *
FROM TBL_IDPW;
--==>>
/*
moon	java006$
wool	java006$
*/

--○ 방법1) 프로시저 생성 후 실행 & 조회 ---------------------------------------
--○ 프로시저 생성 후 실행 테스트(잘못된 테스트)
EXEC PRC_STUDENT_UPDATE('moon', 'java000$', '010-9999-9999', '강원도 횡성');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

--○ 프로시저 호출 후 테이블 조회
SELECT *
FROM TBL_STUDENTS;
/*
moon	문정환	010-1111-1111	제주도 서귀포시
wool	정한울	010-2222-2222	서울 강남구
*/

--○ 프로시저 생성 후 실행 테스트(올바른 테스트)
EXEC PRC_STUDENT_UPDATE('moon', 'java006$', '010-9999-9999', '강원도 횡성');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

--○ 프로시저 호출 후 테이블 조회
SELECT *
FROM TBL_STUDENTS;
/*
moon	문정환	010-9999-9999	강원도 횡성
wool	정한울	010-2222-2222	서울 강남구
*/

--○ 방법2) 프로시저 생성 후 실행 & 조회 ---------------------------------------
--○ 프로시저 생성 후 실행 테스트(잘못된 테스트)
EXEC PRC_STUDENT_UPDATE('wool', 'java000$', '010-8888-8888', '전남 목포');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

--○ 프로시저 호출 후 테이블 조회
SELECT *
FROM TBL_STUDENTS;
/*
moon	문정환	010-9999-9999	강원도 횡성
wool	정한울	010-2222-2222	서울 강남구
*/

--○ 프로시저 생성 후 실행 테스트(올바른 테스트)
EXEC PRC_STUDENT_UPDATE('wool', 'java006$', '010-8888-8888', '전남 목포');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

--○ 프로시저 호출 후 테이블 조회
SELECT *
FROM TBL_STUDENTS;
/*
moon	문정환	010-9999-9999	강원도 횡성
wool	정한울	010-8888-8888	전남 목포
*/



/* 1-문제 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
DESC TBL_INSA;
--==>>
/*
이름       널?       유형           
-------- -------- ------------ 
NUM      NOT NULL NUMBER(5)    
NAME     NOT NULL VARCHAR2(20) 
SSN      NOT NULL VARCHAR2(14) 
IBSADATE NOT NULL DATE         
CITY              VARCHAR2(10) 
TEL               VARCHAR2(15) 
BUSEO    NOT NULL VARCHAR2(15) 
JIKWI    NOT NULL VARCHAR2(15) 
BASICPAY NOT NULL NUMBER(10)   
SUDANG   NOT NULL NUMBER(10)
*/

--○ 프로시저 생성 후 실행 테스트(올바른 테스트)
EXEC PRC_INSA_INSERT('최혜인', '970812-2234567', SYSDATE, '서울', '010-2509-1783', '개발부', '대리', 2000000, 2000000);

--○ 프로시저 호출 후 테이블 조회
SELECT *
FROM TBL_INSA;
/*      :
1061	최혜인	970812-2234567	2023-11-06	서울	010-2509-1783	개발부	대리	2000000	2000000
*/

-- 컬럼명 등을 한글로 작성하는 것은 문법적으로 가능하나, 바람직하지 않음



--○ 실습 테이블 생성(TBL_상품)
CREATE TABLE TBL_상품
( 상품코드      VARCHAR2(20)
, 상품명        VARCHAR2(100)
, 소비자가격    NUMBER
, 재고수량     NUMBER DEFAULT 0
, CONSTRAINT 상품_상품코드_PK PRIMARY KEY(상품코드)
);
--==>> Table TBL_상품이(가) 생성되었습니다.
-- TBL_상품 테이블의 상품코드 기본키(PK) 제약조건 설정

--○ 실습 테이블 생성(TBL_입고)
CREATE TABLE TBL_입고
( 입고번호 NUMBER
, 상품코드 VARCHAR2(20)
, 입고일자 DATE DEFAULT SYSDATE
, 입고수량 NUMBER
, 입고단가 NUMBER
, CONSTRAINT 입고_입고번호_PK PRIMARY KEY(입고번호)
, CONSTRAINT 입고_상품코드_FK FOREIGN KEY(상품코드)
                REFERENCES TBL_상품(상품코드)
);
--==>> Table TBL_입고이(가) 생성되었습니다.
-- TBL_입고 테이블의 입고번호를 기본키(PK) 제약조건 설정
-- TBL_입고 테이블의 상품코드는 TBL_상품 테이블의 상품코드를
-- 참조할 수 있도록 외래키(FK) 제약조건 설정



--○ TBL_상품 테이블에 상품정보 입력
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('H001', '바밤바', 600);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('H002', '죠스바', 500);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('H003', '보석바', 500);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('H004', '누가바', 600);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('H005', '쌍쌍바', 700);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('H006', '수박바', 500);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('H007', '알껌바', 500);
--==>> 1 행 이(가) 삽입되었습니다. * 7


INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('C001', '빵빠레', 1600);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('C002', '월드콘', 1500);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('C003', '메타콘', 1500);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('C004', '구구콘', 1600);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('C005', '슈퍼콘', 1700);
--==>> 1 행 이(가) 삽입되었습니다. * 5


INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('E001', '빵또아', 2600);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('E002', '투게더', 2500);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('E003', '팥빙수', 2500);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('E004', '셀렉션', 2600);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('E005', '설레임', 2700);
--==>> 1 행 이(가) 삽입되었습니다. * 5

--○ 확인
SELECT *
FROM TBL_상품;
--==>>
/*
H001	바밤바	600 	0
H002	죠스바	500	    0
H003	보석바	500 	0
H004	누가바	600	    0
H005	쌍쌍바	700	    0
H006	수박바	500	    0
H007	알껌바	500	    0
C001	빵빠레	1600	0
C002	월드콘	1500	0
C003	메타콘	1500	0
C004	구구콘	1600	0
C005	슈퍼콘	1700	0
E001	빵또아	2600	0
E002	투게더	2500	0
E003	팥빙수	2500	0
E004	셀렉션	2600	0
E005	설레임	2700	0
*/


--○ 커밋
COMMIT;
--==>> 커밋 완료.


--○ 테이블 조회(입고내역 확인)
SELECT *
FROM TBL_입고;
--==>> 조회결과 없음

--○ TBL_ 입고 테이블에 입고 이벤트 발생 시...
--   관련 테이블에 수행되어야 하는 내용

-- ① INSERT -> TBL_입고
--    INSERT INTO TBL_입고(입고번호, 상품코드, 입고일자, 입고수량, 입고단가)
--    VALUES(1, 'H001', SYSDATE, 30, 400);

-- ② UPDATE -> TBL_상품
--    UPDATE TBL_상품
--    SET 재고수량 = 기존재고수량 + 입고수량(30)      -- CHECK~!!!
--    WHERE 상품코드 = 'H001';



EXEC PRC_입고_INSERT('H001', 30, 500);
EXEC PRC_입고_INSERT('H002', 20, 400);
EXEC PRC_입고_INSERT('H001', 50, 500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다. *3



EXEC PRC_입고_INSERT('H002', 30, 400);
EXEC PRC_입고_INSERT('H003', 35, 400);
EXEC PRC_입고_INSERT('H004', 70, 500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다. *3


EXEC PRC_입고_INSERT('C001', 26, 1400);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.
EXEC PRC_입고_INSERT('C001', 24, 1400);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.
EXEC PRC_입고_INSERT('C001', 20, 1500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.
EXEC PRC_입고_INSERT('C002', 20, 1000);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.
EXEC PRC_입고_INSERT('C003', 20, 1000);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.
EXEC PRC_입고_INSERT('C004', 20, 1000);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.


SELECT *
FROM TBL_입고;
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
FROM TBL_상품;
--==>>
/*
H001	바밤바	600	80
H002	죠스바	500	50
H003	보석바	500	35
H004	누가바	600	70
H005	쌍쌍바	700	0
H006	수박바	500	0
H007	알껌바	500	0
C001	빵빠레	1600	70
C002	월드콘	1500	20
C003	메타콘	1500	20
C004	구구콘	1600	20
C005	슈퍼콘	1700	0
E001	빵또아	2600	0
E002	투게더	2500	0
E003	팥빙수	2500	0
E004	셀렉션	2600	0
E005	설레임	2700	0
*/



--------------------------------------------------------------------------------

--■■■ 프로시저 내에서의 예외 처리 ■■■--


--○ 실습 테이블 생성(TBL_MEMBER)
CREATE TABLE TBL_MEMBER
( NUM NUMBER
, NAME VARCHAR2(30)
, TEL VARCHAR2(60)
, CITY VARCHAR2(60)
, CONSTRAINT MEMBER_NUM_PK PRIMARY KEY(NUM)
);
--==>> Table TBL_MEMBER이(가) 생성되었습니다.


--○ 생성한 프로시저가 제대로 작동하는지의 여부 확인

EXEC PRC_MEMBER_INSERT('박범구','010-1111-1111','서울');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_MEMBER_INSERT('김경태','010-2222-2222','부산');
--==>> 에러 발생(ORA-20001: 서울,경기,대전만 입력이 가능합니다.)

SELECT *
FROM TBL_MEMBER;
--==>> 1	박범구	010-1111-1111	서울

DESC TBL_상품;

--○ 실습 테이블 생성(TBL_출고)
CREATE TABLE TBL_출고
( 출고번호  NUMBER
, 상품코드  VARCHAR2(20)
, 출고일자  DATE DEFAULT SYSDATE
, 출고수량  NUMBER
, 출고단가  NUMBER
);
--==>> Table TBL_출고이(가) 생성되었습니다.


-- 출고번호 PK 지정

ALTER TABLE TBL_출고
ADD CONSTRAINT 출고_출고번호_PK PRIMARY KEY(출고번호);
--==>> Table TBL_출고이(가) 변경되었습니다.

-- 상품코드 FK 지정
ALTER TABLE TBL_출고
ADD CONSTRAINT 출고_상품코드_FK FOREIGN KEY(상품코드)
        REFERENCES TBL_상품(상품코드);
--==>> Table TBL_출고이(가) 변경되었습니다.


SELECT *
FROM TBL_상품;
--==>>
/*
H001	바밤바	600	    30
H002	죠스바	500	    30
H003	보석바	500	    20
H004	누가바	600	    70
H005	쌍쌍바	700	    0
H006	수박바	500	    0
H007	알껌바	500	    0
C001	빵빠레	1600	20
C002	월드콘	1500	20
C003	메타콘	1500	20
C004	구구콘	1600	20
C005	슈퍼콘	1700	0
E001	빵또아	2600	0
E002	투게더	2500	0
E003	팥빙수	2500	0
E004	셀렉션	2600	0
E005	설레임	2700	0
*/

SELECT *
FROM TBL_입고;

SELECT *
FROM TBL_출고;
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
10	H003	2023-11-06	15	500
*/


-- 생성한 프로시저가 제대로 작동하는지의 여부 확인
-- 현재 상품 테이블의 바밤바 재고수량은 70개
EXEC PRC_출고_INSERT('H001', 10, 600);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.
-- H001	바밤바	600	60

EXEC PRC_출고_INSERT('H001', 80, 600);
--==>> 에러 발생(ORA-20002: 입력한 출고수량이 재고수량을 초과했습니다.)

EXEC PRC_출고_INSERT('C001', 20, 1500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_출고_INSERT('C001', 20, 1500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_출고_INSERT('C001', 10, 1500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_출고_INSERT('C001', 30, 1500);
--==>> 에러 발생 (ORA-20002: 입력한 출고수량이 재고수량을 초과했습니다.)


EXEC PRC_출고_INSERT('H001', 10, 500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.
EXEC PRC_출고_INSERT('H001', 10, 500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.
EXEC PRC_출고_INSERT('H001', 10, 500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.


EXEC PRC_출고_INSERT('H002', 20, 500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_출고_INSERT('H003', 15, 500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.



EXEC PRC_출고_UPDATE(8, 10);


SELECT *
FROM TBL_상품;














