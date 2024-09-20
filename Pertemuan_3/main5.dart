class PersegiPanjang{
  int panjang;
  int lebar;
  
  PersegiPanjang(this.panjang,this.lebar);
  
  int hitungLuas(){
    return panjang * lebar;
  }
  
  int hitungKeliling(){
    return 2* ( lebar + panjang);    
  }
  
}

void main(){
  var OPP = PersegiPanjang(5,3);
  
  print('Luas     = ${OPP.hitungLuas()}');
  print('Keliling = ${OPP.hitungKeliling()}');
  
}