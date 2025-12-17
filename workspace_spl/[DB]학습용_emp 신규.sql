-- 12월 15일(월) 수업
SELECT empno, ename, sal, deptno
	FROM emp
	WHERE deptno = 10;
SELECT empno, ename, sal, deptno
	FROM emp
 WHERE deptno = 10
UNION
SELECT empno, ename, sal, deptno
	FROM emp
		WHERE deptno = 10;
	--Q1
SELECT ename
	FROM emp
	WHERE ename LIKE '%S';
	--Q2
SELECT DEPTNO, JOB, ENAME, SAL, DEPTNO  
	FROM EMP
	WHERE DEPTNO = 30 AND job = 'SALESMAN';
--Q3-1
SELECT sal, empno, ename, deptno, JOB 
	FROM emp
	WHERE DEPTNO IN (20, 30) AND sal > 2000;
--Q3-2   오류
SELECT ENAME, EMPNO, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO 20, 30
AND (sal > 2000);




--Q4
SELECT SAL, EMPNO, ENAME, DEPTNO, JOB
	FROM  EMP
	WHERE NOT SAL > 2000 OR SAL < 3000;
	--Q5
SELECT ENAME, EMPNO, SAL, DEPTNO FROM EMP
WHERE
ENAME LIKE '%E%'
AND DEPTNO = 30
AND (SAL > 2000 
OR SAL < 1000 )

 --Q6
SELECT * 
FROM EMP
WHERE MGR IS NOT NULL  
AND ENAME not LIKE '_L%'
AND COMM IS NULL 
 AND (JOB = 'MANAGER'
OR JOB = 'CLERK');


SELECT * FROM EMP
WHERE UPPER(ENAME) = UPPER('scott');
 --입력값 소문자, 대문자로 동일하게 분류
SELECT 1 FROM DUAL;
SELECT UPPER('aBc'), lower('AbC'), upper(lower('aBc')) FROM dual;

SELECT * FROM EMp
WHERE lower(ename) LIKE LOWER('%AM%');

SELECT ename, LENGTH(ename)
FROM emp;
 -- 글자수 확인하기
SELECT * FROM EMP
WHERE LENGTH(ename) = 6

--    12월 15일(월) 자습 
SELECT EMPNO, DEPTNO
	FROM EMP;

SELECT DISTINCT DEPTNO
	FROM EMP;

SELECT ENAME, SAL, COMM, SAL+COMM
	FROM EMP;
--  이름, 월급, 보너스, 연간 총 수입 
SELECT ENAME, SAL, COMM, SAL*12+COMM
	FROM EMP;
-- 연간 총 수입 2
SELECT ENAME, SAL, SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+COMM, COMM
	FROM EMP;
-- 연간 총 수입 2에 별칭 적용하기) 테이블 뒤에' 명칭'만 붙여도 작동 한다. 선호 실무용은 테이블 뒤에 ' AS 명칭'이다.
SELECT ENAME AS 이름, SAL AS 월급, SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+COMM AS 연봉, COMM AS 보너스
	FROM EMP;
-- ORDER BY를 이용하여 모든 열을 급여기준 오름차순(ASC)으로 정렬하기
-- ORDER BY를 이용하면 출력시간이 늘어난다. 꼭 필요한 경우가 아니면 사용을 자제하는게 좋다.
SELECT *
	FROM EMP
ORDER BY SAL ASC;
-- 내림차순으로 만들기 
SELECT *
	FROM EMP
ORDER BY SAL DESC; --이처럼 SAL열 옆에 DESC를 쓰면 내림차순으로 설정됨.

--SAL은 오름차순, DEPTNO는 내림차순으로 만들기 
SELECT *
	FROM EMP
ORDER BY SAL ASC, DEPTNO DESC;
-- 97P, Q,2 풀이
SELECT DISTINCT JOB
	FROM EMP;
-- Q,3 플이
SELECT EMPNO AS EMPLOYEE_NO, ENAME AS EMPLOYEE_NAME, MGR AS MANAGER, SAL AS SALARY, COMM AS COMMISSION, DEPTNO AS DEPARTMENT_NO
	FROM EMP
	ORDER BY DEPTNO DESC, ENAME ASC;
-- WHERE 활용하면 필요 데이터만 출력가능
SELECT *
	 FROM EMP
WHERE DEPTNO = 30;
-- AND연산자로 여러 개 조건식 사용
SELECT *
	FROM EMP
WHERE DEPTNO = 30
	AND JOB = 'SALESMAN';
-- OR연산자로 여러 개의 출력조건 사용
SELECT *
	FROM EMP
WHERE DEPTNO = 30
	OR JOB = 'CLERK';
	--AND는 그리고, OR은 혹은이니까 AND는 입력한 조건식을 모두 만족할 경우 출력, OR은 하나라도 만족하면 출력
	-- 산술연산자사용 - WHERE절에 산술연산자를 직접 사용하는 경우는 드물다.
SELECT *
	FROM EMP
WHERE SAL*12 = 36000;

--비교연산자 급여 3000 이상 사원 조회
SELECT *
	FROM EMP
WHERE SAL >= 3000;

SELECT *
	FROM EMP
WHERE SAL >= 2500
AND JOB = 'ANALYST';
-- 이름의 첫 문자가 F와 같거나 F보다 뒤에있는 것만 찾기
SELECT *
	FROM EMP
	WHERE ENAME >= 'F';
-- 문자열을 비ㄱ교할 때 영어 사전처럼 알파벳 순서로 문자열의 '대소'를 비교함 (알고는 있자)
SELECT *
	FROM EMP
WHERE ENAME <= 'FORZ';
--등가비교 연산자에서 = 는 바르게, !=, <>, ^=는 반대로 반환한다. 아래 내용은 월급이 3000이 아닌 사람들을 찾아낸 것이다.
SELECT *
	FROM EMP
WHERE SAL != 3000;
--NOT은 비교 연산자는 아니지만 출력값이 위의 결과값과 같도록 하기위해 사용 할 수 있는 연산자 
SELECT *
	FROM EMP
WHERE NOT SAL = 3000;

--IN 활용 IN은 OR과 같이 특정 열 데이터 값을 조회할 때 사용
SELECT *
	FROM EMP
WHERE JOB IN ('MANAGER', 'CLERK', 'SALESMAN');
--IN은 비교연산자와 호환이 안됨..
SELECT *
	FROM EMP
WHERE SAL IN (2000, 3000);
-- NOT IN을 이용하여 '이것'과'이것' 이 아닌 다른 직업들을 찾을 수 있다.
SELECT *
	FROM EMP
WHERE JOB NOT IN ('MANAGER', 'ANALYST');

--BETWEEN A AND B연산자를 사용해서 급여가 2000~3000인 사원 데이터를 출력 해보자. -WHERE [열 이름] BETWEEN 최솟값 AND 최댓값;
SELECT *
	FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;
-- 위의 입력값에서 NOT을 추가해 급여가 2000~3000이 아닌 데이터를 출력해보자
SELECT *
	FROM EMP
WHERE SAL NOT BETWEEN 2000 AND 3000;

--LIKE 연산자 사용
SELECT *
	FROM EMP
WHERE ENAME LIKE 'S%';

SELECT *
	FROM EMP
WHERE ENAME LIKE '%M%';

SELECT *
	FROM EMP
WHERE ENAME LIKE '_L%';

--NOT 추가해서 이름에'S'가 포함하지 않은 사원 찾기
SELECT *
	FROM EMP
WHERE NOT ENAME LIKE '%S%'; 

--NULL은 관측하기 전의 양자역학이다. 값이 정해지지 않았다. 그러므로 
--SELECT *
--	FROM EMP
--WHERE COMM = NULL;은 나오지 않는다. 쉽게 이해하려면 NULL은 NULL일수도, 10일수도, 20 혹은 30일 수도 있다. 
-- 그렇다면 NULL을 관측하기 위해선 어떻게 해야할까? 방법은 아래처럼 IS NULL을 사용 하는 것이다.
SELECT *
	FROM EMP
WHERE COMM IS NULL; --이렇게 하면 COMM이 NULL인것들이 관측 된다. 즉 IS NULL은 관측하기 위한 행동이다.

-- IS NOT NULL을 이용하여 NULL이 아닌것 들만 관측 할 수도 있다.
SELECT *
	FROM EMP
	WHERE COMM IS NOT NULL;
--이상 121P 까지 내용을 다루었다.

--12월 16일(화)
 SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5)
 	FROM EMP;

SELECT
 SUBSTR(ENAME, 1, 2),
 RPAD(SUBSTR(ENAME, 1, 2), LENGTH(ENAME), '*')
  FROM EMP;

--앞 두글자 *처리  (오류)
 SELECT 
  ENAME,
 SUBSTR(ENAME, 3),
 LPAD(SUBSTR (ENAME, 3), LENGTH), '*')
  FROM emp;
-- trim 독학해야함
SELECT 
	'[' 

--round 버림
 SELECT 
 	round(14.46),
 	round(14.46, 0),
round(14.46, 1),
round(14.46, -1)
FROM EMP;

--trunc 버림
SELECT 
	trunc(14.46),
	trunc(14.46, 0),
	trunc(14.46, 1),
	trunc(14.46, -1),
	trunc(-14.46)
	FROM emp;
--ceil 올림
SELECT 
	ceil(3.14),
	floor(3.14),
	ceil(-3.14),
	floor(-3.14),
	trunc(-3.14)
	FROM emp;

--mod 나머지 값
 SELECT
  MOD(15,6)
   FROM DUAL;
SELECT 
	MODE(15,0)
	FROM DUAL;

SELECT 
	MOD(6,3 ),
	MOD(7,3 ),
	MOD(8,3 ),
	MOD(9,3 )
FROM DUAL;
-- 날짜 데이터를 다루는 날짜함수 155P 중요도 높음
SELECT SYSDATE FROM DUAL;
-- 쉬는시간
SELECT ROUND(1314.1592),
    ROUND(1314.1592, 0),
	ROUND(1314.1592, 1)  
	FROM DUAL;
SELECT TRUNC(314.1592),
	TRUNC(314.1592, 0),
	TRUNC(314.1592, 1),
	TRUNC(314.1592, 2),
	TRUNC(314.1592, -1),
	TRUNC(314.1592, -2)
	FROM DUAL;

-- TO_CHAR   문자는 " "로 감싸야함.  예시:"시간"
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD/"시간" HH24:MI:SS') AS 시간 --HH24 24시간제, HH 12시간제, MI 분, SS 초
	FROM DUAL;

SELECT * FROM EMP
WHERE HIREDATE > TO_DATE('1981/06/01', 'YYYY/MM/DD')   
-- NVL(NULL) 처리함수 
SELECT SAL, COMM,
NVL(COMM, 0),
SAL+NVL(COMM, 0),
SAL+COMM
FROM EMP;

SELECT JOB, SAL,
	DECODE(JOB,
	'MANAGER', SAL*1.1,
	'SALESMAN', SAL*1.05,
	'ANALYST', SAL,
	SAL*1.03) AS UPASL

FROM EMP;
--CASE 활용 177P
SELECT EMPNO, ENAME, JOB, SAL,
	CASE JOB
	WHEN 'MANAGER' THEN SAL*1.1
	WHEN 'SALESMAN' THEN SAL*1.05
	WHEN 'ANALYST' THEN SAL
	ELSE SAL*1.03
	END AS UPSAL
	FROM EMP;
--WHEN: 조건값 입력    THEN:조건에 해당될 때 결과 값 출력
SELECT COMM,
	CASE 
		WHEN COMM IS NULL THEN '해당안됨'
		WHEN COMM = 0 THEN '수당없음'
		WHEN COMM > 0 THEN '수당 : ' || COMM
	END AS "수당"
	FROM EMP;

--179P Q,2
SELECT
    EMPNO,
    ENAME,
    SAL,
    SAL / 21.5        AS DAY_PAY,
    (SAL / 21.5) / 8  AS HOUR_PAY
FROM EMP;
	
SELECT EMPNO,
ENAME,
MGR,
 CASE
    WHEN MGR IS NULL THEN 0000
    WHEN TO_CHAR(MGR) LIKE '75%' THEN 5555
    WHEN TO_CHAR(MGR) LIKE'76%' THEN 6666
    WHEN TO_CHAR(MGR) LIKE '78%' THEN 8888
    ELSE MGR
    END AS CHG_MGR
    FROM EMP;

SELECT SAL,
CASE
	WHEN SAL IS NULL THEN 0
	WHEN SAL < 2000 THEN 1
	WHEN 2000 <= SAL AND SAL < 4000 THEN 2
	WHEN 4000 <=SAL THEN 3
	ELSE SAL
	END AS SAL_GRADE
	FROM EMP;

SELECT JOB,
CASE
	WHEN JOB LIKE 'MANAGER' THEN 1
	WHEN JOB LIKE 'ANALYST' THEN 2
	WHEN JOB LIKE 'CLERK' OR JOB LIKE 'SALESMAN' THEN 3
	ELSE 0
	END AS JOB_GRADE
	FROM EMP;
	END

	
	SELECT SAL,
	CASE
		WHEN SAL IS NULL THEN 0
		WHEN SAL < 2000 THEN SAL*0.1
		WHEN SAL >= 2000 THEN SAL*0.05
	END AS BONUS
	FROM EMP;
	
	SELECT SAL,
	CASE 
		WHEN MGR IS NULL THEN 9999
		WHEN TO_CHAR(MGR) LIKE  '75%' THEN 5555
		WHEN TO_CHAR(MGR) LIKE '76%' AND TO_CHAR(MGR)
		 LIKE '77%'
		AND TO_CHAR(MGR)  LIKE '78%' THEN 6666
		ELSE MGR
	END AS NEW_MGR
	FROM EMP;
	-- 12월 16일(화) 은행 업무로 인해 듣지 못한 수업 자습 136~149P
	SELECT *
		FROM EMP
		WHERE UPPER(ENAME) = UPPER('SCOTT');
	--UPPER을 사용하여 사원의 이름이 scott인 사원을 대문자로 찾기
	SELECT *
	FROM EMP
	WHERE UPPER(ENAME) = UPPER ('scott');
	--UPPER, LIKE를 사용하여 사원의 이름중에 scott가 들어간 사원의 이름을 대문자로 찾기
	SELECT *
	FROM EMP
	WHERE UPPER(ENAME) LIKE '%scott%'; 
	--LENGTH를 사용하여 사원들의 이름의 길이를 보기
	SELECT  ENAME, LENGTH(ENAME)
		FROM EMP;
	--사원들의 이름을 대문자로 보기
	SELECT UPPER(ENAME)
		FROM EMP;
--LENGTH와 WHERE를 이용하여 사원의 이름이 5글자 이상인 사원 찾기
	SELECT ENAME,LENGTH(ENAME)
		FROM EMP	
	WHERE LENGTH(ENAME) >= 5;
	--SUBSTR을 사용하여 (문자열데이터, 시작위치, 추출길이 탐색)
	SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB,5, 1)
		FROM EMP;
	--140P 1분복습
	SELECT SUBSTR(ENAME, 3)
	FROM EMP;
	
	--SUBSTR 함수 안에 다른함수(LENGTH) 함께 사용하기
	SELECT JOB,
		SUBSTR(JOB, -LENGTH(JOB)),
		SUBSTR(JOB, -LENGTH(JOB), 2),
		SUBSTR(JOB, -3)
		FROM EMP;
	--143P INSTR 함수로 사원 이름에 문자 S가 있는 사원 찾기
	SELECT *
		FROM EMP
	WHERE INSTR(ENAME, 'S') > 0;
-- LIKE로 찾기	
	SELECT * FROM EMP
	WHERE ENAME LIKE '%S%';
	
	--REPLACE함수로 문자열 안에 있는 특정문자 수정
	SELECT '010-1234-5678' AS BEFORE,
		REPLACE('010-1234-5678', '-', ' ') AS NUMBER1,
		REPLACE('010-1234-5678', '-') AS NUMBER2
		FROM EMP;
	--LPAD와 RPAD 함수 사용하여 출력하기
	SELECT 'OREACLE',
		LPAD('ORACLE', 10, '#') AS LPAD_1,
		RPAD('ORACLE', 10, '#') AS RPAD_1,
		LPAD('ORACLE', 10) AS LPAD_2,
		RPAD('ORACLE', 10) AS RPAD_2
		FROM DUAL;
	
	--RPAD 함수로 개인정보 뒷자리 *표시하여 출력하기
	SELECT
		RPAD('990930-1', 14, '*') AS "주민등록번호",
		RPAD('010-2175-', 13, '*' ) AS "연락처"
		FROM DUAL;
	
	SELECT CONCAT(EMPNO, ENAME), CONCAT(JOB, MGR),
		CONCAT(EMPNO, CONCAT(JOB, CONCAT( ' : ',  ENAME)))
		FROM EMP
		WHERE JOB = 'ANALYST'
		AND ENAME = 'SCOTT';
	-- TRIM 함수로 공백 제거하여 출력 - 삭제할 문자가 없을 때
	SELECT '[' || TRIM(' _ _ORACLE_ _') || ']' AS TRIM,
	'[' || TRIM(LEADING FROM ' _ _ORACLE_ _ ') || ']' AS TRIM_LEDING,
	'[' || TRIM(TRAILING FROM ' _ _ORACLE_ _ ') || ']' AS TRIM_TRAILING,
	'[' || TRIM(BOTH FROM ' _ _ORACLE_ _ ') || ']' AS TRIM_BOTH
	FROM DUAL;
	--삭제할 문자가 있을 때
	SELECT '[' || TRIM('_' FROM '_ _ORACLE_ _') || ']' AS TRIM,
	'[' || TRIM(LEADING '_' FROM '_ _ORACLE_ _') || ']' AS TRIM_LEDING,
	'[' || TRIM(TRAILING '_' FROM '_ _ORACLE_ _') || ']' AS TRIM_TRAILING,
	'[' || T0RIM(BOTH '_' FROM '_ _ORACLE_ _') || ']' AS TRIM_BOTH
	FROM DUAL;
	
	--179P
	SELECT EMPNO,
       SUBSTR(EMPNO, 1, 2)
       || RPAD('*', LENGTH(EMPNO) - 2, '*') AS MASKING_EMPNO,
       ENAME,
       SUBSTR(ENAME, 1, 1)
       || RPAD('*', LENGTH(ENAME) - 1, '*') AS MASKING_ENAME
FROM EMP
WHERE LENGTH(ENAME) = 5;
	 
	
