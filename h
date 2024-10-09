PILIH 
 id_pesanan,
 tipe_produk,
 kuantitas pesanan,
 kelompok biaya,
 SUM (cost_amount) AS total_cost
DARI 
 RincianBiaya
KELOMPOKKAN OLEH 
 id pesanan, tipe_produk, kuantitas pesanan, grup_biaya
MEMERINTAHKAN OLEH 
 DESC total_biaya
BATAS 3;
