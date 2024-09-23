void main () async {
  print('Mempersiapkan Pesanan Anda...');

  try {
    var pesanan = await getOrder();
    print('Pesanan Anda : $pesanan');
  }catch(pesanError) { 
    print('Maaf, $pesanError');
  }finally {
    print('Terima Kasih');
  }

}

Future<String> getOrder() {
  return Future.delayed(Duration(seconds: 3), (){
    var isReady = true;
    if(isReady) {
      return 'Kopi Gula Aren';
    }
    else {
      throw 'Pesanan Anda Habis';
    }
    
  }); //future delayed
}