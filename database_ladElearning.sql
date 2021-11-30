CREATE DATABASE E_LEARNING_TEACHING;  
go
USE E_LEARNING_TEACHING; 
go
-------------------------------------------------------------------------------------------------------------
CREATE TABLE khoa (
    ID VARCHAR(10) NOT NULL,
    name NVARCHAR(50) NOT NULL,
    PRIMARY KEY (ID)
);
INSERT INTO khoa values('100174',N'Khoa Học Máy Tinh'),('100175',N'Kĩ Thuật Máy Tính')
DELETE FROM khoa;
-------------------------------------------------------------------------------------------------------------
CREATE TABLE Giang_Vien (
    ID VARCHAR(10) NOT NULL PRIMARY KEY,
    Ho_ten NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    SDT VARCHAR(10),
    ID_Khoa VARCHAR(10) NOT NULL,
);
ALTER TABLE Giang_Vien ADD CONSTRAINT fk_Giang_Vien_id_khoa FOREIGN KEY (ID_Khoa) REFERENCES Khoa(ID);
-------------------------------------------------------------------------------------------------------------
CREATE TABLE Sinh_Vien (
    ID VARCHAR(10) NOT NULL PRIMARY KEY,
    Ho_ten NVARCHAR(100) NOT NULL,
    Lop VARCHAR(100) NOT NULL,
    Email NVARCHAR(200) NOT NULL,
    TT_hoc NVARCHAR(100) NOT NULL,
    khoa_ID VARCHAR(10) NOT NULL,
);
ALTER TABLE Sinh_Vien ADD CONSTRAINT fk_Sinh_Vien_khoa_ID FOREIGN KEY (Khoa_ID) REFERENCES Khoa(ID);
-------------------------------------------------------------------------------------------------------------
CREATE TABLE phong_hoc (
    ID VARCHAR(50) NOT NULL PRIMARY KEY,
	toa NVARCHAR(100) NOT NULL,
	co_so NVARCHAR(100) NOT NULL,
);
select * from phong_hoc;
INSERT INTO phong_hoc VALUES ('202H3',N'H3',N'Co so 1');
-------------------------------------------------------------------------------------------------------------
CREATE TABLE mon_hoc (
    ID VARCHAR(6) NOT NULL PRIMARY KEY,
    Ten_MH NVARCHAR(100) NOT NULL,
    So_TC SMALLINT NOT NULL
);
INSERT INTO mon_hoc values('CO2004',N'Hệ Cơ sở DL','3'),('SP1008',N'Pháp Luat VN đại cương','4')
-------------------------------------------------------------------------------------------------------------
CREATE TABLE nhom_lop (
    ID VARCHAR(10) NOT NULL PRIMARY KEY,
    tiet_bat_dau VARCHAR(5) NOT NULL,
	tiet_ket_thuc VARCHAR(5) NOT NULL,
    Phong_hoc VARCHAR(50) NOT NULL,
	id_giang_vien VARCHAR(10) NOT NULL,
    id_monhoc VARCHAR(6) NOT NULL,
);
ALTER TABLE nhom_lop ADD CONSTRAINT fk_nhom_lop_id_monhoc FOREIGN KEY (id_monhoc) REFERENCES mon_hoc(ID);
ALTER TABLE nhom_lop ADD CONSTRAINT fk_nhom_lop_id_giang_vien FOREIGN KEY (id_giang_vien) REFERENCES Giang_Vien(ID);
ALTER TABLE nhom_lop ADD CONSTRAINT fk_nhom_lop_phong_hoc FOREIGN KEY (Phong_hoc) REFERENCES phong_hoc(ID);
-------------------------------------------------------------------------------------------------------------
CREATE TABLE Giao_Trinh (
    ID VARCHAR(10) NOT NULL,
    Ten_GT VARCHAR(50) NOT NULL,
    Nam_xuatban VARCHAR(4) NOT NULL,
    PRIMARY KEY (ID)
);
-------------------------------------------------------------------------------------------------------------
CREATE TABLE Tac_Gia (
    ID VARCHAR(10) NOT NULL,
    Ho_Ten VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID)
);
-------------------------------------------------------------------------------------------------------------
CREATE TABLE Bien_Soan_GT (
    ID_GT VARCHAR(10) NOT NULL,
    ID_TG VARCHAR(10) NOT NULL,
    PRIMARY KEY (ID_GT, ID_TG)
);
ALTER TABLE Bien_Soan_GT ADD FOREIGN KEY (ID_GT) REFERENCES Giao_Trinh(ID);
ALTER TABLE Bien_Soan_GT ADD FOREIGN KEY (ID_TG) REFERENCES Tac_Gia(ID);
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
CREATE TABLE Quanly_Lop_Hoc (
    ID_Nhomlop VARCHAR(10) NOT NULL,
    ID_GV VARCHAR(10) NOT NULL,
    ID_SV VARCHAR(10) NOT NULL,
    PRIMARY KEY (ID_Nhomlop, ID_GV, ID_SV)
);
ALTER TABLE Quanly_Lop_Hoc ADD FOREIGN KEY (ID_Nhomlop) REFERENCES Nhom_Lop(ID);
ALTER TABLE Quanly_Lop_Hoc ADD FOREIGN KEY (ID_GV) REFERENCES Giang_Vien(ID);
ALTER TABLE Quanly_Lop_Hoc ADD FOREIGN KEY (ID_SV) REFERENCES Sinh_Vien(ID);
-------------------------------------------------------------------------------------------------------------
CREATE TABLE Quanly_Mon_Hoc (
    ID_GV VARCHAR(10) NOT NULL,
    ID_Monhoc VARCHAR(6) NOT NULL,
    ID_GT VARCHAR(10) NOT NULL,
    PRIMARY KEY (ID_GV, ID_Monhoc, ID_GT)
);
ALTER TABLE Quanly_Mon_Hoc ADD FOREIGN KEY (ID_GV) REFERENCES Giang_Vien(ID);
ALTER TABLE Quanly_Mon_Hoc ADD FOREIGN KEY (ID_Monhoc) REFERENCES Mon_Hoc(ID);
ALTER TABLE Quanly_Mon_Hoc ADD FOREIGN KEY (ID_GT) REFERENCES Giao_Trinh(ID);
-------------------------------------------------------------------------------------------------------------
CREATE TABLE CT_Dao_Tao (
    Khoa_ID VARCHAR(10) NOT NULL,
    ID_Monhoc VARCHAR(6) NOT NULL,
    PRIMARY KEY (Khoa_ID, ID_Monhoc)
);
ALTER TABLE CT_Dao_Tao ADD FOREIGN KEY (Khoa_ID) REFERENCES Khoa(ID);
ALTER TABLE CT_Dao_Tao ADD FOREIGN KEY (ID_Monhoc) REFERENCES Mon_Hoc(ID);
-------------------------------------------------------------------------------------------------------------
CREATE TABLE giang_day (
    ID_GV VARCHAR(10) NOT NULL,
	ID_nhom_lop VARCHAR(10) NOT NULL ,
);
ALTER TABLE giang_day ADD FOREIGN KEY (ID_GV) REFERENCES Giang_Vien(ID);
ALTER TABLE giang_day ADD FOREIGN KEY (ID_nhom_lop) REFERENCES Nhom_Lop(ID);
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
CREATE TABLE weeks (
    ID_MH VARCHAR(6) NOT NULL,
    week VARCHAR(2) NOT NULL,
    PRIMARY KEY (ID_MH, week)
);
ALTER TABLE weeks ADD FOREIGN KEY (ID_MH) REFERENCES Mon_hoc(ID);
SELECT * FROM weeks;

