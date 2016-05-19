drop procedure lidar_detach;
create procedure lidar_detach(tname varchar(255))
begin atomic
	declare fileID integer;
	set fileID = (select l.file_id from lidar_tables l where l.name like lower(tname));
	drop table tname;
	delete from lidar_tables where file_id = fileID;
	delete from lidar_columns where file_id = fileID;
	delete from lidar_files where id = fileID;
end;
