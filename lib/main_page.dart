import 'package:flutter/material.dart';
import 'package:flutter_grocery_ui/data.dart';
import 'package:flutter_grocery_ui/item_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final data = DataProductBuah('Bayam', '2.000', 'ikat', 'assets/img1.png',
      'Secara umum sayuran dan buah-buahan merupakan sumber berbagai vitamin, mineral');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        itemCount: alldata.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          // JIKA KENA OVERFLOW SECARA DEFAULT childAspectRatio 1/1 atur kembali supaya tidak kena overlow
          childAspectRatio: 0.7,
          // crossAxisSpacing adalah Jarak antara element
          crossAxisSpacing: 10,
          // crossAxisCount adalah BERAPA ELEMENT YG INGIN DI GROUP
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return ItemWidget(products: alldata[index]);
        },
      ),
    );
  }
}
