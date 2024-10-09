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
 kp.product_type AS produk,
 SUM (rb.cost_amount) AS cost_amount
DARI 
 KartuPesanan kp
BERGABUNG 
 RincianBiaya rb PADA kp.id = rb.order_id
KELOMPOKKAN OLEH 
 kp.tipe_produk
MEMERINTAHKAN OLEH 
 kp.tipe_produk;
