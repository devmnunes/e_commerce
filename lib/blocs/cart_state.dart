import 'package:e_commerce/models/product.dart';

abstract class CartState{}

class CartLoadingState extends CartState {}

class CartLoadedState extends CartState {
  final List<Product> products;
  CartLoadedState(this.products);
}

class CartErrorState extends CartState {}