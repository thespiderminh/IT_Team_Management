create database MAJORASSIGNMENT;

create table Nhan_Vien (
	MaNV varchar(10) not null,
    HoTen nchar(50) not null,
    NgaySinh date not null,
    QueQuan nvarchar(100) not null,
    GioiTinh_Nam bit not null,
    DanToc nvarchar(20) default "Kinh",
    SoDienThoai varchar(10),
    Email varchar(50),
    MaViTri varchar(10) not null,
    ThamNien year not null,
    
    constraint PK_Ma primary key (MaNV)
);

create table Vi_Tri (
	MaViTri varchar(10) not null,
    TenViTri nvarchar(50) not null,
    
    constraint PK_MaVT primary key (MaViTri)
);

alter table Nhan_Vien add constraint FK_MaVT foreign key (MaViTri) references Vi_Tri(MaViTri);

create table Cong_Viec (
	TenCongViec nvarchar(100) not null,
    NhanVienDamNhiem varchar(10) not null,
    TienDo varchar(10) not null,
    KhoKhan nvarchar(100),
    
    constraint PK_TenCV primary key (TenCongViec),
    constraint FK_TenCV foreign key (NhanVienDamNhiem) references Nhan_Vien(MaNV)
);

create table Loi (
	TenLoi nvarchar(100) not null,
    NguoiGuiLoi nvarchar(100) not null,
    NhanVienDamNhiem varchar(10) not null,
    DaHoanThanh bit not null default 0,
    KhoKhan nvarchar(100),
    
    constraint PK_Loi primary key (TenLoi),
	constraint FK_Loi foreign key (NhanVienDamNhiem) references Nhan_Vien(MaNV)
);

create table Muc_Luong (
	MaNV varchar(10) not null,
    LuongGoc int not null,
    LuongThuong int default 0,
    TongLuong int not null,
    
    constraint PK_MucLuong primary key (MaNV),
    constraint FK_MucLuong foreign key (MaNV) references Nhan_Vien(MaNV)
);

create table Phat (
	MaNV varchar(10) not null,
    LiDoPhat nvarchar(100) not null,
    MucPhat int default 0,
    
    constraint FK_Phat foreign key (MaNV) references Nhan_Vien(MaNV)
);

create table Danh_Gia_Nhan_Vien (
	MaNV varchar(10) not null,
    DanhGia nvarchar(100) not null,
    
    constraint FK_DanhGia foreign key (MaNV) references Nhan_Vien(MaNV)
);