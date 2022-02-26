import 'package:flutter/material.dart';
import 'package:project1/Pages/Data.dart';

class ProductWidget extends StatelessWidget {
  final Products product;

  const ProductWidget({Key? key, required this.product})
      // ignore: unnecessary_null_comparison
      : assert(product != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    //print(product.imageurl);

    return Card(
      child: ListTile(
        leading: Image.network("${product.image}"),
        //  leading: Text("${product.imageurl}"),
        title: Text("${product.name}"),
        trailing: Text(
          "\$${product.price}",
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
