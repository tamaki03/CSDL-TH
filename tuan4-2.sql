create table if not exists DMKHOA(
	MaKhoa varchar(50) not null,
	TenKhoa varchar(50) not null,
    primary key(MaKhoa)
);

create table if not exists DMNGANH(
	MaNganh int not null,
	TenNganh varchar(50) not null,
	MaKhoa varchar(50) not null,
	primary key(MaNganh),
    foreign key(MaKhoa) references DMKHOA(MaKhoa) on update cascade
);

create table if not exists DMLOP(
	MaLop varchar(50) not null,
    TenLop varchar(50) not null,
    MaNganh  int not null,
    KhoaHoc int not null,
    HeDT varchar(10) not null,
    NamNhapHoc int not null,
    primary key(MaLop),
    foreign key(MaNganh) REFERENCES DMNGANH(MaNganh) ON UPDATE CASCADE 
);

create table if not exists SINHVIEN(
	MaSV int not null,
    HoTen varchar(50) not null,
    MaLop varchar(10) not null,
    GioiTinh bool not null,
	NgaySinh datetime,
	DiaChi varchar(50) not null,
	primary key(MaSV),
	foreign key(MaLop) REFERENCES DMLOP(MaLop) ON UPDATE CASCADE 
);

create table if not exists DMHOCPHAN(
	MaHP int not null,
    TenHP varchar(50) not null,
	Sodvht int not null,
	MaNganh int not null,
	HocKy int not null,
    primary key(MaHP)
);


create table if not exists DIEMHP(
	MaSV int not null,
	MaHP int not null,
	DiemHP int not null,
	primary key (MaSV,MaHP),
    foreign key (MaSV) references SINHVIEN(MaSV) ON UPDATE CASCADE ,
    foreign key (MaHP) references DMHOCPHAN(MaHP) ON UPDATE CASCADE 
);
INSERT INTO DMKHOA
	(MaKhoa,TenKhoa)
VALUES
	('CNTT','Công Nghệ Thông Tin'),
    ('KT','Kế Toán'),
    ('SP','Sư Phạm');
    

INSERT INTO DMNGANH
	(MaNganh,TenNganh,MaKhoa)
VALUES
	(140902,'Sư phạm toán tin','SP'),
    (480202,'Tin học ứng dụng','CNTT');
    
INSERT INTO DMLOP
	(MaLop,TenLop,MaNganh,KhoaHoc,HeDT,NamNhapHoc)
VALUES
	('CT11','Cao đẳng tin học ',480202 ,11 ,'TC ',2013),
	('CT12' ,'Cao đẳng tin học ',480202 ,12 ,'CĐ ',2013),
	('CT13' ,'Cao đẳng tin học ',480202 ,13 ,'CĐ ',214);
    
INSERT INTO SINHVIEN
	(MaSV,HoTen,MaLop,GioiTinh,NgaySinh,DiaChi)
VALUES
	(002 ,'Nguyễn Thị Cẩm', 'CT12' ,True ,'1994-12-01','Quy Nhơn'),
	(003 ,'Võ Thị Hà ','CT12',True ,'1995-02-07','An Nhơn'),
	(004 ,'Trần Hoài Nam','CT12',False	,'1994-05-04','Tây sơn'),
	(005 ,'Trần Văn Hoàng','CT13',False ,'1995-04-08','Vĩnh Thạch'),
	(006 ,'Đăng Thị Thảo', 'CT13',True ,'1995-12-06','Quy Nhơn'),
	(007 ,'Lê Thị Sen','CT13',True ,'1994-12-08','Phù Cát'),
	(008 ,'Nguyễn Văn Huy', 'CT11',False ,'1995-04-06','Phù Mỹ'),
	(009 ,'Trần Thị Hoa', 'CT11',True ,'1994-09-08','Hoài Nhơn');

INSERT INTO DMHOCPHAN
	(MaHP,TenHP,Sodvht,MaNganh,HocKy)
VALUES
	(001 ,'Toán cao cấp A1',4 ,480202 ,1),
	(002 ,'Tiếng Anh 1',3 ,480202 ,1),
	(003 ,'Vật lý đại cương',4 ,480202 ,1),
	(004 ,'Tiến anh 2',7 ,480202 ,1),
	(005 ,'Tiếng anh 1',3 ,140909 ,2),
	(006 ,'Xác suất thông kê',3 ,140902 ,2);
    

INSERT INTO DIEMHP 
	(MaSV,MaHP,DiemHP)
VALUES
	(002 ,002 ,5.9),
	(002 ,003 ,4.5),
	(003 ,001 ,4.3),
	(003 ,002 ,6.7),
	(003 ,003 ,7.3),
	(004 ,001 ,4.0),
	(004 ,002 ,5.2),
	(004 ,003 ,3.5),
	(005 ,001 ,9.8),
	(005 ,002 ,7.9),
	(006 ,001 ,6.1),
	(006 ,002 ,5.6),
	(006 ,003 ,4.0),
	(007 ,001 ,6.2);

/*bai 1*/
SELECT MaSV,  HoTen,  MaLop,  NgaySinh, GioiTinh, YEAR(NgaySinh) AS NamSinh
FROM SINHVIEN
WHERE HoTen NOT LIKE 'N%' AND HoTen NOT LIKE 'L%' AND HoTen NOT LIKE 'L%';

/*bai 2*/    
SELECT MaSV,  HoTen,  MaLop,  NgaySinh, GioiTinh,  YEAR(NgaySinh) AS NamSinh
FROM SINHVIEN
WHERE MaLop = 'CT11' AND GioiTinh = 'False';

/*bai 3*/
SELECT MaSV,  HoTen,  MaLop,  NgaySinh, GioiTinh
FROM SINHVIEN
WHERE MaLop IN ('CT11','CT12', 'CT13');

/*bai 4*/
SELECT MaSV,  HoTen,  MaLop,  NgaySinh, GioiTinh, (2022 - YEAR(NgaySinh)) AS Tuoi
FROM SINHVIEN
WHERE (2022 - YEAR(NgaySinh)) BETWEEN '19' AND '21';

/*bai 5*/
SELECT SINHVIEN.MaSV, HoTen, MaLop, DiemHP, MaHP
FROM SINHVIEN
INNER JOIN DIEMHP ON DIEMHP.MaSV=SINHVIEN.MaSV
WHERE DiemHP>5;

/*bai 6*/
SELECT SINHVIEN.MaSV, HoTen, MaLop, DiemHP, MaHP
FROM SINHVIEN
INNER JOIN DIEMHP ON DIEMHP.MaSV=SINHVIEN.MaSV
ORDER BY MaLop,HoTen ASC;

/*bai 7*/
SELECT SINHVIEN.MaSV, HoTen, MaLop, DiemHP, DIEMHP.MaHP,Hocky
FROM SINHVIEN
INNER JOIN DIEMHP ON SINHVIEN.MaSV=DIEMHP.MaSV
INNER JOIN DMHOCPHAN ON DMHOCPHAN.MaHP=DIEMHP.MaHP
WHERE (DIEMHP>=5 AND DIEMHP<=7) AND HocKy='1';


/*bai 8*/
SELECT MaSV, HoTen, SINHVIEN.MaLop, TenLop, MaKhoa
FROM SINHVIEN
INNER JOIN DMLOP ON SINHVIEN.MaLop=DMLOP.MaLop
INNER JOIN DMNGANH ON DMNGANH.MaNganh=DMLOP.MaNganh
WHERE MaKhoa='CNTT';
    










