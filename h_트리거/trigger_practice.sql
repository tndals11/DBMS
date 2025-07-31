-- 문제1
-- 	선수(players)가 삭제될 때, 
-- 	해당 선수의 이름과 삭제 시각을 player_delete_logs 테이블에 기록하는 트리거를 생성
--     
-- 	>> 로그 테이블이 없으면 먼저 생성하고, 트리거명: after_player_delete
	
	drop table `player_delete_logs`;
    
	create table if not exists `player_delete_logs` (
		log_id bigint auto_increment primary key,
		player_name varchar(100),
		DeleteDate datetime -- 변경된 날짜
	);

    
	drop trigger if exists `after_player_delete`;
    
    
    delimiter $$
    
    create trigger `after_player_delete`
		after delete
		on `players`
		for each row
	begin
		insert into player_delete_logs(player_name, DeleteDate)
        values
			(OLD.name, now());
            
end $$


delimiter ;

INSERT INTO `players`
VALUES
	(201, '테스트 선수1', '타자', '1999-03-03', 2);

-- 삭제 전 로그 확인
SELECT * FROM player_delete_logs;

-- 테스트용 선수 삭제
DELETE FROM players WHERE player_id = 201;

-- 삭제 후 로그 확인
SELECT * FROM player_delete_logs;



-- ===== 문제2 ===== 
-- 선수(players)의 포지션(position)이 변경될 경우
-- , 이전 포지션과 변경된 포지션, 선수 이름을 player_position_logs에 기록하는 트리거를 생성
CREATE TABLE IF NOT EXISTS player_position_logs (
	log_id INT AUTO_INCREMENT PRIMARY KEY,
    player_name VARCHAR(50),
    old_position VARCHAR(20),
    new_position VARCHAR(20),
    changed_time datetime
);

drop trigger if exists `after_player_position_update`;

delimiter $$

create trigger `after_player_position_update`
	after update
    on `players`
    for each row
begin
	if OLD.position != NEW.position then
	insert into player_position_logs(player_name, old_position, new_position, changed_timee)
	values
		(NEW.name, OLD.position, NEW.position, now());
	end if;
end $$

delimiter ;

USE


INSERT INTO `players`;
VALUES
	(201, '테스트 선수1', '타자', '1999-03-03', 2);
    
select * from `players`;    
    
-- 포지션 변경 전 로그 확인
SELECT * FROM player_position_logs;

-- 포지션 변경
UPDATE players SET position = '외야수' WHERE player_id = 201;

-- 포지션 변경 후 로그 확인
SELECT * FROM player_position_logs;
    