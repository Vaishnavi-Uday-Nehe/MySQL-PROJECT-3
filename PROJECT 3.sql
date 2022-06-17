use project1;
select concat(fname,lname)as "full name"
,timestampdiff(year,dob,'2016-08-05')as Age
, case
		when str_to_date(concat(month(dob),'/',day(dob),'/',year('2016-08-05')),'%m/%d/%Y')>='2016-08-05'
			then "Call Today"
        when case
			when str_to_date(concat(month(dob),'/',day(dob),'/',year('2016-08-05')),'%m/%d/%Y')>='2016-08-05'
				then str_to_date(concat(month(dob),'/',day(dob),'/',year('2016-08-05')),'%m/%d/%Y')
			else date_add(str_to_date(concat(month(dob),'/',day(dob),'/',year('2016-08-05')),'%m/%d/%Y') , interval 1 year)
			end <= date_add('2016-08-05' , interval 14 day)
			then 'SEND A CARD'
		else concat('birthday is in ' , monthname(dob))
end as todo
from bday
where case
   when str_to_date(concat(month(dob),'/',day(dob),'/',year('2016-08-05')),'%m/%d/%Y')>='2016-08-05'
		then str_to_date(concat(month(dob),'/',day(dob),'/',year('2016-08-05')),'%m/%d/%Y')
	else date_add(str_to_date(concat(month(dob), '/' , day(dob), '/' , year('2016-08-05')), '%m/%d/%Y'), interval 1 year)

end between '2016-08-05'and date_add('2016-08-05',interval 6 month);