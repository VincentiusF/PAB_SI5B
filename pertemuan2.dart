void main() {
  String a = "Vincentius Fernando";
  int b = 177;
  var c = 17;
  

  print('Hai, aku $a. Tinggiku $b cm');
  print('Usiaku $c tahun');
  print(c.runtimeType);

  print('----------------');

  int x = 10;
  int y = 5;

  var tambah = x + y;
  var banding = x > y;
  var logika = (x > 5) && (y < 10);

  print('$x + $y = $tambah');
  print("$x > $y = $banding");
  print('($x > 5) and ($y < 10) = $logika');

  print('---------------');

  int nilai = 80;

  if(nilai >= 75) {
    print("selamat, anda lulus");
  }
  else{
    print('maaf, anda gagal');
  } 

}