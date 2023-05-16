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
    quantity int,
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


insert into PRODUK(produk_id, kategori_id, Nama_produk, harga, quantity)
values 
-- T-shirt
('TSH01', 'k0001', 'T-shirt Oversize Lengan Pendek', 149000, 165),
('TSH02', 'k0001', 'T-shirt Grafis Monokrom', 129000, 155),
('TSH03', 'k0001', 'T-shirt Basic Putih', 99000, 160),
('TSH04', 'k0001', 'T-shirt Vintage Washed', 139000, 170),
('TSH05', 'k0001', 'T-shirt Polo Slim Fit', 169000, 175),
('TSH06', 'k0001', 'T-shirt Striped Breton', 119000, 165),
('TSH07', 'k0001', 'T-shirt Tie-Dye', 159000, 160),
('TSH08', 'k0001', 'T-shirt Pocket Detail', 109000, 170),
-- Jeans
('JNS01', 'k0002', 'Jeans Ultra Strech', 549000, 213),
('JNS02', 'k0002', 'Jeans Skinny Fit', 349000, 206),
('JNS03', 'k0002', 'Jeans Slim Fit', 499000, 152),
('JNS04', 'k0002', 'Jeans Potongan Klasik', 549000, 44),
('JNS05', 'k0002', 'Jeans Wide Fit', 399000, 101),
('JNS06', 'k0002', 'Jeans Slim Fit (Damaged)', 599000, 143),
('JNS07', 'k0002', 'Jeans Slim Fit Strech Selvedge', 499000, 129),
('JNS08', 'k0002', 'Jeans Skinny Fit Denim', 599000, 244),
-- Dresses
('DRS01', 'k0003', 'Libra Dress', 549000, 45),
('DRS02', 'k0003', 'Floral Elegance Dress', 699000, 67),
('DRS03', 'k0003', 'Ruffled Charm Dress', 599000, 42),
('DRS04', 'k0003', 'Vintage Lace Gown', 899000, 50),
('DRS05', 'k0003', 'Bohemian Maxi Dress', 749000, 62),
('DRS06', 'k0003', 'Off-Shoulder Romance', 649000, 81),
('DRS07', 'k0003', 'Polka Dot Delight', 499000, 40),
('DRS08', 'k0003', 'Satin Slip Dress', 799000, 67),

-- Sweater
('SWT01', 'k0004', 'Oversize Sweater Oblong', 399000, 67),
('SWT02', 'k0004', 'Cozy Knit Pullover', 459000, 221),
('SWT03', 'k0004', 'Chunky Cable-Knit Sweater', 549000, 42),
('SWT04', 'k0004', 'Turtleneck Sweater Dress', 699000, 223),
('SWT05', 'k0004', 'Striped Mohair Sweater', 579000, 231),
('SWT06', 'k0004', 'Hooded Fleece Sweatshirt', 399000, 150),
('SWT07', 'k0004', 'Cropped Cashmere Sweater', 799000, 123),
('SWT08', 'k0004', 'Fair Isle Knit Sweater', 649000, 212),
-- Shoes
('SHS01', 'k0005', 'Running Shoes (Women', 549000, 234),
('SHS02', 'k0005', 'Running Shoes (Men)', 549000, 123),
('SHS03', 'k0005', 'Casual Sneakers (Women)', 499000, 122),
('SHS04', 'k0005', 'Casual Sneakers (Men)', 499000, 190),
('SHS05', 'k0005', 'Athletic Training Shoes (Women)', 599000, 121),
('SHS06', 'k0005', 'Athletic Training Shoes (Men)', 599000, 0),
('SHS07', 'k0005', 'Fashion Boots (Women)', 699000, 123),
('SHS08', 'k0005', 'Fashion Boots (Men)', 699000, 231),
-- Accssories
('ACC01', 'k0006', 'Topi Bucket', 129000, 100),
('ACC02', 'k0006', 'Gelang Kulit', 99000, 45),
('ACC03', 'k0006', 'Kalung Choker', 69000, 131),
('ACC04', 'k0006', 'Kacamata Retro', 149000, 71),
('ACC05', 'k0006', 'Sarung Tangan Wol', 79000, 189),
('ACC06', 'k0006', 'Sabuk Kulit', 129000, 250),
('ACC07', 'k0006', 'Koper Kanvas', 349000, 230),
('ACC08', 'k0006', 'Scarf Rajut', 109000, 201),
-- Activewear
('ATW01', 'k0007', 'Yoga Leggin', 199000, 43),
('ATW02', 'k0007', 'Running Shorts', 149000, 194),
('ATW03', 'k0007', 'Sports Bra', 99000, 193),
('ATW04', 'k0007', 'Performance Tank Top', 129000, 123),
('ATW05', 'k0007', 'Athletic Hoodie', 179000, 588),
('ATW06', 'k0007', 'Training Compression Socks', 69000, 199),
('ATW07', 'k0007', 'CrossFit Gloves', 79000, 60),
('ATW08', 'k0007', 'Cycling Jersey', 169000, 164),
-- Outerwear
('OTW01', 'k0008', 'Cape Blazer', 349000, 142),
('OTW02', 'k0008', 'Trench Coat', 499000, 191),
('OTW03', 'k0008', 'Bomber Jacket', 259000, 45),
('OTW04', 'k0008', 'Parka Hoodie', 389000, 52),
('OTW05', 'k0008', 'Denim Jacket', 279000, 0),
('OTW06', 'k0008', 'Puffer Vest', 199000, 121),
('OTW07', 'k0008', 'Leather Biker Jacket', 599000, 131),
('OTW08', 'k0008', 'Windbreaker', 229000, 73)
;

