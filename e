PILIH 
 kelompok biaya,
 SUM (biaya_jumlah) SEBAGAI total_cost,
 HITUNG (ID pesanan TERPISAH) SEBAGAI besaran_kuantitas,
 AVG (cost_amount) AS biaya rata-rata,
 MAX (cost_amount) SEBAGAI biaya tertinggi,
 MIN (cost_amount) AS biaya terendah
DARI 
 RincianBiaya
KELOMPOKKAN OLEH 
 golong_biaya
MEMERINTAHKAN OLEH 
 grupa_biaya;
