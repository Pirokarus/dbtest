CREATE FUNCTION number_users () RETURNS INTEGER AS '
DECLARE
i INTEGER;
BEGIN
SELECT count(*) FROM users into i;
RETURN i;
END;
' LANGUAGE plpgsql;

CREATE FUNCTION users_contacts ()
  RETURNS TABLE(user_name VARCHAR(250), contacts_number INTEGER) AS '
BEGIN
  RETURN QUERY SELECT users.login,COUNT(contacts.user_id) FROM contacts JOIN users ON contacts.user_id = users.id
  GROUP BY contacts.user_id,users.login;
END;
' LANGUAGE plpgsql;

CREATE FUNCTION avg_number_of_contacts_in_group () RETURNS INTEGER AS '
DECLARE
i INTEGER;
BEGIN
SELECT avg(foo)  FROM (select count(*) as foo from references_table group by group_id) as t into i;
RETURN i;
END;
' LANGUAGE plpgsql;

CREATE FUNCTION avg_number_of_contacts_of_user () RETURNS INTEGER AS '
DECLARE
i INTEGER;
BEGIN
SELECT avg(foo)  FROM (select count(*) as foo from contacts group by user_id) as t into i;
RETURN i;
END;
' LANGUAGE plpgsql;

CREATE FUNCTION users_groups ()
  RETURNS TABLE(user_name VARCHAR(250), contacts_number INTEGER) AS '
BEGIN
  RETURN QUERY SELECT users.login,COUNT(groups.user_id) FROM groups JOIN users ON groups.user_id = users.id
  GROUP BY groups.user_id,users.login;
END;
' LANGUAGE plpgsql;

CREATE FUNCTION dream_user ()
  RETURNS TABLE(user_name VARCHAR(250)) AS '
BEGIN
  RETURN QUERY SELECT u.login from users u join(select user_id from contacts
  group by user_id having count(*)<10) c on u.id=c.user_id;
END;
' LANGUAGE plpgsql;

CREATE FUNCTION add_user(_login VARCHAR(255), _ppussword VARCHAR(255)) RETURNS void AS'
BEGIN
INSERT INTO public.users (login, password ) VALUES (_login,_ppussword);
END;
'LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION add_group(_name VARCHAR(255),_userId INTEGER) RETURNS void AS '
BEGIN
INSERT INTO groups(
name,
user_id
) VALUES (
_name,
_userId
);
END;
'LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION add_contact(_firstName VARCHAR(255),_lustName VARCHAR(255),_number VARCHAR(255),_userId INTEGER)RETURNS void AS '
BEGIN
INSERT INTO contacts(
firstName,
lastName,
number,
user_id
) VALUES (
_firstName,
_lustName,
_number,
_userId
);
END;
'LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION add_contact_to_group(_contact_id INTEGER,_group_id INTEGER)RETURNS void AS '
BEGIN
INSERT INTO references_table(
  contact_id,
group_id
) VALUES (
  _contact_id,
  _group_id
);
END;
'LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_user(
_id INTEGER
)
RETURNS void AS'
BEGIN
DELETE FROM users
WHERE id = _id;
END;
'LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_contact(
  _id INTEGER
)
  RETURNS void AS'
BEGIN
DELETE FROM contacts
WHERE id = _id;
END;
'LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_group(
  _id INTEGER
)
  RETURNS void AS'
BEGIN
DELETE FROM groups
WHERE id = _id;
END;
'LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_contact_from_user(
  _contact_id INTEGER,_group_id INTEGER
)
  RETURNS void AS'
BEGIN
DELETE FROM references_table
WHERE contact_id = _contact_id AND group_id = _group_id;
END;
'LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_group(_name VARCHAR(255),_userId INTEGER) RETURNS void AS '
BEGIN
  UPDATE groups
  SET
    name = _name
  WHERE id = _id;
END;
'LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_contact(_firstName VARCHAR(255),_lustName VARCHAR(255),_number VARCHAR(255),_userId INTEGER)RETURNS void AS '
BEGIN
  UPDATE contacts
  SET
    firstName = _firstName,
    lastName = _lustName,
    number = _number
  WHERE id = _id;
END;
'LANGUAGE plpgsql;

CREATE FUNCTION update_user(_login VARCHAR(255), _ppussword VARCHAR(255)) RETURNS void AS'
BEGIN
  UPDATE users
  SET
    login = _login,
    pussword = _pussword
  WHERE id = _id;
END;
'LANGUAGE plpgsql;
