import 'package:e_commerce/blocs/product_bloc.dart';
import 'package:e_commerce/blocs/product_state.dart';
import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/models/product_list.dart';
import 'package:e_commerce/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override


  Widget build(BuildContext context) {
    //final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);
    final product = context.select<ProductBloc, Product>((bloc) => bloc.state.products);

    return BlocProvider(
      create: (context) => ProductBloc(ProductList()),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            child: Image.network(product.imageUrl, fit: BoxFit.cover),
            onTap: () {
              Navigator.of(
                context,
              ).pushNamed(AppRoutes.PRODUCT_DETAIL, arguments: product);
            },
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black45,
            leading: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) => IconButton(
                icon: Icon(
                  product.isFavorite
                  ? Icons.favorite 
                  : Icons.favorite_border,
                ),
                color: Theme.of(context).colorScheme.secondary,
                onPressed: () {
                  
                },
              ),
            ),
            title: Text(product.title, textAlign: TextAlign.center),
            trailing: IconButton(
              onPressed: () {
                cart.addItem(product);
              },
              icon: Icon(Icons.shopping_cart),
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }
}
