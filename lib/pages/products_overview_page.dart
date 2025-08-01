import 'package:e_commerce/components/product_grid.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/models/product_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum FilterOptions { Favorites, All }

class ProductsOverviewPage extends StatelessWidget {
  ProductsOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Loja'),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Somente favoritos'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(child: Text('Todos'), value: FilterOptions.All),
            ],
            onSelected: (FilterOptions selectValue) {
              if (selectValue == FilterOptions.Favorites) {
                provider.showFavoriteOnly();
              } else {
                provider.showAll();
              }
            },
          ),
        ],
      ),

      body: Padding(padding: const EdgeInsets.all(10), child: ProductGrid()),
    );
  }
}
