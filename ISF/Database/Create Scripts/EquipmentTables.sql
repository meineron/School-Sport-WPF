-- =============================================
-- EquipmentTables.sql
--		EQUIPMENT_TYPES
--		EQUIPMENT_REGIONS
--		EQUIPMENT_SPORTS
--		EQUIPMENT_CHAMPIONSHIPS
--		EQUIPMENT_CATEGORIES
--		EQUIPMENT
-- =============================================

-- Deleting existing tables
-- ============================================
IF EXISTS(SELECT * FROM sysobjects WHERE name = 'EQUIPMENT' AND type = 'U')
	DROP TABLE EQUIPMENT
GO
IF EXISTS(SELECT * FROM sysobjects WHERE name = 'EQUIPMENT_REGIONS' AND type = 'U')
	DROP TABLE EQUIPMENT_REGIONS
GO
IF EXISTS(SELECT * FROM sysobjects WHERE name = 'EQUIPMENT_SPORTS' AND type = 'U')
	DROP TABLE EQUIPMENT_SPORTS
GO
IF EXISTS(SELECT * FROM sysobjects WHERE name = 'EQUIPMENT_CHAMPIONSHIPS' AND type = 'U')
	DROP TABLE EQUIPMENT_CHAMPIONSHIPS
GO
IF EXISTS(SELECT * FROM sysobjects WHERE name = 'EQUIPMENT_CATEGORIES' AND type = 'U')
	DROP TABLE EQUIPMENT_CATEGORIES
GO
IF EXISTS(SELECT * FROM sysobjects WHERE name = 'EQUIPMENT_TYPES' AND type = 'U')
	DROP TABLE EQUIPMENT_TYPES
GO

-- Creating tables
-- ============================================

-- =======    EQUIPMENT_TYPES TABLE   ======
CREATE TABLE EQUIPMENT_TYPES (
EQUIPMENT_TYPE_ID			int				IDENTITY(1, 1),
EQUIPMENT_NAME				nvarchar(100)	NOT NULL,
EQUIPMENT_BASE_PRICE		float			NOT NULL default 0,
EQUIPMENT_TYPE_TYPE			int NOT NULL, --0 General/1 Region/2 Sport/3 Championship/4 Category
DATE_LAST_MODIFIED DATETIME,
DATE_DELETED datetime,
timestamp,
CONSTRAINT PK_EQUIPMENT_TYPE PRIMARY KEY(EQUIPMENT_TYPE_ID),
CONSTRAINT UN_EQUIPMENT_NAME UNIQUE(EQUIPMENT_NAME, DATE_DELETED),
CONSTRAINT CHK_EQUIPMENT_TYPE CHECK(EQUIPMENT_TYPE_TYPE>=0 AND EQUIPMENT_TYPE_TYPE<5)
)
GO 

-- =======    EQUIPMENT_REGIONS TABLE   ======
CREATE TABLE EQUIPMENT_REGIONS (
EQUIPMENT_REGION_ID			int				IDENTITY(1, 1),
EQUIPMENT_TYPE_ID			int				NOT NULL,
REGION_ID					int				NOT NULL,
EQUIPMENT_PRICE				float			NOT NULL default 0,
DATE_LAST_MODIFIED DATETIME,
DATE_DELETED datetime,
timestamp,
CONSTRAINT PK_EQUIPMENT_REGION PRIMARY KEY(EQUIPMENT_REGION_ID),
CONSTRAINT FK_EQUIPMENT_REGION_TYPE FOREIGN KEY (EQUIPMENT_TYPE_ID)
	REFERENCES EQUIPMENT_TYPES(EQUIPMENT_TYPE_ID),
CONSTRAINT FK_EQUIPMENT_REGIONS_REGION FOREIGN KEY (REGION_ID)
	REFERENCES REGIONS(REGION_ID)
)
GO 

-- =======    EQUIPMENT_SPORTS TABLE   ======
CREATE TABLE EQUIPMENT_SPORTS (
EQUIPMENT_SPORT_ID			int				IDENTITY(1, 1),
EQUIPMENT_TYPE_ID			int				NOT NULL,
SPORT_ID					int				NOT NULL,
EQUIPMENT_PRICE				float			NOT NULL default 0,
DATE_LAST_MODIFIED DATETIME,
DATE_DELETED datetime,
timestamp,
CONSTRAINT PK_EQUIPMENT_SPORT PRIMARY KEY(EQUIPMENT_SPORT_ID),
CONSTRAINT FK_EQUIPMENT_SPORT_TYPE FOREIGN KEY (EQUIPMENT_TYPE_ID)
	REFERENCES EQUIPMENT_TYPES(EQUIPMENT_TYPE_ID),
CONSTRAINT FK_EQUIPMENT_SPORTS_SPORT FOREIGN KEY (SPORT_ID)
	REFERENCES SPORTS(SPORT_ID)
)
GO 

-- =======    EQUIPMENT_CHAMPIONSHIPS TABLE   ======
CREATE TABLE EQUIPMENT_CHAMPIONSHIPS (
EQUIPMENT_CHAMPIONSHIP_ID	int				IDENTITY(1, 1),
EQUIPMENT_TYPE_ID			int				NOT NULL,
CHAMPIONSHIP_ID				int				NOT NULL,
EQUIPMENT_PRICE				float			NOT NULL default 0,
DATE_LAST_MODIFIED DATETIME,
DATE_DELETED datetime,
timestamp,
CONSTRAINT PK_EQUIPMENT_CHAMPIONSHIP PRIMARY KEY(EQUIPMENT_CHAMPIONSHIP_ID),
CONSTRAINT FK_EQUIPMENT_CHAMPIONSHIP_TYPE FOREIGN KEY (EQUIPMENT_TYPE_ID)
	REFERENCES EQUIPMENT_TYPES(EQUIPMENT_TYPE_ID),
CONSTRAINT FK_EQUIPMENT_CHAMPIONSHIPS_CHAMPIONSHIP FOREIGN KEY (CHAMPIONSHIP_ID)
	REFERENCES CHAMPIONSHIPS(CHAMPIONSHIP_ID)
)
GO 

-- =======    EQUIPMENT_CATEGORIES TABLE   ======
CREATE TABLE EQUIPMENT_CATEGORIES (
EQUIPMENT_CATEGORY_ID		int				IDENTITY(1, 1),
EQUIPMENT_TYPE_ID			int				NOT NULL,
CHAMPIONSHIP_CATEGORY_ID	int				NOT NULL,
EQUIPMENT_PRICE				float			NOT NULL default 0,
DATE_LAST_MODIFIED DATETIME,
DATE_DELETED datetime,
timestamp,
CONSTRAINT PK_EQUIPMENT_CATEGORY PRIMARY KEY(EQUIPMENT_CATEGORY_ID),
CONSTRAINT FK_EQUIPMENT_CATEGORY_TYPE FOREIGN KEY (EQUIPMENT_TYPE_ID)
	REFERENCES EQUIPMENT_TYPES(EQUIPMENT_TYPE_ID),
CONSTRAINT FK_EQUIPMENT_CATEGORIES_CATEGORY FOREIGN KEY (CHAMPIONSHIP_CATEGORY_ID)
	REFERENCES CHAMPIONSHIP_CATEGORIES(CHAMPIONSHIP_CATEGORY_ID)
)
GO 

-- =======    EQUIPMENT TABLE   ======
CREATE TABLE EQUIPMENT (
EQUIPMENT_ID				int				IDENTITY(1, 1),
EQUIPMENT_TYPE_ID			int				NOT NULL,
EQUIPMENT_REGION_ID			int,
EQUIPMENT_SPORT_ID			int,
EQUIPMENT_CHAMPIONSHIP_ID	int,
EQUIPMENT_CATEGORY_ID		int,
EQUIPMENT_AMOUNT			int				NOT NULL default 0,
EQUIPMENT_PRICE				float			NOT NULL default 0,
EQUIPMENT_ORDER_DATE		datetime		NOT NULL default GETDATE(),
DATE_LAST_MODIFIED DATETIME,
DATE_DELETED datetime,
timestamp,
CONSTRAINT PK_EQUIPMENT PRIMARY KEY(EQUIPMENT_ID),
CONSTRAINT FK_EQUIPMENT_REGION FOREIGN KEY (EQUIPMENT_REGION_ID)
	REFERENCES REGIONS(REGION_ID),
	--REFERENCES EQUIPMENT_REGIONS(EQUIPMENT_REGION_ID),
CONSTRAINT FK_EQUIPMENT_SPORT FOREIGN KEY (EQUIPMENT_SPORT_ID)
	REFERENCES SPORTS(SPORT_ID),
	--REFERENCES EQUIPMENT_SPORTS(EQUIPMENT_SPORT_ID),
CONSTRAINT FK_EQUIPMENT_CHAMPIONSHIP FOREIGN KEY (EQUIPMENT_CHAMPIONSHIP_ID)
	REFERENCES CHAMPIONSHIPS(CHAMPIONSHIP_ID),
	--REFERENCES EQUIPMENT_CHAMPIONSHIPS(EQUIPMENT_CHAMPIONSHIP_ID),
CONSTRAINT FK_EQUIPMENT_CATEGORY FOREIGN KEY (EQUIPMENT_CATEGORY_ID)
	REFERENCES CHAMPIONSHIP_CATEGORIES(CHAMPIONSHIP_CATEGORY_ID)
	--REFERENCES EQUIPMENT_CATEGORIES(EQUIPMENT_CATEGORY_ID)
)
GO

-- =======    ISF_PAYMENTS TABLE   ======
CREATE TABLE ISF_PAYMENTS (
ISF_PAYMENT_ID			int				IDENTITY(1, 1),
EQUIPMENT_ID			int,
PAYMENT_SUM				float			NOT NULL default 0,
PAYMENT_DESCRIPTION		nvarchar(255)	NOT NULL default '',
PAYMENT_DATE			datetime		NOT NULL default GETDATE(),
PAYMENT_TYPE			int				NOT NULL,
PAID_BY					int				NOT NULL,
DATE_LAST_MODIFIED DATETIME,
DATE_DELETED datetime,
timestamp,
CONSTRAINT PK_ISF_PAYMENT PRIMARY KEY(ISF_PAYMENT_ID),
CONSTRAINT FK_ISF_PAYMENT_EQUIPMENT FOREIGN KEY (EQUIPMENT_ID)
	REFERENCES EQUIPMENT(EQUIPMENT_ID),
CONSTRAINT FK_ISF_PAYMENT_USER FOREIGN KEY (PAID_BY)
	REFERENCES USERS(USER_ID)
)
GO