BUAT TABEL KartuPesanan (
 id INT KUNCI UTAMA,
 nomor_pesanan VARCHAR (255),
 tipe_produk VARCHAR (255),
 pesanan kuantitas INT
);

BUAT TABEL RINCIANBiaya (
 id INT KUNCI UTAMA,
 order_id INT,
 kelompok biaya VARCHAR (255),
 biaya_jumlah DESIMAL (10, 2),
 KUNCI ASING (order_id) REFERENSI KartuPesanan (id)
);

MASUKKAN KE DALAM KARTUPesanan (id, order_number, product_type, order_number) NILAI
(1, 'ORD001', 'Produk A', 10),
(2, 'ORD002', 'Produk B', 5);

MASUKKAN KE DALAM RINCIANBiaya (id, order_id, cost_group, cost_amount) NILAI
(1, 1, 'Bahan', 1000,00),
(2, 1, 'Tenaga Kerja', 500,00),
(3, 2, 'Bahan', 2000.00),
(4, 2, 'Buruh', 1000,00);

PILIH 
 kp.nomor_pesanan,
 kp.tipe_produk,
 kp.besaran_kuantitas,
 SUM (KASUS KETIKA rb.cost_group MASUK ('Material', 'Tenaga Kerja') LALU rb.cost_amount ELSE 0 AKHIR) SEBAGAI direct_cost,
 SUM (KASUS KETIKA rb.cost_group MASUK ('Material', 'Tenaga Kerja') LALU rb.cost_amount ELSE 0 AKHIR) * 0,30 SEBAGAI overhead,
 SUM (KASUS KETIKA rb.cost_group MASUK ('Bahan', 'Tenaga Kerja') LALU rb.cost_amount ELSE 0 AKHIR) + 
 (SUM (KASUS KETIKA rb.cost_group MASUK ('Material', 'Tenaga Kerja') LALU rb.cost_amount ELSE 0 AKHIR) * 0,30) SEBAGAI total_cost,
 (SUM (KASUS KETIKA rb.cost_group MASUK ('Bahan', 'Tenaga Kerja') LALU rb.cost_amount ELSE 0 AKHIR) + 
 (SUM (KASUS KETIKA rb.cost_group MASUK ('Bahan', 'Tenaga Kerja') LALU rb.cost_amount ELSE 0 AKHIR) * 0,30))/kp.order_quantitas AS cost_per_unit
DARI 
 KartuPesanan kp
BERGABUNG 
 RincianBiaya rb PADA kp.id = rb.order_id
KELOMPOKKAN OLEH 
 kp.nomor_pesanan, kp.tipe_produk, kp.besar_kuantitas
MEMERINTAHKAN OLEH 
 kp.nomor_pesanan;
