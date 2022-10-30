--CREATE DATABASE LeaveTrackerDb;
-- Switch to Use LeaveTrackerDb after creating database.


-- Departments Table
CREATE TABLE departments (
  [iddepartments] int NOT NULL IDENTITY,
  [departmentname] varchar(50) DEFAULT NULL,
  PRIMARY KEY ([iddepartments])
);

SET IDENTITY_INSERT departments ON;
INSERT INTO departments (iddepartments, departmentname)
VALUES (1,'Engineering'),(2,'Plumbing'),(3,'Roofing'),(4,'Carpentry'),(5,'Bricklaying'),(6,'Office');
SET IDENTITY_INSERT departments OFF;


-- Roles Table
CREATE TABLE roles (
  [idroles] int NOT NULL IDENTITY,
  [rolename] varchar(50) DEFAULT NULL,
  PRIMARY KEY ([idroles])
);

SET IDENTITY_INSERT roles ON;
INSERT INTO roles (idroles, rolename)
VALUES (1,'Head'),(2,'Deputy Head'),(3,'Manager'),(4,'Senior Member'),(5,'Junior Member'),(6,'Apprentice'),(7,'Admin');
SET IDENTITY_INSERT roles OFF;


-- HolidayStatus Table
CREATE TABLE holidaystatus (
  [idholidaystatus] int NOT NULL IDENTITY,
  [status] varchar(50) DEFAULT NULL,
  PRIMARY KEY ([idholidaystatus])
);

SET IDENTITY_INSERT holidaystatus ON;
INSERT INTO holidaystatus (idholidaystatus, status)
VALUES (1,'Outstanding'),(2,'Invalid'),(3,'Rejected'),(4,'Accepted');
SET IDENTITY_INSERT holidaystatus OFF;


-- Users Table
CREATE TABLE users (
  [idusers] int NOT NULL IDENTITY,
  [roleid] int DEFAULT NULL,
  [departmentid] int DEFAULT NULL,
  [username] varchar(50) DEFAULT NULL,
  [password] varchar(256) DEFAULT NULL,
  [fname] varchar(50) DEFAULT NULL,
  [lname] varchar(50) DEFAULT NULL,
  [phonenumber] varchar(11) DEFAULT NULL,
  [datejoined] date DEFAULT NULL,
  [holidayentitlement] int DEFAULT NULL,
  PRIMARY KEY ([idusers])
 ,
  CONSTRAINT [users_ibfk_1] FOREIGN KEY ([roleid]) REFERENCES roles ([idroles]),
  CONSTRAINT [users_ibfk_2] FOREIGN KEY ([departmentid]) REFERENCES departments ([iddepartments])
);
CREATE INDEX [roleid] ON users ([roleid]);
CREATE INDEX [departmentid] ON users ([departmentid]);

SET IDENTITY_INSERT users ON;
INSERT INTO users (idusers, roleid, departmentid, username, password, fname, lname, phonenumber, datejoined, holidayentitlement)
VALUES (6,7,5,'SyedAhmed65','$2a$11$ijByz9X8TNzismFSagu.HObOSLn.eZZZqNDI3mNtBSyAbhfrmXb1S','Syed','Ahmed','07954484225','2020-02-09',30),(9,7,1,'admin1','$2a$11$lN17faDaY3yP4Xy3ynY5H.aX8.lyNOJtF8NBPHzRkfiuYyIbWMFVu','admin','test','12345678912','2020-02-25',30),(12,5,3,'LMathers87','$2a$11$uCevy1TGBxc8VpHHuHwayu6GXP6yfYeOrliH3eV/oPZNG6nutO1Y6','Louis','Mathers','95123648256','2020-02-26',30),(16,4,1,'JStammers94','$2a$11$1N0W2zjCrPZVkhqVheRAD.Zh0qAty8VVNaL1D9hMDuWcuHDECjG0K','Joshua','Stammers','01235468909','2020-03-10',30),(18,1,1,'EngHJustin6','$2a$11$PqzYa8b6s0hp31IYs0ljiuj5YeuA/Xw7sYoXieNz7BszcNGfvvp1.','test','test','06125154859','2020-03-20',12),(19,2,1,'EngDHLauren2','$2a$11$mmrjDR.4bpEh9bNzo0439uOcKqB8IZF9jHkU0I2Tbi6mI9eVVynd2','test','test','01235495128','2020-03-20',7),(20,3,1,'EngMJohn1','$2a$11$cCxAKbthzoz3YdVTyWp.GOzZJzhP5SSKSVUh6yISy677NrUjPx3rC','test','test','01234567891','2020-03-20',22),(21,3,1,'EngMSteve2','$2a$11$CNL7H6GMaiGvml0lrF1ir.VX.jTntKZLC8KXfFHbwcO5jHiEGOR6m','test','test','01234567891','2020-03-20',22),(22,3,1,'EngMLucy3','$2a$11$jXXiWQwv13LZxCx0soo.zu3KduSvAhuW1plgPBR7MJjG2LbLrVbBa','test','test','01234567891','2020-03-20',26),(23,4,1,'EngSMConnor1','$2a$11$akmzQeSmjwO16COgxnMFauiwGWEgBjrCKgzSBfyc40QWTwomJk1BW','test','test','01234567891','2020-03-20',28),(24,4,1,'EngSMBen2','$2a$11$8giIf1YcNTudbFD9gquvH.ZIiI2SjngzYpK7f7hXRXctXBJZnguvu','test','test','01234567891','2020-03-20',30),(25,4,1,'EngSMBethany3','$2a$11$AI2OUZUxMsG1tOM0ZnfQ9u6dmq0TnZ04uAX3c4/mjQjRF0lBpQX2C','test','test','01234567891','2020-03-20',30),(26,5,1,'EngJMPhilip1','$2y$12$P.LGq9gGWNyf2y6jweDUvuDZNkGFgdWohgbrDNEdFwN8aQq0ZGgqG','Philip','Carpenter','43248250991','2019-01-01',30),(27,5,1,'EngJMBooker2','$2y$12$FYYmf58OjT7qtkkZWy3SKeJJA59gLOCBC2sYzKPH2ehWSZxhNb6VS','Jin','Booker','84816278991','2019-01-22',30),(28,5,1,'EngJMHawkins3','$2y$12$04uu3eN4goTU2DqaddizMu/ZQyKOujYhAuB1SR3BN5LfKJw.O0xAu','Paloma','Hawkins','90518835992','2019-06-18',30),(29,5,1,'EngJMBanks4','$2y$12$sYGgpBzxZyB9X68bHY.6we4hbv8V4caZCL1DgwzHQpoARPZDmy1au','Bianca','Banks','49666608994','2019-06-06',30),(30,5,1,'EngJMVaughn5','$2y$12$IuWdzwpxh6ZTJ7rK/PJp9urK9cBLIP3rGzeSQ4IWRWyD2rWPRLRRO','Lynn','Vaughn','70851417994','2018-10-23',30),(31,5,1,'EngJMHunter6','$2y$12$Xa3/AY.X7ZcyZfkLr6PowOp8SSFnssm5LyNlgkELKrXwHvGfK8bpq','Maggy','Hunter','04892581994','2019-05-04',30),(32,5,1,'EngJMOtto7','$2y$12$Fpha7wmyQtefEZOh0jihyeuatvzECDQaIIgVeIo86iwtQdl48MEHm','Otto','Herrera','95439018894','2019-01-04',30),(33,6,1,'EngAImad1','$2a$11$UhX4970Iw4Zj2ybg.gvrHOHGHB/W1T0jVxoPfDm1.TvhHHtwQdqly','test','test','01234567891','2020-03-20',30),(34,6,1,'EngAYusuf2','$2a$11$KI0DTcdMhCDs/169ihWeEe3ASgyjMFdjQU3hI1G7W5HZlQGR9hk1a','test','test','01234567891','2020-03-20',30),(35,6,1,'EngAAmeer3','$2a$11$A4cVJCcOOKVhF8vTEPYaT.Jt6qgQK6zr61Svw.kgLK39XNNwXE6F6','test','test','01234567891','2020-03-20',21),(36,1,6,'Faker132','$2a$11$uvoOS6UvlMGKtyLFwDO7r.3X6ZH5.nZexVPIl2Ettsv4VODCr0uaS','Lee','Sang-Hyeok','01236958425','2020-04-03',3);
SET IDENTITY_INSERT users OFF;


-- Holidays Table
CREATE TABLE holidays (
  [idholidays] int NOT NULL IDENTITY,
  [userid] int DEFAULT NULL,
  [holidaystatusid] int DEFAULT NULL,
  [holidaystartdate] date DEFAULT NULL,
  [holidayenddate] date DEFAULT NULL,
  [prioritisation] int DEFAULT NULL,
  PRIMARY KEY ([idholidays])
 ,
  CONSTRAINT [holidays_ibfk_1] FOREIGN KEY ([userid]) REFERENCES users ([idusers]) ON DELETE CASCADE,
  CONSTRAINT [holidays_ibfk_2] FOREIGN KEY ([holidaystatusid]) REFERENCES holidaystatus ([idholidaystatus])
);
CREATE INDEX [holidaystatusid] ON holidays ([holidaystatusid]);
CREATE INDEX [holidays_ibfk_1] ON holidays ([userid]);

SET IDENTITY_INSERT holidays ON;
INSERT INTO holidays (idholidays, userid, holidaystatusid, holidaystartdate, holidayenddate, prioritisation)
VALUES (2,6,1,'2020-03-27','2020-06-15',0),(3,6,1,'2020-03-27','2020-06-15',0),(4,6,1,'2020-04-05','2020-04-07',0),(9,12,1,'2020-04-29','2020-05-01',0),(10,6,2,'2020-03-18','2020-03-31',0),(11,6,1,'2020-06-05','2020-10-29',0),(12,6,2,'2020-04-18','2020-06-20',0),(13,6,3,'2020-03-21','2020-03-22',0),(14,19,1,'2020-03-21','2020-03-23',0),(16,18,2,'2020-03-21','2020-03-22',0),(17,18,1,'2020-03-31','2020-04-03',0),(18,18,1,'2020-04-07','2020-04-09',0),(19,19,1,'2020-04-23','2020-05-01',0),(20,20,1,'2020-04-09','2020-04-17',0),(21,21,1,'2020-08-06','2020-08-14',0),(22,23,1,'2020-08-06','2020-08-14',0),(23,26,1,'2020-08-06','2020-08-14',0),(24,27,1,'2020-08-06','2020-08-14',0),(25,28,1,'2020-08-06','2020-08-14',0),(26,29,1,'2020-08-06','2020-08-14',0),(27,30,1,'2020-08-06','2020-08-14',0),(28,31,1,'2020-07-06','2020-07-14',0),(29,32,1,'2020-07-06','2020-07-14',0),(30,33,1,'2020-07-06','2020-07-14',0),(31,34,1,'2020-07-06','2020-07-14',0),(32,35,1,'2020-07-06','2020-07-14',0),(33,22,1,'2020-08-05','2020-08-09',0),(34,19,1,'2020-12-23','2020-12-26',0),(35,35,1,'2020-05-13','2020-05-22',100),(36,19,2,'2020-03-24','2020-03-31',100),(37,36,1,'2020-04-11','2020-04-17',100),(38,36,1,'2020-05-09','2020-05-12',100),(39,36,1,'2020-06-10','2020-06-13',100),(40,36,1,'2020-04-26','2020-04-28',75),(41,36,1,'2020-06-26','2020-06-28',100),(42,36,1,'2020-09-10','2020-09-18',55);
SET IDENTITY_INSERT holidays OFF;