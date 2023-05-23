SELECT * FROM clothingstore.produk;
select produk_image from produk where produk_id = 'ACC01';
alter table PRODUK
add column produk_image blob;
update produk
set produk_image = "\\resource\\topi_bucket.jpeg" where Produk_id = 'ACC01';