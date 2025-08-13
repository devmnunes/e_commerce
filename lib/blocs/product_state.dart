import 'package:e_commerce/models/product.dart';

abstract class ProductState{
  
}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final Product products;
  ProductLoadedState(this.products);
}

class ProductErrorState extends ProductState {}