abstract class ProductEvents {}

class FetchProductsEvent extends ProductEvents {}

class FilterProductsEvent extends ProductEvents {
  bool isFavorites;
  FilterProductsEvent(this.isFavorites);

  
}


