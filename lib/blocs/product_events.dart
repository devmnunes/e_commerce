import 'package:e_commerce/models/product.dart';

abstract class ProductEvents {}

class FetchProductsEvent extends ProductEvents {}

class FilterProductsEvent extends ProductEvents {
  final Product isFavorites;
  FilterProductsEvent(this.isFavorites);

  
}


