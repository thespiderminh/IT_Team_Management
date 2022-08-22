create database bai_tap_lon;

use bai_tap_lon;
create table nhan_vien (
	ma_nv varchar(10) not null,
    ho_ten nchar(50) not null,
    ngay_sinh date not null,
    que_quan nvarchar(100) not null,
    gioi_tinh__nam bit not null,
    dan_toc nvarchar(20) default "Kinh",
    so_dien_thoai varchar(10),
    email varchar(50),
    ma_vi_tri varchar(10) not null,
    tham_nien year not null,
    
    constraint pk_nhan_vien primary key (ma_nv)
);

create table vi_tri (
	ma_vi_tri varchar(10) not null,
    ten_vi_tri nvarchar(50) not null,
    
    constraint pk_vi_tri primary key (ma_vi_tri)
);

alter table nhan_vien add constraint fk_ma_vi_tri foreign key (ma_vi_tri) references vi_tri(ma_vi_tri);

create table cong_viec (
	ten_cong_viec nvarchar(100) not null,
    nhan_vien_dam_nhiem varchar(10) not null,
    tien_do varchar(10) not null,
    kho_khan nvarchar(100),
    
    constraint pk_cong_viec primary key (ten_cong_viec),
    constraint fk_cong_viec foreign key (nhan_vien_dam_nhiem) references nhan_vien(ma_nv)
);

create table loi (
	ten_loi nvarchar(100) not null,
    nguoi_gui_loi nvarchar(100) not null,
    nhan_vien_dam_nhiem varchar(10) not null,
    da_hoan_thanh bit not null default 0,
    kho_khan nvarchar(100),
    
    constraint pk_loi primary key (ten_loi),
    constraint fk_loi foreign key (nhan_vien_dam_nhiem) references nhan_vien(ma_nv)
);

create table muc_luong (
	ma_nv varchar(10) not null,
    luong_goc int not null,
    luong_thuong int default 0,
    tong_luong int not null,
    
    constraint pk_muc_luong primary key (ma_nv),
    constraint fk_muc_luong foreign key (ma_nv) references nhan_vien(ma_nv)
);

create table phat (
	ma_nv varchar(10) not null,
    li_do_phat nvarchar(100) not null,
    muc_phat int default 0,
    
    constraint fk_phat foreign key (ma_nv) references nhan_vien(ma_nv)
);

create table danh_gia_nhan_vien (
	ma_nv varchar(10) not null,
    danh_gia nvarchar(100) not null,
    
    constraint fk_danh_gia foreign key (ma_nv) references nhan_vien(ma_nv)
);

