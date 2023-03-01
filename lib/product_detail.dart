import 'package:flutter/material.dart';
import 'package:flutter_grocery_ui/data.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, required this.product});
  final DataProductBuah product;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    var stockProduk = int.parse(widget.product.stock!);

    // NOTED: function untuk menambah nilai variabel count product
    calculateCountPlus() async {
      if (count >= stockProduk) {
        await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text('Upss.. Stock product hanya $stockProduk'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"),
                  ),
                ],
              );
            });
        setState(() {
          count = stockProduk;
        });
      } else {
        setState(() {
          count = count + 1;
        });
      }
    }

    // NOTED: function untuk mengurangi nilai variabel count product
    calculateCountMinus() {
      setState(() {
        if (count <= 1) {
          count = 1;
        } else {
          count = count - 1;
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          "Product Detail ${widget.product.id}",
          style: const TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(
              right: 8.0,
            ),
            child: Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${widget.product.name}',
            style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w600,
            ),
          ),
          Center(
            child: Hero(
              tag: '${widget.product.image}',
              child: Container(
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('${widget.product.image}'),
                      fit: BoxFit.contain),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Row(
              children: [
                Text(
                  'Rp. ${widget.product.price}',
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '/${widget.product.quanty}',
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            // flex: 1,
            child: Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(20),
              child: Text(
                '${widget.product.description}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ),
          ),
          Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.bottomCenter,
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          calculateCountMinus();
                        },
                        icon: const Icon(
                          Icons.remove_circle_outline,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '$count',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          calculateCountPlus();
                        },
                        icon: const Icon(
                          Icons.add_circle_outline,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 110,
                        height: 60,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                          color: Colors.blue,
                        ),
                        child: const Center(
                          child: Text(
                            'Add to cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 110,
                        height: 60,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                          color: Colors.green,
                        ),
                        child: const Center(
                          child: Text(
                            'Pesan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
