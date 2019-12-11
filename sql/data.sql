-- Include table data insertion, updation, deletion and select scripts
desc movie;
insert into movie values(1, 'Avatar', 2787965087, 'Yes', '2017-03-15', 'Science Fiction', 'Yes');
insert into movie values(2, 'The Avengers', 1518812988, 'Yes', '2017-12-23', 'Superhero', 'No');
insert into movie values(3, 'Titanic', 2187463944, 'Yes', '2017-08-21', 'Romance', 'No');
insert into movie values(4, 'Jurassic World', 1671713208, 'No', '2017-07-02', 'Science Fiction', 'Yes');
insert into movie values(5, 'Avengers: End Game', 2750760348, 'Yes', '2022-11-02', 'Superhero', 'Yes');
select * from movie;

select * from movie where mv_active='Yes' and datediff(curdate(), mv_date_of_launch)>=0;

select * from movie where mv_id=1;
update movie set mv_title='Joker', mv_box_office=1023157987, mv_active='Yes', mv_date_of_launch='2017-10-25', mv_genre='Thriller', mv_has_teaser='No' where mv_id=1;

desc user;
insert into user values(101, 'Ram');
insert into user values(102, 'Shyam');
select * from user;
desc favorites;
insert into favorites values(1001, 102, 1);
insert into favorites values(1002, 102, 2);
insert into favorites values(1003, 102, 3);
select * from favorites;

select * from favorites inner join movie on fv_mv_id=mv_id where fv_us_id=102;
select count(fv_id) from favorites inner join movie on fv_mv_id=mv_id where fv_us_id=102;

delete from favorites where fv_us_id=102 and fv_mv_id=3;
select * from favorites;