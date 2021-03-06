import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/product_screen.dart';
import '../providers/product.dart';

class ProductGridItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    print("Successfully fetched product provider for product: ${product.title}");
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
            ProductScreen.routeName, arguments: product);
      },
      child: GridTile(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            product.imageURL,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          leading: IconButton(
            icon: Icon(product.isFave ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              product.toggleFavorite();
            },
            color: Theme.of(context).accentColor,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
            color: Theme.of(context).accentColor,
          ),
          backgroundColor: Colors.black87,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
