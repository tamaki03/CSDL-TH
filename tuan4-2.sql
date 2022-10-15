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
