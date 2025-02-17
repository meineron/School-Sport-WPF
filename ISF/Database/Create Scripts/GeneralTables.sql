-- =============================================
-- GeneralTables.sql
--		Creating general tables:
--			REGIONS
--			CITIES
--			SCHOOLS
--			STUDENTS
--			FACILITIES
--			REFEREES
--			BUGS
--			LOG_TABLE
--			PRACTICE_CAMPS
--			PRACTICE_CAMP_PARTICIPANTS
-- =============================================

-- Deleting existing tables
-- ============================================
IF EXISTS(SELECT * FROM sysobjects WHERE name = 'FUNCTIONARIES' AND type = 'U')
	DROP TABLE FUNCTIONARIES
GO
IF EXISTS(SELECT * FROM sysobjects WHERE name = 'FUNCTIONARY_SPORT' AND type = 'U')
	DROP TABLE FUNCTIONARY_SPORT
GO
IF EXISTS(SELECT * FROM sysobjects WHERE name = 'REFEREES' AND type = 'U')
	DROP TABLE REFEREES
GO
IF EXISTS(SELECT * FROM sysobjects WHERE name = 'STUDENTS' AND type = 'U')
	DROP TABLE STUDENTS
GO
IF EXISTS(SELECT * FROM sysobjects WHERE name = 'COURTS' AND type = 'U')
	DROP TABLE COURTS
GO
IF EXISTS(SELECT * FROM sysobjects WHERE name = 'FACILITIES' AND type = 'U')
	DROP TABLE FACILITIES
GO
IF EXISTS(SELECT * FROM sysobjects WHERE name = 'COURT_TYPES' AND type = 'U')
	DROP TABLE COURT_TYPES
GO
IF EXISTS(SELECT * FROM sysobjects WHERE name = 'COURT_TYPE_SPORTS' AND type = 'U')
	DROP TABLE COURT_TYPE_SPORTS
GO
IF EXISTS(SELECT * FROM sysobjects WHERE name = 'SCHOOLS' AND type = 'U')
	DROP TABLE SCHOOLS
GO
IF EXISTS(SELECT * FROM sysobjects WHERE name = 'CITIES' AND type = 'U')
	DROP TABLE CITIES
GO
IF EXISTS(SELECT * FROM sysobjects WHERE name = 'REGIONS' AND type = 'U')
	DROP TABLE REGIONS
GO
IF EXISTS(SELECT * FROM sysobjects WHERE name = 'BUGS' AND type = 'U')
	DROP TABLE BUGS
GO
IF EXISTS(SELECT * FROM sysobjects WHERE name = 'LOG_TABLE' AND type = 'U')
	DROP TABLE LOG_TABLE
GO
IF EXISTS(SELECT * FROM sysobjects WHERE name = 'INSTANT_MESSAGES' AND type = 'U')
	DROP TABLE INSTANT_MESSAGES
GO
IF EXISTS(SELECT * FROM sysobjects WHERE name = 'PRACTICE_CAMPS' AND type = 'U')
	DROP TABLE PRACTICE_CAMPS
GO
IF EXISTS(SELECT * FROM sysobjects WHERE name = 'PRACTICE_CAMP_PARTICIPANTS' AND type = 'U')
	DROP TABLE PRACTICE_CAMP_PARTICIPANTS
GO
IF EXISTS(SELECT * FROM sysobjects WHERE name = 'TEACHER_COURSES' AND type = 'U')
	DROP TABLE TEACHER_COURSES
GO

-- Creating tables
-- ============================================

-- =======    REGIONS TABLE   ======
CREATE TABLE REGIONS (
REGION_ID	int				IDENTITY (1,1),
NUMBER		int				NOT NULL,
REGION_NAME	nvarchar(15)	NOT NULL,
ADDRESS		nvarchar(70),
PHONE		nvarchar(15),
FAX			nvarchar(15),
COORDINATOR int,
DATE_LAST_MODIFIED DATETIME,
DATE_DELETED datetime,
timestamp,
CONSTRAINT PK_REGIONS PRIMARY KEY(REGION_ID),
CONSTRAINT UN_REGION_NUMBER UNIQUE(NUMBER, DATE_DELETED),
CONSTRAINT FK_REGION_COORDINATOR FOREIGN KEY(COORDINATOR) 
REFERENCES USERS(USER_ID)
)
GO

-- =======    CITIES TABLE   ======
CREATE TABLE CITIES (
CITY_ID		int				IDENTITY (1,1),
CITY_NAME	nvarchar(30)	NOT NULL,
REGION_ID	int,
DATE_LAST_MODIFIED DATETIME,
DATE_DELETED datetime,
timestamp,
CONSTRAINT PK_CITIES PRIMARY KEY(CITY_ID),
CONSTRAINT FK_CITIES_REGION FOREIGN KEY(REGION_ID)
	REFERENCES REGIONS(REGION_ID)
)
GO

-- =======    SCHOOLS TABLE   ======
CREATE TABLE SCHOOLS (
SCHOOL_ID			int				IDENTITY (1,1),
SYMBOL				nchar(7)		NOT NULL,
SCHOOL_NAME			nvarchar(30)	NOT NULL,
CITY_ID				int,
ADDRESS				nvarchar(70),
MAIL_ADDRESS		nvarchar(70),
MAIL_CITY_ID		int,
ZIP_CODE			nvarchar(5),
EMAIL				nvarchar(100),
PHONE				nvarchar(15),
FAX					nvarchar(15),
MANAGER_NAME		nvarchar(20),
FROM_GRADE			int,
TO_GRADE			int,
SUPERVISION_TYPE	int,
SECTOR_TYPE			int,
REGION_ID			int				NOT NULL,
--SCHOOL_TYPE			ntext			NOT NULL,
CLUB_STATUS			int				NOT NULL,
--CLUB_CHARGE_ID		int,
PLAYER_NUMBER_FROM	int,
PLAYER_NUMBER_TO	int,
MANAGER_CELL_PHONE	nvarchar(15),
DATE_LAST_MODIFIED DATETIME,
DATE_DELETED datetime,
timestamp,
CONSTRAINT PK_SCHOOLS PRIMARY KEY(SCHOOL_ID),
CONSTRAINT UN_SCHOOL_SYMBOL UNIQUE(SYMBOL, DATE_DELETED),
CONSTRAINT FK_SCHOOLS_REGIONS FOREIGN KEY(REGION_ID)
	REFERENCES REGIONS(REGION_ID),
CONSTRAINT FK_SCHOOLS_CITY FOREIGN KEY(CITY_ID)
	REFERENCES CITIES(CITY_ID),
CONSTRAINT FK_SCHOOLS_MAILCITY FOREIGN KEY(MAIL_CITY_ID)
	REFERENCES CITIES(CITY_ID)
	)
GO

--         =======    STUDENTS TABLE   ======
CREATE TABLE STUDENTS (
STUDENT_ID	int				IDENTITY (1,1),
ID_NUMBER_TYPE	int,
ID_NUMBER	int,
FIRST_NAME	nvarchar(15)	NOT NULL,
LAST_NAME	nvarchar(20)	NOT NULL,
BIRTH_DATE	datetime,
SCHOOL_ID	int				NOT NULL,
GRADE		int,
SEX_TYPE	int,
DATE_LAST_MODIFIED DATETIME,
DATE_DELETED datetime,
timestamp,
CONSTRAINT PK_STUDENT PRIMARY KEY(STUDENT_ID),
CONSTRAINT UN_STUDENT_ID_NUMBER UNIQUE(ID_NUMBER, DATE_DELETED),
CONSTRAINT FK_STUDENTS_SCHOOL FOREIGN KEY(SCHOOL_ID)
	REFERENCES SCHOOLS(SCHOOL_ID))
GO

-- STUNEDTS index by last and first name
CREATE INDEX I_STUDENTS_LFNAME ON STUDENTS(LAST_NAME, FIRST_NAME)
GO


-- =======    FACILITIES TABLE   ======
CREATE TABLE FACILITIES (
FACILITY_ID		int				IDENTITY (1,1),
FACILITY_NAME	nvarchar(30)	NOT NULL,
REGION_ID		int,
SCHOOL_ID		int,
ADDRESS			nvarchar(70),
PHONE			nvarchar(15),
FAX				nvarchar(15),
CITY_ID			int,
FACILITY_NUMBER int,
DATE_LAST_MODIFIED DATETIME,
DATE_DELETED datetime,
timestamp,
CONSTRAINT PK_FACILITY PRIMARY KEY(FACILITY_ID),
CONSTRAINT FK_FACILITIES_SCHOOL FOREIGN KEY(SCHOOL_ID)
	REFERENCES SCHOOLS(SCHOOL_ID),
CONSTRAINT FK_FACILITIES_REGION FOREIGN KEY(REGION_ID)
	REFERENCES REGIONS(REGION_ID)
CONSTRAINT FK_FACILITIES_CITY FOREIGN KEY(CITY_ID)
	REFERENCES CITIES(CITY_ID)
)
GO

-- =======    COURT_TYPES TABLE   ======
CREATE TABLE COURT_TYPES (
COURT_TYPE_ID		int				IDENTITY (1,1),
COURT_TYPE_NAME		nvarchar(30)	NOT NULL,
DATE_LAST_MODIFIED DATETIME,
DATE_DELETED datetime,
timestamp,
CONSTRAINT PK_COURT_TYPES PRIMARY KEY(COURT_TYPE_ID)
)
GO

-- =======    COURT_TYPE_SPORTS TABLE   ======
CREATE TABLE COURT_TYPE_SPORTS (
COURT_TYPE_SPORT_ID		int				IDENTITY (1,1),
COURT_TYPE_ID			int NOT NULL,
SPORT_ID				int NOT NULL,
SPORT_FIELD_TYPE_ID		int,
SPORT_FIELD_ID			int,
DATE_LAST_MODIFIED DATETIME,
DATE_DELETED datetime,
timestamp,
CONSTRAINT PK_COURT_TYPE_SPORTS PRIMARY KEY(COURT_TYPE_SPORT_ID),
CONSTRAINT FK_COURTTYPESPORT_TYPE FOREIGN KEY(COURT_TYPE_ID)
	REFERENCES COURT_TYPES(COURT_TYPE_ID),
CONSTRAINT FK_COURTTYPESPORT_SPORT FOREIGN KEY(SPORT_ID)
	REFERENCES SPORTS(SPORT_ID),
CONSTRAINT FK_COURTTYPESPORT_FIELDTYPE FOREIGN KEY(SPORT_FIELD_TYPE_ID)
	REFERENCES SPORT_FIELD_TYPES(SPORT_FIELD_TYPE_ID),
CONSTRAINT FK_COURTTYPESPORT_FIELD FOREIGN KEY(SPORT_FIELD_ID)
	REFERENCES SPORT_FIELDS(SPORT_FIELD_ID)
)
GO

-- =======    COURTS TABLE   ======
CREATE TABLE COURTS (
COURT_ID		int				IDENTITY (1,1),
COURT_NAME		nvarchar(30)	NOT NULL,
FACILITY_ID		int NOT NULL,
COURT_TYPE_ID	int,
DATE_LAST_MODIFIED DATETIME,
DATE_DELETED datetime,
timestamp,
CONSTRAINT PK_COURT PRIMARY KEY(COURT_ID),
CONSTRAINT FK_COURT_FACILITY FOREIGN KEY(FACILITY_ID)
	REFERENCES FACILITIES(FACILITY_ID),
CONSTRAINT FK_COURT_TYPE FOREIGN KEY(COURT_TYPE_ID)
	REFERENCES COURT_TYPES(COURT_TYPE_ID)
)
GO


-- =======    FUNCTIONARIES TABLE   ======
CREATE TABLE FUNCTIONARIES (
FUNCTIONARY_ID		int				IDENTITY (1, 1),
FUNCTIONARY_NAME	nvarchar(50)	NOT NULL,
FUNCTIONARY_TYPE	int				NOT NULL, -- Coordinator, Referee
REGION_ID			int,
CITY_ID				int,
SCHOOL_ID			int,
ADDRESS				nvarchar(70),
PHONE				nvarchar(15),
FAX					nvarchar(15),
ZIP_CODE			nvarchar(15),
EMAIL				nvarchar(100),
CELL_PHONE			nvarchar(15),
FUNCTIONARY_NUMBER	int,
ID_NUMBER			int,
FUNCTIONARY_STATUS	int,
HAS_ANOTHER_JOB		int,
WORK_ENVIROMENT		int,
SEX_TYPE			int,
BIRTH_DATE			datetime,
SENIORITY			int,
PAYMENT				nvarchar(15),
REMARKS				nvarchar(50),
GOT_STICKER			int DEFAULT 0, 
DATE_LAST_MODIFIED DATETIME,
DATE_DELETED datetime,
timestamp,
CONSTRAINT PK_FUNCTIONARIES PRIMARY KEY(FUNCTIONARY_ID),
CONSTRAINT FK_FUNC_REGION FOREIGN KEY(REGION_ID)
	REFERENCES REGIONS(REGION_ID),
CONSTRAINT FK_FUNC_CITY FOREIGN KEY(CITY_ID)
	REFERENCES CITIES(CITY_ID),
CONSTRAINT FK_FUNC_SCHOOL FOREIGN KEY(SCHOOL_ID)
	REFERENCES SCHOOLS(SCHOOL_ID)
)
GO

-- =======    FUNCTIONARY_SPORT TABLE   ======
CREATE TABLE FUNCTIONARY_SPORT (
FUNCTIONARY_SPORT_ID	int IDENTITY (1, 1),
FUNCTIONARY_ID			int NOT NULL,
SPORT_ID				int NOT NULL,
DATE_LAST_MODIFIED		DATETIME,
DATE_DELETED			datetime,
timestamp,
CONSTRAINT PK_FUNCTIONARY_SPORT PRIMARY KEY(FUNCTIONARY_SPORT_ID),
CONSTRAINT FK_FUNC_SPORT_FUNC FOREIGN KEY(FUNCTIONARY_ID)
	REFERENCES FUNCTIONARIES(FUNCTIONARY_ID),
CONSTRAINT FK_FUNC_SPORT_SPORT FOREIGN KEY(SPORT_ID)
	REFERENCES SPORTS(SPORT_ID),
CONSTRAINT UN_FUNC_SPORT UNIQUE(FUNCTIONARY_ID, SPORT_ID, DATE_DELETED)
)
GO

-- =======    REFEREES TABLE   ======
CREATE TABLE REFEREES (
REFEREE_ID		int				IDENTITY (1,1),
REFEREE_NAME	nvarchar(50)	NOT NULL,
REFEREE_TYPE	int				NOT NULL,	--Minor/Senior
DATE_LAST_MODIFIED DATETIME,
DATE_DELETED datetime,
timestamp,
CONSTRAINT PK_REFEREE PRIMARY KEY(REFEREE_ID)
)
GO

-- =======    BUGS TABLE   ======
CREATE TABLE BUGS (
BUG_ID			int				IDENTITY (1,1),
BUG_DATE		datetime		NOT NULL,
TITLE			nvarchar(50)	NOT NULL,
DESCRIPTION		nvarchar(1024),
STATUS			int				NOT NULL,
USER_ID			int,
TYPE			int,
DATE_LAST_MODIFIED DATETIME,
DATE_DELETED datetime,
timestamp,
CONSTRAINT PK_BUGS PRIMARY KEY(BUG_ID),
CONSTRAINT FK_BUGS_USER FOREIGN KEY(USER_ID) REFERENCES USERS(USER_ID))
GO

-- =======    LOG_TABLE TABLE   ======
CREATE TABLE LOG_TABLE (
LOG_ID			int				IDENTITY (1,1),
USER_ID			int				NOT NULL,
LOG_DATE		datetime		NOT NULL,
DESCRIPTION		nvarchar(255),
VERSION_USED	real			NOT NULL,
DATE_LAST_MODIFIED DATETIME,
DATE_DELETED datetime,
timestamp,
CONSTRAINT PK_LOG_TABLE PRIMARY KEY(LOG_ID),
CONSTRAINT FK_LOG_USER FOREIGN KEY(USER_ID) REFERENCES USERS(USER_ID))
GO

-- =======    USER_ACTIONS TABLE   ======
CREATE TABLE USER_ACTIONS (
USER_ACTION_ID	int				IDENTITY (1,1),
ACTION_TYPE		int				NOT NULL,
USER_ID			int				NOT NULL,
ACTION_DATE		datetime		NOT NULL,
DESCRIPTION		nvarchar(255),
VERSION			real			NOT NULL,
CONSTRAINT PK_USER_ACTION PRIMARY KEY(USER_ACTION_ID)
)
GO

-- =======    INSTANT_MESSAGES TABLE   ======
CREATE TABLE INSTANT_MESSAGES (
INSTANT_MESSAGE_ID	int			IDENTITY (1,1),
SENDER				int			NOT NULL,
RECIPIENT			int			NOT NULL,
DATE_SENT			datetime	NOT NULL DEFAULT GETDATE(),
CONTENTS			nvarchar(1024) NOT NULL,
DATE_READ			datetime,
DATE_LAST_MODIFIED DATETIME,
DATE_DELETED datetime,
timestamp,
CONSTRAINT PK_INSTANT_MESSAGE PRIMARY KEY(INSTANT_MESSAGE_ID),
CONSTRAINT FK_INSTANT_MESSAGE_SENDER FOREIGN KEY(SENDER) 
REFERENCES USERS(USER_ID), 
CONSTRAINT FK_INSTANT_MESSAGE_RECIPIENT FOREIGN KEY(RECIPIENT) 
REFERENCES USERS(USER_ID)
)
GO

-- =======    PRACTICE_CAMPS TABLE   ======
CREATE TABLE PRACTICE_CAMPS (
PRACTICE_CAMP_ID	int				IDENTITY (1,1),
SPORT_ID			int				NOT NULL,
DATE_START			datetime		NOT NULL,
DATE_FINISH			datetime		NOT NULL,
BASE_PRICE			int				NOT NULL,
REMARKS				nvarchar(255),
DATE_LAST_MODIFIED DATETIME,
DATE_DELETED datetime,
timestamp,
CONSTRAINT PK_PRACTICE_CAMP PRIMARY KEY(PRACTICE_CAMP_ID),
CONSTRAINT FK_PRACTICE_CAMP_SPORT FOREIGN KEY(SPORT_ID) 
REFERENCES SPORTS(SPORT_ID), 
CONSTRAINT UN_PRACTICE_CAMP UNIQUE(SPORT_ID, DATE_START, DATE_FINISH)
)
GO

-- =======    PRACTICE_CAMP_PARTICIPANTS   ======
CREATE TABLE PRACTICE_CAMP_PARTICIPANTS (
PARTICIPANT_ID			int	IDENTITY (1,1),
PRACTICE_CAMP_ID		int				NOT NULL,
PARTICIPANT_NAME		nvarchar(255)	NOT NULL,
PARTICIPANT_ADDRESS		nvarchar(255),
PARTICIPANT_SCHOOL		nvarchar(255),
PARTICIPANT_BIRTHDAY	nvarchar(15),
PARTICIPANT_PHONE		nvarchar(15),
PARTICIPANT_CELL_PHONE	nvarchar(15),
REMARKS					nvarchar(255),
CHARGE_ID				int,
IS_CONFIRMED			int				NOT NULL,
SEX_TYPE				int,
PARTICIPANT_EMAIL		nvarchar(150),
DATE_LAST_MODIFIED DATETIME,
DATE_DELETED datetime,
timestamp,
CONSTRAINT PK_PRACTICE_CAMP_PARTICIPANT PRIMARY KEY(PARTICIPANT_ID),
CONSTRAINT FK_PARTICIPANT_CAMP FOREIGN KEY(PRACTICE_CAMP_ID) 
REFERENCES PRACTICE_CAMPS(PRACTICE_CAMP_ID)
)
GO

-- =======    TEACHER_COURSES   ======
CREATE TABLE TEACHER_COURSES (
TEACHER_COURSE_ID		int	IDENTITY (1,1),
TEACHER_FIRST_NAME		nvarchar(50)	NOT NULL,
TEACHER_LAST_NAME		nvarchar(50),
TEACHER_ID_NUMBER		nvarchar(20),
TEACHER_BIRTHDAY		nvarchar(15),
TEACHER_ADDRESS			nvarchar(100),
TEACHER_CITY			nvarchar(30),
TEACHER_ZIP_CODE		nvarchar(7),
TEACHER_EMAIL			nvarchar(255),
TEACHER_CELL_PHONE		nvarchar(15),
TEACHER_HOME_PHONE		nvarchar(15),
TEACHER_FAX_NUMBER		nvarchar(15),
TEACHER_GENDER			int, 
TEACHER_SCHOOL_NAME		nvarchar(50),
TEACHER_CITY_NAME		nvarchar(50),
TEACHER_SCHOOL_ADDRESS	nvarchar(50),
TEACHER_SPORT1			int,
TEACHER_SPORT2			int,
TEACHER_VETERANSHIP		int,
TEACHER_EXPERTISE_TYPE	int,
TEACHER_TEAM_AGE_TYPE	int,
COURSE_HOLIDAY_TYPE		int,
COURSE_YEAR				int,
COURSE_SPORT			int,
CHARGE_ID				int,
IS_CONFIRMED			int				NOT NULL,
COACH_TRAINING_TYPE		nvarchar(255),
COACH_TRAINING_HOURS	int,
DATE_LAST_MODIFIED DATETIME,
DATE_DELETED datetime,
timestamp,
CONSTRAINT PK_TEACHER_COURSE PRIMARY KEY(TEACHER_COURSE_ID),
CONSTRAINT FK_TEACHER_SPORT1 FOREIGN KEY(TEACHER_SPORT1) 
REFERENCES SPORTS(SPORT_ID),
CONSTRAINT FK_TEACHER_SPORT2 FOREIGN KEY(TEACHER_SPORT2) 
REFERENCES SPORTS(SPORT_ID),
CONSTRAINT FK_COURSE_SPORT FOREIGN KEY(COURSE_SPORT) 
REFERENCES SPORTS(SPORT_ID),
CONSTRAINT FK_COURSE_CHARGE FOREIGN KEY(CHARGE_ID) 
REFERENCES CHARGES(CHARGE_ID)
)
GO