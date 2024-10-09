PILIH 
 id_pesanan,
 tipe_produk,
 kuantitas pesanan,
 kelompok biaya,
 biaya_jumlah
DARI 
 RincianBiaya
DIMANA 
 product_type = 'sepatu'
MEMERINTAHKAN OLEH 
 id_pesanan;
