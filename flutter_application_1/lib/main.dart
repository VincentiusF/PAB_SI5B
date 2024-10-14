import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Menghilangkan pita debug di atas kanan
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Widget Demo'),
          backgroundColor: Colors.blue,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.blue,
              margin: const EdgeInsets.all(12),
              height: 200,
              width: double.infinity,
              child: const Center(
                child: Text(
                  'data',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Tombol Elevated'),
            ),
            // GestureDetector(
            //   onTap: () {
            //     print('Pak Faris Ganteng');
            //   },
            //   child: Container(
            //     child: Text('Gesture Detector'),
            //   ),
            // ),
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star_rate, color: Colors.yellow),
                Text('Rating:'),
                Text('4.5'),
              ],
            ),
            const SizedBox(height: 12),
            Image.network(
                'https://ichef.bbci.co.uk/ace/ws/640/cpsprodpb/8991/production/_104871253_1a76b03a-0a86-4ee3-85de-46f66d7f179e.jpg.webp'),
          ],
        ),
      ),
    );
  }
}
