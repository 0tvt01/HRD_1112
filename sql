select * from money_tbl_02;

select custno from money_tbl_02 group by custno;

select custno,sum(price) from money_tbl_02 group by custno;

select custno,sum(price) from money_tbl_02 group by custno order by sum(price) desc;
--group으로 묵은 필드는, gruop에서 동시 사용해야함
select custno,amout,sum(price) from money_tbl_02 group by custno,amout order by sum(price) desc;

select * from member_tbl_02 t1, money_tbl_02 t2 where t1.custno=t2.custno

select t1.custno, t2.custname, t2.grade, sum(t1.price) 
from money_tbl_02 t1,member_tbl_02 t2 
where t1.custno=t2.custno 
group by (t1.custno,t2.custname,t2.grade)
order by sum(t1.price) desc 

--별명처리하기
select t1.custno, t2.custname, 
decode(t2.grade, 'A','VIP','B','일반','C','직원') grade,sum(t1.price) 
from money_tbl_02 t1,member_tbl_02 t2 
where t1.custno=t2.custno 
group by (t1.custno,t2.custname,t2.grade)
order by sum(t1.price) desc 
