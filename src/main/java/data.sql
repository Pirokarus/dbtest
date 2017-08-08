select add_user('user1','user1');
select add_user('user2','user2');

select add_group('u1_people',1);
select add_group('u1_companies',1);
select add_group('u2_people',2);

select add_contact('Petr','Petrov','89999',1);
select add_contact('Ivan','Ivanov','88888',1);
select add_contact('Pavel','Pavlov','77777',1);
select add_contact('Sergey','Sergeev','66666',1);
select add_contact('Lev','Lvov','111111',1);
select add_contact('Andrey','Andreev','22222',1);
select add_contact('Petr','Ivanov','33333',1);
select add_contact('Ivan','Petrov','44444',1);
select add_contact('Pavel','Petrov','555555',1);
select add_contact('Sergey','Petrov','89664999',1);
select add_contact('Lev','Petrov','8965865999',1);

select add_group_to_contact(1,1);
select add_group_to_contact(2,1);
select add_group_to_contact(3,1);
select add_group_to_contact(4,1);
select add_group_to_contact(5,1);
select add_group_to_contact(6,1);
select add_group_to_contact(7,1);
select add_group_to_contact(8,1);
select add_group_to_contact(9,1);
select add_group_to_contact(10,1);
select add_group_to_contact(11,1);

select add_contact('BELL',NULL,'121212',1);
select add_contact('INTEL',NULL,'787678',1);
select add_contact('AMD',NULL,'545454',1);

select add_group_to_contact(12,2);
select add_group_to_contact(13,2);
select add_group_to_contact(14,2);

select add_contact('Petr','Petrov','89999',2);
select add_contact('Ivan','Ivanov','88888',2);
select add_contact('Pavel','Pavlov','77777',2);
select add_contact('Sergey','Sergeev','66666',2);
select add_contact('Lev','Lvov','111111',2);

select add_group_to_contact(15,3);
select add_group_to_contact(16,3);
select add_group_to_contact(17,3);
select add_group_to_contact(18,3);
select add_group_to_contact(19,3);

