drop procedure if exists main;

set @query = "
select artshow.UID, artshow.category
from artshow, showInfo
where artshow.UID = showInfo.artshowUID
";
set @inputStartDate = NULL;
set @inputEndDate = NULL;
set @inputLocation = NULL;
set @inputCategoryID = 1;

delimiter //
create procedure main()
begin 

	if not isnull(@inputStartDate) then
		set @query = concat(@query, " and showInfo.time >= @inputStartDate");
	end if;
	if not isnull(@inputEndDate) then
		set @query = concat(@query, " and showInfo.time <= @inputEndDate");
	end if;
	if not isnull(@inputLocation) then
		set @query = concat(@query, " and instr(showInfo.location, @inputLocation collate utf8mb4_unicode_ci)");
	end if;	
	if not isnull(@inputCategoryID) then
		set @query = concat(@query, " and artshow.category = @inputCategoryID");
	end if;
end//
delimiter ;

call main();
prepare stmt from @query;
execute stmt;


