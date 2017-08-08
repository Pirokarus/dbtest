CREATE TABLE IF NOT EXISTS public.users
(
  id         		serial         		PRIMARY KEY,
  login    		VARCHAR(255)         	UNIQUE NOT NULL,
  pussword              VARCHAR(255)  		UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS groups
(
  id         		serial         		PRIMARY KEY,
  name    		VARCHAR(255)         	NOT NULL,
  user_id              	INTEGER	  		NOT NULL REFERENCES users(id) ON DELETE CASCADE 
);

CREATE TABLE IF NOT EXISTS contacts
(
  id         		serial         		PRIMARY KEY,
  firstName    		VARCHAR(255)         	NOT NULL,
  lastName    		VARCHAR(255)         	,
  number    		VARCHAR(255)         	NOT NULL,
  user_id              	INTEGER	  		NOT NULL REFERENCES users(id) ON DELETE CASCADE 
);

CREATE TABLE IF NOT EXISTS references_table
(
  id         		serial         		PRIMARY KEY,
  contactId    		INTEGER         	NOT NULL REFERENCES contacts(id)  ON DELETE CASCADE,
  groupId              	INTEGER	  		NOT NULL REFERENCES groups(id) ON DELETE CASCADE 
);
