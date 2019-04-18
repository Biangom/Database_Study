#인덱스
#Select 검색을 빠르게 하기 위한 DB의 방법
#DB 튜닝시 가장 큰 효과를 볼 수 있는 것이 인덱스이다.
#인덱스는 검색시에는 속도가 빠르지만, 삽입/삭제/수정 시 시간이 많이 걸림
#너무 인덱스를 남용하면 오히려 성능이 떨어진다. 효율적으로 사용하자.
# 장점 : 검색속도 매우 빨라짐, 성능 향상
# 단점 : 대략 데이터베이스 크기의 10% 정도의 추가 공간이 필요하다
#	인덱싱 작업을 하는 동안 시간이 많이 걸린다
#	삽입/삭제/수정 작업이 많이 일어날 경우 성능이 오히려 떨어진다.


# 클러스터형 인덱스 : 실제데이터(Row) 정렬된 위치에 재배치, 재배치 비용은 보조인덱스보다 많이 들음, PRIMARY 컬럼으로 지정, 최대 1개
# 여기서 재배치라는 것은 B-Tree를 만든다는 것임. 추가공간이 필요하다는 것은 leaf 노드들의 위치를 저장하는 그 위의 노드들의 저장 공간을 의미ALTER
# 보조 인덱스 : 실제 데이터(Row)는 건들지 않고, 보조인덱스 컬럼만 재배치, 보통은 클러스터형 인덱스가 빠르다, 여러개 지정 가능.

# 생성방법
# 클러스터형 인덱스 : PRIMARY 컬럼지정으로만 생성 가능
# 보조 인덱스 : UNIQUE 컬럼으로 지정해서 생성 가능

CREATE TABLE userTBL (
	userID varchar(8) PRIMARY key,
    userName varchar(10);
    birthDay int not null
);

# 인덱스 정보보기
SHOW INDEX FROM userTBL;
# Key_name 커럼의 값이 index 정보 : PRIMARY = 클러스터 인덱스, 컬럼명 = 보조인덱스

# 인덱스의 기본 정렬 방법은 B-TREE로 정렬된다.

# CREATE 시에는 클러스터 인덱스 저장안하고, 중간에 지정하는 방법
ALTER TABLE 테이블명
	ADD CONSTRAINT 작업명
	PRIMARY KEY (컬럼명);

# CREATE 시에는 보조 인덱스 지정안하고, 중간에 지정하는 방법
ALTER TABLE 테이블명
	ADD CONSTRAINT 작업명
    UNIQUE (컬럼명);

CREATE INDEX 작업명
	ON 테이블명(컬럼명); # 오로지 보조 인덱스 생성만 가능하다.
    
# 인덱스 삭제하기
DROP INDEX 작업명 ON 테이블명; # 보조인덱스 삭제

DROP INDEX `PRIMARY` ON 테이블명;  # 클러스터형 인덱스 삭제
ALTER TABLE 테이블명 DROP PRIMARY KEY; # 클러스터형 인덱스 삭제


# 정리
# 인덱스는 컬럼에 지정한다.
# 자주사용하는 컬럼에 지정해야 성능이 좋아진다.
# 특히 조인을 자주하는 컬럼에 인덱스를 생성하는 것이 좋다.

# 경우에 따라 PRIMARY 키가 없는 경우가 더 성능에 좋을 수 있따.
# 즉 정렬이 필요없는 로그데이터 같은 경우가 그렇다.

# WS4
CREATE INDEX work1
	ON emp(ename);

desc product;

select * from product;




