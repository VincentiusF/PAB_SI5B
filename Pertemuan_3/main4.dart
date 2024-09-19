mixin Pencatat {
  void catat(String pesan) {
    print('catatan : $pesan');
  }
}

class Orang with Pencatat {
  String nama;

  Orang(this.nama);

  void sapa() {
    catat('Halo, nama saya $nama');
  }
}

void main() {
  var objOrang = Orang('Vincent');
  objOrang.sapa();
}