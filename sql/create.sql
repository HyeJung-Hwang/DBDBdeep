use db2022team02;

CREATE TABLE DB2022_식당 (
식당이름  VARCHAR(10)	 NOT NULL,
식당주소    VARCHAR(30)	 NOT NULL,
PRIMARY KEY(식당이름)
);
CREATE INDEX db2022_식당이름 on DB2022_식당(식당이름);
describe DB2022_식당;

CREATE TABLE DB2022_메뉴 (
식당이름  VARCHAR(10)	 NOT NULL,
메뉴	    VARCHAR(10),
PRIMARY KEY(식당이름,메뉴)
);
describe DB2022_메뉴;

CREATE TABLE DB2022_고객정보 (
고객이름  VARCHAR(10)	 NOT NULL,
고객주소    VARCHAR(20)	 NOT NULL,
전화번호	    VARCHAR(10) NOT NULL,
고객아이디  VARCHAR(20) NOT NULL,
어플 VARCHAR(10) NOT NULL,
PRIMARY KEY(고객아이디)
);
CREATE INDEX db2022_고객아이디 on DB2022_고객정보(고객아이디);
describe DB2022_고객정보;

CREATE TABLE DB2022_매출 (
고객아이디  VARCHAR(10)	 NOT NULL,
주문일자    DATETIME	 NOT NULL,
주문금액    INT NOT NULL,
어플  VARCHAR(10) NOT NULL,
PRIMARY KEY(고객아이디,주문일자),
FOREIGN KEY(고객아이디) REFERENCES DB2022_고객정보(고객아이디) on delete cascade
);
describe DB2022_매출;

CREATE TABLE DB2022_배달 (
어플  VARCHAR(10)	 NOT NULL,
배달소요시간    INT	 NOT NULL,
고객주소 VARCHAR(20) NOT NULL,
리뷰내용  VARCHAR(500) NOT NULL,
리뷰평점 INT NOT NULL,
고객아이디 VARCHAR(20) NOT NULL,
주문일자 DATETIME NOT NULL,
PRIMARY KEY(고객아이디, 주문일자),
FOREIGN KEY(고객아이디) REFERENCES DB2022_고객정보(고객아이디) on delete cascade
);
CREATE INDEX db2022_어플 on db2022_배달(어플);
describe DB2022_배달;

CREATE TABLE DB2022_리뷰 (
번호  VARCHAR(100)	 NOT NULL,
식당이름    VARCHAR(20)	 NOT NULL,
고객아이디	    VARCHAR(20) NOT NULL,
리뷰내용  VARCHAR(500) NOT NULL,
리뷰평점 INT NOT NULL DEFAULT 0,
긍부정  INT NOT NULL, 
배달소요시간 INT NOT NULL,
PRIMARY KEY(번호,식당이름),
FOREIGN KEY(고객아이디) REFERENCES DB2022_고객정보(고객아이디) on delete cascade,
FOREIGN KEY(식당이름) REFERENCES DB2022_식당(식당이름) on delete cascade
);
CREATE INDEX db2022_평점 on DB2022_리뷰(리뷰평점);
describe DB2022_리뷰;
