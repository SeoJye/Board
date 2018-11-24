create table users(
   id varchar(8) primary key,
   password varchar(8),
   name varchar(20),
   role int
);

create table board(
   seq int primary key,
   title varchar(200), 
   writer varchar(8),
   content varchar(2000),
   regdate date default sysdate,
   cnt int default 0
);

insert into users values('test','1234','관리자',0);
insert into users values('user1','1234','사용자1',9);
insert into users values('user2','1234','사용자2',9);

insert into board(seq, title, writer, content) values(1,'가입인사','test','hello');
insert into board(seq, title, writer, content) values(2,'하이','user1','hi');