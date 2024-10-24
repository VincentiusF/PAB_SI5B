import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Anak Pertama : Gambar
              Image.asset('images/cover.jpg'),
              // Anak Kedua : Judul Indonesia
              Container(
                margin: const EdgeInsets.all(16.0),
                child: const Text(
                  'INDONESIA',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26.0, fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Anak Ketiga : Deskripsi tentang Indonesia
              Container(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: const Text(
                  'Indonesia, dengan nama resmi Republik Indonesia,[a] adalah sebuah negara kepulauan di Asia Tenggara yang dilintasi garis khatulistiwa dan berada di antara daratan benua Asia dan Oseania sehingga dikenal sebagai negara lintas benua, serta antara Samudra Pasifik dan Samudra Hindia.Indonesia merupakan negara terluas ke-14 sekaligus negara kepulauan terbesar di dunia dengan luas wilayah sebesar 1.904.569 km²,[12] serta negara dengan pulau terbanyak ke-6 di dunia, dengan jumlah 17.504 pulau.[13] Nama alternatif yang dipakai untuk kepulauan Indonesia disebut Nusantara.[14] Selain itu, Indonesia juga menjadi negara berpenduduk terbanyak ke-4 di dunia dengan penduduk mencapai 275.344.166 jiwa pada tahun 2022,[15] serta negara dengan penduduk beragama Islam terbanyak di dunia setelah Pakistan, dengan penganut lebih dari 244 juta jiwa atau sekitar 87.1%.[16][17] Indonesia adalah negara multiras, multietnis, dan multikultural di dunia, seperti halnya Amerika Serikat.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              // Anak Keempat
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    //Gambar ke 1
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSc8ShasOw7Ugd3tgMnGPSB-ZIKXy9JgPU50A&s'),
                      ),
                    ),

                    //Gambar ke 2
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlxojHo5QjBC9FikOEUZDbGAPvQa-BW4O27w&s'),
                      ),
                    ),

                     //Gambar ke 3
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network('https://www.komodoluxury.com/wp-content/uploads/2023/04/Famous-natural-landmarks-in-Indonesia-9.webp'),
                      ),
                    ),

                    //Gambar ke 4
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyH36S2iFIktcaH7H0m8ZPxKkZOVGJZGnNMw&s'),
                      ),
                    )
                  ],
                ),
              ),
              // Anak Kelima
              Container()
            ],
          ),
        )
      ),
    );
  }
}
