
-- =============================================
     --Пример процедуры
-- =============================================
ALTER PROCEDURE [dbo].[up_R0807009]
	 @d_Period_b varchar(10),
	 @d_Period_e varchar(10)  
AS
BEGIN
	SET NOCOUNT ON;

select a.*,rtrim(d.Fam)+' '+d.Inicial+'  Таб.№.'+ltrim(str(tn)) as fio,d.Tn,e.MarkaIzd,c.numMash,b.d_neisp,b.d_Vosst,
 cast((DATEDIFF(hour, b.d_neisp, b.d_Vosst)) *1.000/24 as dec (11,2)) as KolCh  ,b.Prost_Hoz,sr_vrustr, 
 case when prost_hoz =0 then cast((DATEDIFF(hour, b.d_neisp, b.d_Vosst)) *1.000/24 as dec (11,2)) end as v_zav  ,
 case when prost_hoz =1 then cast((DATEDIFF(hour, b.d_neisp, b.d_Vosst)) *1.000/24 as dec (11,2)) end as v_hoz  ,
 f.kol_otk 
 into #p1 from F080704 a  
       left join F080701 b on a.Id_Act=b.Id_Act 
       left join F080601 c on b.Id_Mash=c.Id_Mash 
       left join kadr    d on a.Id_kadr=d.Id 
       left join s0873 e   on c.kMash=e.kMash
       left join ( select Id_Act,COUNT(Id_Otkaz) as kol_otk from ukch..F080702 group by Id_Act) f on a.Id_Act=f.Id_Act 
       left join ( 
            select a.Id_kadr,SUM(kol_otk) as kol_otksr,
            SUM(isnull(case when prost_hoz =0 then cast((DATEDIFF(hour, b.d_neisp, b.d_Vosst)) *1.000/24 as dec (10,2)) end,0)) as v_zav,
             cast(SUM(isnull(cast((DATEDIFF(hour, b.d_neisp, b.d_Vosst)) *1.000/24 as dec (7,2)),0))/sum(kol_otk)  AS dec (7,2)) as sr_vrustr
  from F080704 a
 left join (select  Id_Act,COUNT(Id_Otkaz) as kol_otk from ukch..F080702 group by Id_Act) f on a.Id_Act=f.Id_Act
 left join F080701 b on a.Id_Act=b.Id_Act
 where 1=1 and  convert(date,b.d_vosst,104)>=convert(datetime,@d_Period_b,104) and convert(date,b.d_vosst,104)<=convert(datetime,@d_Period_e,104)
 group by  a.Id_kadr ) j on a.Id_kadr=j.Id_kadr
  where 1=1  and  convert(date,b.d_vosst,104)>=convert(datetime,@d_Period_b,104) and convert(date,b.d_vosst,104)<=convert(datetime,@d_Period_e,104)
 order by fio,b.Id_Mash,b.d_neisp,b.d_Vosst 
 
 select *, case when a.KolCh>=5 then '+' end as prost5 from #p1 a   
	
END
