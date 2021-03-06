import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../widgets/products_grid_widget.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  static const String routeName = "/products-overview-screen";

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var showFavoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    print("Building products overview screen");
    return Scaffold(
      appBar: AppBar(
        title: Text('Rainforest: ${showFavoritesOnly}'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions sv) {
              setState(() {
                if (sv == FilterOptions.Favorites) {
                  showFavoritesOnly = true;
                } else if (sv == FilterOptions.All) {
                  showFavoritesOnly = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                  child: Text('Favorites'), value: FilterOptions.Favorites),
              PopupMenuItem(child: Text('All'), value: FilterOptions.All),
            ],
          )
        ],
      ),
      body: ProductsGrid(showFavoritesOnly),
    );
  }
}
