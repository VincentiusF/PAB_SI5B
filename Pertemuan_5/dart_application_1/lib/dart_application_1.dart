void main () {
  getOrder().then((pesanan){
    print("Pesanan Anda : $pesanan");
  }).catchError((pesanError){
    print('Maaf.$pesanError');
  }).whenComplete((){
    print("Terima Kasih");
  });

  print("Mempersiapkan Pesanan Anda.....");
}

Future<String> getOrder() {
  return Future.delayed(Duration(seconds: 3), (){
    var isReady = false;
    if(isReady) {
      return 'Kopi Gula Aren';
    }
    else {
      throw 'Pesanan Anda Habis';
    }
    
  }); //future.delayed
}