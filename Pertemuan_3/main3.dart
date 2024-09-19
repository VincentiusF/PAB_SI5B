class Hewan {
  String nama = '';
}

class Kucing extends Hewan {
  void suara() {
    print('$nama mengeong');
  }
}

void main() {
  var objKucing = Kucing();
  objKucing.nama = 'Kucing Anggora';
  objKucing.suara();
}