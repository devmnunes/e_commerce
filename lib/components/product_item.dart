// product_item.dart

import 'package:e_commerce/blocs/product_bloc.dart';
import 'package:e_commerce/blocs/product_state.dart';
import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.PRODUCT_DETAIL,
              arguments: product,
            );
          },
          child: Image.network(product.imageUrl, fit: BoxFit.cover),
        ),
        footer: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) =>
           GridTileBar(
            backgroundColor: Colors.black45,
            leading: IconButton(
              icon: Icon(
                
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Theme.of(context).colorScheme.secondary,
              ),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                product.toggleFavorite();
                
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      product.isFavorite
                          ? 'Produto adicionado aos favoritos!'
                          : 'Produto removido dos favoritos!',
                    ),
                    duration: const Duration(seconds: 2),
                    action: SnackBarAction(
                      label: 'DESFAZER',
                      onPressed: () {
                       product.toggleFavorite();
                      },
                    ),
                  ),
                );
              },
            ),
            title: Text(product.title, textAlign: TextAlign.center),
            trailing: IconButton(
              onPressed: () => cart.addItem(product),
              icon: const Icon(Icons.shopping_cart),
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }
}
 