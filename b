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
 tanggal_biaya TANGGAL,
 KUNCI ASING (order_id) REFERENSI KartuPesanan (id)
);

MASUKKAN KE DALAM KARTUPesanan (id, order_number, product_type, order_number) NILAI
(1, 'ORD001', 'Produk A', 10),
(2, 'ORD002', 'Produk B', 5);

MASUKKAN KE DALAM RINCIANBiaya (id, order_id, cost_group, cost_amount, cost_date) NILAI
(1, 1, 'Bahan', 1000,00, '2023-01-15'),
(2, 1, 'Tenaga Kerja', 500.00, '2023-01-20'),
(3, 2, 'Bahan', 2000.00, '2023-02-10'),
(4, 2, 'Tenaga Kerja', 1000.00, '2023-02-15');

PILIH 
 TAHUN (rb.cost_date) AS tahun,
 BULAN (rb.cost_date) AS bulan,
 rb.kelompok biaya,
 SUM (rb.cost_amount) AS cost_amount
DARI 
 RincianBiaya rb
KELOMPOKKAN OLEH 
 TAHUN (rb.cost_date), BULAN (rb.cost_date), rb.cost_group
MEMERINTAHKAN OLEH 
 tahun, bulan, golong_biaya;
