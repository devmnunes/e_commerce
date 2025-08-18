import 'package:e_commerce/blocs/product_bloc.dart';
import 'package:e_commerce/blocs/product_state.dart';
import 'package:e_commerce/components/product_item.dart';
import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ProductErrorState) {
          return const Center(child: Text('Erro ao carregar produtos.'));
        }

        final List<Product> products = state.products; 

        return GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (_, i) => ProductItem(product: products[i]),
        );
      },
    );
  }
}
     
