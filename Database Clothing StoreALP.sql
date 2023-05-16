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

insert into Customer (Customer_id, Nama_customer, Email_customer, Password_customer)
values
('C9999','Guest','guest@gmail.com','000000000'),				-- data guest untuk guest login nanti
('C0000','Rangga Rijasa','ranggar@gmail.com','1234567890'),
('C0001','John Smith','johnsmith@example.com','p@ssw0rd1'),
('C0002','Emily Johnson','ejohnson@example.com','secure123'),
('C0003','Michael Brown','mbrown@example.com','password123'),
('C0004','Sarah Davis','sdavis@example.com','mysecretpass'),
('C0005','David Wilson','dwilson@example.com','abc123'),
('C0006','Jennifer Lee','jlee@example.com','ilovecats'),
('C0007','Robert Clark','rclark@example.com','qwerty123'),
('C0008','Jessica Hall','jhall@example.com','letmein'),
('C0009','Andrew Young','ayoung@example.com','123456'),
('C0010','Amanda Turner','aturner@example.com','passw0rd!'),
('C0011','Brian Moore','bmoore@example.com','sunshine123'),
('C0012','Megan Lewis','mlewis@example.com','hello123'),
('C0013','Christopher Hill','chill@example.com','mypassword'),
('C0014','Samantha Martinez','smartinez@example.com','secretword'),
('C0015','William Anderson','wanderson@example.com','ilovemydog'),
('C0016','Olivia Garcia','ogarcia@example.com','qwertyuiop'),
('C0017','Daniel Rodriguez','drodriguez@example.com','987654321'),
('C0018','Sophia Jackson','sjackson@example.com','pass123!'),
('C0019','James Taylor','jtaylor@example.com','1qaz2wsx'),
('C0020','Lily Adams','ladams@example.com','welcome123');

insert into KATEGORI_PRODUK (kategori_id, Nama_kategori)
values
('k0001','T-shirts'),
('k0002','Jeans'),
('k0003','Dresses'),
('k0004','Sweaters'),
('k0005','Shoes'),
('k0006','Accessories'),
('k0007','Activewear'),
('k0008','Outerwear');

