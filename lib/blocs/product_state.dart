import 'package:e_commerce/models/product.dart';
import 'package:flutter/widgets.dart';

abstract class ProductState{
  final List<Product> products;

  ProductState(this.products);
}

class ProductLoadingState extends ProductState {
  ProductLoadingState(super.products);
}

class ProductLoadedState extends ProductState {
  final List<Product> products;
  ProductLoadedState(this.products) : super(products);
}

class ProductErrorState extends ProductState {
  ProductErrorState(super.products);
}