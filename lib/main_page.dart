import 'package:flutter/material.dart';
import 'package:flutter_grocery_ui/data.dart';
import 'package:flutter_grocery_ui/item_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          bool isTablet = MediaQuery.of(context).size.width < 1100 &&
              MediaQuery.of(context).size.width >= 850;
          bool isDesktop = MediaQuery.of(context).size.width >= 1100;
          bool isMobile = MediaQuery.of(context).size.width < 850;

          if (isDesktop) {
            return Container(
              child: GridView.builder(
                itemCount: alldata.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  // JIKA KENA OVERFLOW SECARA DEFAULT childAspectRatio 1/1 atur kembali supaya tidak kena overlow
                  childAspectRatio: .7,
                  // crossAxisSpacing adalah Jarak antara element
                  crossAxisSpacing: 10,
                  // crossAxisCount adalah BERAPA ELEMENT YG INGIN DI GROUP
                  crossAxisCount: 6,
                ),
                itemBuilder: (context, index) {
                  return ItemWidget(products: alldata[index]);
                },
              ),
            );
          }

          if (isTablet) {
            return Container(
              child: GridView.builder(
                itemCount: alldata.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  // JIKA KENA OVERFLOW SECARA DEFAULT childAspectRatio 1/1 atur kembali supaya tidak kena overlow
                  childAspectRatio: 0.7,
                  // crossAxisSpacing adalah Jarak antara element
                  crossAxisSpacing: 10,
                  // crossAxisCount adalah BERAPA ELEMENT YG INGIN DI GROUP
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return ItemWidget(products: alldata[index]);
                },
              ),
            );
          }

          //mobile
          return Container(
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
        },
      ),
    );
  }
}
