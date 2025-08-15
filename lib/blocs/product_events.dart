abstract class ProductEvents {}

class FetchProductsEvent extends ProductEvents {}

class FilterProductsEvent extends ProductEvents {
  final bool isFavorites;
  FilterProductsEvent(this.isFavorites);
}


