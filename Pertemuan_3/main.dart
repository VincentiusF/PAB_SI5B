class Mobil {
  String merek="";
  String model="";
  int tahunProduksi=0;

  void infoMobil() {
    print('mobil $merek $model $tahunProduksi');
  }
}

void main () {
  var objMobil = Mobil();

  objMobil.merek = 'Toyota';
  objMobil.model = 'Camry';
  objMobil.tahunProduksi = 2022;

  objMobil.infoMobil();
  
}