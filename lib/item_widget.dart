import 'package:flutter/material.dart';
import 'package:flutter_grocery_ui/data.dart';
import 'package:flutter_grocery_ui/product_detail.dart';

class ItemWidget extends StatelessWidget {
  final DataProductBuah products;
  const ItemWidget({super.key, required this.products});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetail(
            product: products,
          ),
        ),
      ),
      child: Card(
          elevation: 2,
          shadowColor: Colors.green,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: '${products.image}',
                child: SizedBox(
                  width: 150,
                  child: Image.asset('${products.image}'),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Rp. ${products.price}',
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                ' ${products.name}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Divider(height: 2, color: Colors.grey),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: const [
                      Icon(Icons.shopping_cart, size: 20, color: Colors.green),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        'Beli',
                        style: TextStyle(color: Colors.green, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Row(
                    children: const [
                      Icon(
                        Icons.remove_circle_outline,
                        size: 18,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text('0'),
                      ),
                      Icon(
                        Icons.add_circle_outline,
                        size: 18,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ],
              )
            ],
          )),
    );
  }
}
