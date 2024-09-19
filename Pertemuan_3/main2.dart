class Mobil {
  String merek;
  String model;
  int tahunProduksi;

  Mobil(this.merek, this.model, this.tahunProduksi);

  void infoMobil() {
    print('Mobil $merek $model $tahunProduksi');
  }
}

void main () {
  var objMobil1 = Mobil('Toyota', 'Camry', 2022);
  var objMobil2 = Mobil('Mitsubishi', 'Xpander', 2023);
  

  objMobil1.infoMobil();
  objMobil2.infoMobil();
  
}