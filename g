PILIH 
 id_pesanan,
 tipe_produk,
 kuantitas pesanan,
 kelompok biaya,
 biaya_jumlah
DARI 
 RincianBiaya
DIMANA 
 Jumlah biaya > 20000000
MEMERINTAHKAN OLEH 
 id_pesanan;
