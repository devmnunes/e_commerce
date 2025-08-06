abstract class ProductEvents {}

class FetchProductsEvents extends ProductEvents {}

class FilterProductsEvents extends ProductEvents {
  final bool isFavorite;

  FilterProductsEvents(this.isFavorite);

}