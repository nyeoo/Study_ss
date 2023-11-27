
SELECT USER
FROM DUAL;
--==>> SCOTT


SELECT *
FROM TBL_MEMBER
ORDER BY SID;
--==>>
/*
==============================
SID	NAME     TEL
==============================
1	이윤수	010-1111-1111
2	임하성	010-2222-2222
3	김민지	010-3333-3333
4	문정환	010-5555-5555
5	정한울	010-6666-6666
6	길현욱	010-7777-7777
7	이윤수	010-8888-8888
==============================
*/



TRUNCATE TABLE TBL_MEMBER;
--==>> Table TBL_MEMBER이(가) 잘렸습니다.


SELECT *
FROM TBL_MEMBER
ORDER BY SID;
--==>> 조회 결과 없음


DROP SEQUENCE MEMBERSEQ;
--==>> Sequence MEMBERSEQ이(가) 삭제되었습니다.



--○ CallableStatement 실습을 위한 프로시저 작성
--   프로시저 명   : PRC_MEMBERINSERT
--   프로시저 기능 : TBL_MEMBER 테이블에 데이터를 입력하는 프로시저



-- 이름이랑 전화번호만 넘기면 자동으로 INSERT

CREATE OR REPLACE PROCEDURE PRC_MEMBERINSERT
( V_NAME        IN TBL_MEMBER.NAME%TYPE
, V_TEL         IN TBL_MEMBER.TEL%TYPE
)
IS
 V_SID       TBL_MEMBER.SID%TYPE;
BEGIN
    
    SELECT NVL(MAX(SID), 0) + 1 INTO V_SID
    FROM TBL_MEMBER;

    
    INSERT INTO TBL_MEMBER(SID, NAME, TEL)
    VALUES (V_SID, V_NAME, V_TEL);
    
    COMMIT;
END;






-- 선생님 풀이
--CREATE OR REPLACE PROCEDURE PRC_MEMBERINSERT2
--( VNAME IN TBL_MEMBER.NAME%TYPE
--, VTEL IN TBL_MEMBER.TEL%TYPE)
--IS
--    -- 주요 변수 선언
--    VSID    TBL_MEMBER.SID%TYPE;
--BEGIN
--    -- 기존 SID 의 최대값 얻어오기
--    SELECT NVL(MAX(SID), 0) INTO VSID
--    FROM TBL_MEMBER;
--
--    -- 데이터 입력(INSERT 쿼리문 수행)
--    INSERT INTO TBL_MEMBER(SID, NAME, TEL)
--    VALUES ((VSID +1), VNAME, VTEL); 
--
--    COMMIT;
--END;


--○ Test001.java 실행 후 확인
SELECT *
FROM TBL_MEMBER;
--==>>
/*
1	김다슬	010-1111-1111
2	오수경	010-2222-2222
3	김경태	010-3333-3333
4	박범구	010-4444-4444
*/


--○ CallableStatement 실습을 위한 프로시저 작성
-- 프로시저 명 : PRC_MEMBERSELECT
-- 프로시저 기능 : TBL_MEMBER 테이블의 데이터를 읽어오는 프로시저
--  ※ 『SYS_REFCURSOR』 자료형을 이용하여 커서 다루기
CREATE OR REPLACE PROCEDURE PRC_MEMBERSELECT
( VRESULT   OUT SYS_REFCURSOR
)
IS
    -- 주요 변수 선언
    -- → 커서 정의 → 출력용 매개변수로 대체
BEGIN
    OPEN VRESULT FOR
        SELECT SID, NAME, TEL
        FROM TBL_MEMBER
        ORDER BY SID;
        
    -- CLOSE VRESULT;       (참조형태의 커서를 사용할 때는 별도로 닫지 않는다. 자바에서 열지 못하기 때문..)
    -- COMMIT;    
        
END;
--==>> Procedure PRC_MEMBERSELECT이(가) 컴파일되었습니다.




































