create table if not exists KHACHHANG(
	MAKH varchar(40) not null,
	HOTEN varchar(40) not null,
    DCHI varchar(50) not null,
    SODT varchar(20) not null,
    NGSINH datetime,
    DOANHSO int not null,
    NGDANGKY datetime,
    primary key (MAKH)
);

create table if not exists NHANVIEN(
	MANV varchar(4) not null,
    HOTEN varchar(40) not null,
    DTHOAI varchar(20) not null,
    NGVL datetime not null,
    primary key (MANV)
);

create table if not exists SANPHAM(
	MASP varchar(4) not null,
    TENSP varchar(40) not null,
    DVT varchar (20) not null,
    NUOCSX varchar (40) not null,
    GIA int not null,
    primary key (MASP)
);

create table if not exists HOADON(
	SOHD int not null,
    NGHD datetime,
    MAKH varchar (40),
    MANV varchar(40),
    TRIGIA int not null,
	primary key (SOHD),
    foreign key (MAKH) REFERENCES KHACHHANG(MAKH) on update cascade,
    foreign key (MANV) REFERENCES NHANVIEN(MANV) on update cascade
);

create table if not exists CTHD(
	SOHD int not null,
    MASP varchar(40),
	SL int not null,
    primary key(SOHD,MASP),
    foreign key (MASP) references SANPHAM(MASP) on update cascade,
    foreign key (SOHD) references HOADON(SOHD) on update cascade
);