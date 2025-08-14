import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/models/product_list.dart';
import 'package:flutter/widgets.dart';

abstract class ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final List<Product> products;
  ProductLoadedState(this.products);
}

class ProductErrorState extends ProductState {}
