import 'package:flutter/material.dart';
import 'package:test_auth/GetData.dart';
import 'package:toast/toast.dart';

class ProductTab extends StatefulWidget {
  @override
  _ProductTabState createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            ...List.generate(
              myProducts.length,
              (index) {
                return ProductCard(product: myProducts[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1,
    @required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: SizedBox(
        width: width,
        child: GestureDetector(
          onTap: () => {
            ToastView.createView('Trial Version', context, Toast.LENGTH_SHORT,
                Toast.BOTTOM, Colors.black87, Colors.white, 20, null),
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 2,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xE8C9C9C9).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(product.images),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.title,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFF7643),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(8),
                      height: 28,
                      width: 28,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Product {
  final String title;
  final String images;
  final String price;

  Product({
    @required this.images,
    @required this.title,
    @required this.price,
  });
}

List<Product> myProducts = [
  Product(
    images: imageUrl[0],
    title: name[0],
    price: priceData[0],
  ),
  Product(
    images: imageUrl[1],
    title: name[1],
    price: priceData[1],
  ),
  Product(
    images: imageUrl[2],
    title: name[2],
    price: priceData[2],
  ),
  Product(
    images: imageUrl[3],
    title: name[3],
    price: priceData[3],
  ),
  Product(
    images: imageUrl[4],
    title: name[4],
    price: priceData[4],
  ),
  Product(
    images: imageUrl[5],
    title: name[5],
    price: priceData[5],
  ),
  Product(
    images: imageUrl[6],
    title: name[6],
    price: priceData[6],
  ),
  Product(
    images: imageUrl[7],
    title: name[7],
    price: priceData[8],
  ),
  Product(
    images: imageUrl[9],
    title: name[9],
    price: priceData[9],
  ),
  Product(
    images: imageUrl[10],
    title: name[10],
    price: priceData[10],
  ),
  Product(
    images: imageUrl[11],
    title: name[11],
    price: priceData[11],
  ),
];
