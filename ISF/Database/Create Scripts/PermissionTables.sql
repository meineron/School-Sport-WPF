-- Deleting existing tables
-- ============================================
IF EXISTS(SELECT * FROM sysobjects WHERE name = 'SPORTSMAN_PERMISSIONS' AND type = 'U')
	DROP TABLE SPORTSMAN_PERMISSIONS
GO 

IF EXISTS(SELECT * FROM sysobjects WHERE name = 'SPORTSMAN_FORMS' AND type = 'U')
	DROP TABLE SPORTSMAN_FORMS
GO 

-- Creating tables
-- ============================================

-- =======    SPORTSMAN_FORMS TABLE   ======
CREATE TABLE SPORTSMAN_FORMS (
SPORTSMAN_FORM_ID		int				IDENTITY(1, 1),
FORM_CLASSNAME			nvarchar(200)	NOT NULL,
FORM_DESCRIPTION		nvarchar(255)	NOT NULL,
CONSTRAINT PK_SPORTSMAN_FORMS PRIMARY KEY(SPORTSMAN_FORM_ID),
CONSTRAINT UN_SPORTSMAN_FORM_CLASS UNIQUE(FORM_CLASSNAME)
)
GO 

-- =======    SPORTSMAN_PERMISSIONS TABLE   ======
CREATE TABLE SPORTSMAN_PERMISSIONS (
SPORTSMAN_PERMISSION_ID		int			IDENTITY(1, 1),
USER_ID						int			NOT NULL,
SPORTSMAN_FORM_ID			int,
PERMISSION_TYPE				int			NOT NULL,	--0 none,1 readonly,2 full.
CONSTRAINT PK_SPORTSMAN_PERMISSIONS PRIMARY KEY(SPORTSMAN_PERMISSION_ID),
CONSTRAINT UN_SPORTSMAN_PERMISSION UNIQUE(USER_ID, SPORTSMAN_FORM_ID),
CONSTRAINT FK_SPORTSMAN_PERMISSION_USER FOREIGN KEY (USER_ID)
	REFERENCES USERS(USER_ID),
CONSTRAINT FK_SPORTSMAN_PERMISSION_FORM FOREIGN KEY (SPORTSMAN_FORM_ID)
	REFERENCES SPORTSMAN_FORMS(SPORTSMAN_FORM_ID)
)
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.BugsTableView', '����� �����')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.CalendarView', '��� ���')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.ChampionshipsTableView', '����� ��������')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.ChargesTableView', '����� ����� ��� ���')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.CitiesTableView', '����� �������')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.CourtTypesTableView', '����� ���� ������')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.EquipmentTableView', '����� ���� �������')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.EquipmentTypesTableView', '����� ���� ����')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.FacilitiesTableView', '����� ������')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.GameBoardsTableView', '����� ����� ������')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.IsfPaymentsTableView', '����� ������ �������')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.LogTableView', '����� ���� �������')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.MessagesTableView', '������ �����')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.PaymentsTableView', '����� ������ ��� ���')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.PhasePatternsTableView', '����� ������ �����')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.PlayersTableView', '����� ������')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.ProductsTableView', '����� ������ ����')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.RefereesTableView', '����� ������')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.RegionsTableView', '����� ������')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.RuleSersTableView', '����� �������')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.SchoolsTableView', '����� ��� ���')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.ScoreRangeTableView', '����� ����� ������')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.SportFieldsTableView', '����� ������� ����� �������')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.SportsTableView', '����� ���� �����')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.StandardChampionshipsTableView', '����� �������� ������')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.StudentsTableView', '����� �������')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.TeamsTableView', '����� ������')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.UsersTableView', '����� �������')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Producer.CompetitionChampionshipEditorView', '����� �������� ���� �����')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Producer.GameBoardEditorView', '����� ����� ������')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Producer.MatchChampionshipEditorView', '����� �������� ���� ��������')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Producer.PhasePatternEditorView', '����� ������ �����')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Producer.PlayerCardBuildForm', '����� ������ ����')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Producer.RulesetEditorView', '����� �������')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sport.UI.Dialogs.PrintForm', '������ ������')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Forms.PermissionsForm', '����� ������')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Details.StudentDetails', '���� �������')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Details.SchoolDetails', '���� ��� ���')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('SportSite.Articles', '����� �����')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('SportSite.FlashNews', '����� ����� �����')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('SportSite.Pages', '����� ����� �������')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('Sportsman.Views.SeasonsTableView', '����� �����')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('SportSite.Polls', '����� ����� ����')
GO

INSERT INTO SPORTSMAN_FORMS (FORM_CLASSNAME, FORM_DESCRIPTION)
VALUES ('SportSite.PermanentChamps', '����� ����� ������')
GO


-- Creating tables
-- =============================================================

-- =======    PERMISSIONS TABLE   ======
CREATE TABLE PERMISSIONS (
PERMISSION_ID		nvarchar(50) NOT NULL,
PERMISSION_NAME		nvarchar(50) NOT NULL,
CONSTRAINT PK_PERMISSIONS PRIMARY KEY(PERMISSION_ID),
CONSTRAINT UN_PERMISSION_NAME UNIQUE (PERMISSION_NAME)
)
GO

-- =======    PERMISSION_TYPES TABLE   ======
CREATE TABLE PERMISSION_TYPES (
PERMISSION_TYPE_ID		int				NOT NULL,
PERMISSION_TYPE_NAME	nvarchar(50)	NOT NULL,
CONSTRAINT PK_PERMISSION_TYPES PRIMARY KEY(PERMISSION_TYPE_ID),
CONSTRAINT UN_PERMTYPE_NAME UNIQUE (PERMISSION_TYPE_NAME)
)
GO

-- =======    PERMISSION_PERMISSION_TYPES TABLE   ======
CREATE TABLE PERMISSION_PERMISSION_TYPES (
PERMISSION_ID			nvarchar(50)	NOT NULL,
PERMISSION_TYPE_ID		int				NOT NULL,
CONSTRAINT PK_PERMISSION_PERMISSION_TYPES PRIMARY KEY(PERMISSION_ID, PERMISSION_TYPE_ID),
CONSTRAINT FK_PERMPERMTYPE_PERM FOREIGN KEY (PERMISSION_ID)
	REFERENCES PERMISSIONS(PERMISSION_ID),
CONSTRAINT FK_PERMPERMTYPE_TYPE FOREIGN KEY (PERMISSION_TYPE_ID)
	REFERENCES PERMISSION_TYPES(PERMISSION_TYPE_ID)
)
GO

-- =======    USER_PERMISSIONS TABLE   ======
CREATE TABLE USER_PERMISSIONS (
USER_ID					int				NOT NULL,
PERMISSION_ID			nvarchar(50)	NOT NULL,
PERMISSION_TYPE_ID		int				NOT NULL,
CONSTRAINT PK_USER_PERMISSIONS PRIMARY KEY(USER_ID, PERMISSION_ID),
CONSTRAINT FK_USERPERM_PERM FOREIGN KEY (PERMISSION_ID, PERMISSION_TYPE_ID)
	REFERENCES PERMISSION_PERMISSION_TYPES(PERMISSION_ID, PERMISSION_TYPE_ID)
)
GO

-- =======    Permission Types   ======

INSERT INTO PERMISSION_TYPES(PERMISSION_TYPE_ID, PERMISSION_TYPE_NAME)
VALUES (1, '����� ������')
GO
INSERT INTO PERMISSION_TYPES(PERMISSION_TYPE_ID, PERMISSION_TYPE_NAME)
VALUES (2, '����� ����')
GO
INSERT INTO PERMISSION_TYPES(PERMISSION_TYPE_ID, PERMISSION_TYPE_NAME)
VALUES (3, '����� ������')
GO
INSERT INTO PERMISSION_TYPES(PERMISSION_TYPE_ID, PERMISSION_TYPE_NAME)
VALUES (4, '�����')
GO

-- =======    Permissions   ======
INSERT INTO PERMISSIONS (PERMISSION_ID, PERMISSION_NAME)
VALUES ('region', '������')
GO
INSERT INTO PERMISSION_PERMISSION_TYPES (PERMISSION_ID, PERMISSION_TYPE_ID)
VALUES ('region', 2)
GO
INSERT INTO PERMISSION_PERMISSION_TYPES (PERMISSION_ID, PERMISSION_TYPE_ID)
VALUES ('region', 4)
GO

INSERT INTO PERMISSIONS (PERMISSION_ID, PERMISSION_NAME)
VALUES ('city', '������')
GO
INSERT INTO PERMISSION_PERMISSION_TYPES (PERMISSION_ID, PERMISSION_TYPE_ID)
VALUES ('city', 1)
GO
INSERT INTO PERMISSION_PERMISSION_TYPES (PERMISSION_ID, PERMISSION_TYPE_ID)
VALUES ('city', 2)
GO
INSERT INTO PERMISSION_PERMISSION_TYPES (PERMISSION_ID, PERMISSION_TYPE_ID)
VALUES ('city', 3)
GO
INSERT INTO PERMISSION_PERMISSION_TYPES (PERMISSION_ID, PERMISSION_TYPE_ID)
VALUES ('city', 4)
GO

INSERT INTO PERMISSIONS (PERMISSION_ID, PERMISSION_NAME)
VALUES ('school', '��� ���')
GO
INSERT INTO PERMISSION_PERMISSION_TYPES (PERMISSION_ID, PERMISSION_TYPE_ID)
VALUES ('school', 1)
GO
INSERT INTO PERMISSION_PERMISSION_TYPES (PERMISSION_ID, PERMISSION_TYPE_ID)
VALUES ('school', 2)
GO
INSERT INTO PERMISSION_PERMISSION_TYPES (PERMISSION_ID, PERMISSION_TYPE_ID)
VALUES ('school', 3)
GO
INSERT INTO PERMISSION_PERMISSION_TYPES (PERMISSION_ID, PERMISSION_TYPE_ID)
VALUES ('school', 4)
GO

INSERT INTO PERMISSIONS (PERMISSION_ID, PERMISSION_NAME)
VALUES ('student', '�������')
GO
INSERT INTO PERMISSION_PERMISSION_TYPES (PERMISSION_ID, PERMISSION_TYPE_ID)
VALUES ('student', 1)
GO
INSERT INTO PERMISSION_PERMISSION_TYPES (PERMISSION_ID, PERMISSION_TYPE_ID)
VALUES ('student', 2)
GO
INSERT INTO PERMISSION_PERMISSION_TYPES (PERMISSION_ID, PERMISSION_TYPE_ID)
VALUES ('student', 3)
GO
INSERT INTO PERMISSION_PERMISSION_TYPES (PERMISSION_ID, PERMISSION_TYPE_ID)
VALUES ('student', 4)
GO
