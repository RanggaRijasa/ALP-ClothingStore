DROP DATABASE clothingstore;
CREATE DATABASE clothingstore;
USE clothingstore;

-- Customer akun
create table Customer(
	Customer_id varchar(5),
    Nama_customer varchar(50) not null,
    Email_customer varchar(50) not null,
    Password_customer varchar(50) not null,
    constraint Email_customer unique (Email_customer),
    Primary Key (Customer_id)
);

-- Produk

create table KATEGORI_PRODUK(
	kategori_id varchar (5),
    Nama_kategori varchar (50) not null,
	Primary Key (kategori_id)
);

create table PRODUK(
	Produk_id varchar (5),
    kategori_id varchar (5),
    Nama_produk varchar(50) not null,
	harga int,
	Primary Key (Produk_id),
    constraint fk_kategori foreign key (kategori_id) references KATEGORI_PRODUK(kategori_id)
    -- foreign key (kategori_id) references KATEGORI_PRODUK(kategori_id)
);



/*
alter table PRODUK
	add constraint foreign key(Nama_kategori) references KATEGORI_PRODUK(Nama_kategori);
*/
    
create table WARNA(
	Warna_id varchar (5),
    Nama_warna varchar (50) not null,
	Primary Key (Warna_id)
);

create table UKURAN(
	Ukuran_id varchar (5),
    Nama_ukuran varchar (50) not null,
	Primary Key (Ukuran_id)
);

-- Transaksi/Sales

create table TRANSAKSI(
	Transaksi_id varchar (5),
    Tanggal_transaksi date,
    Total_harga int,
	Primary Key (Transaksi_id)
);

create table DETAIL_TRANSAKSI(
	Detail_id varchar (5),
    Transaksi_id varchar (5),
    Produk_id varchar (5),
    Warna_id varchar (5),
    Ukuran_id varchar (5),
    foreign key (Transaksi_id) references TRANSAKSI(Transaksi_id),
    foreign key (Produk_id) references PRODUK(Produk_id),
    foreign key (Warna_id) references WARNA(Warna_id),
    foreign key (Ukuran_id) references UKURAN(Ukuran_id),
    Jumlah int default 0
);

-- Wishlist

create table WISHLISTS(
	Customer_id varchar (5),
	Wishlist_id varchar (5),
    Nama_Wishlist varchar (50) not null,
    primary key (Wishlist_id),
    foreign key (Customer_id) references CUSTOMER(Customer_id)
);

create table DETAIL_WISHLIST(
	Wishlist_id varchar (5),
	Produk_id varchar (5),
    Warna_id varchar (5),
    Ukuran_id varchar (5),
    foreign key (Wishlist_id) references WISHLISTS(Wishlist_id),
	foreign key (Produk_id) references PRODUK(Produk_id),
    foreign key (Warna_id) references WARNA(Warna_id),
    foreign key (Ukuran_id) references UKURAN(Ukuran_id)
);



