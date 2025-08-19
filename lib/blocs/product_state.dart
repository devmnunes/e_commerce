import 'package:e_commerce/models/product.dart';


/*abstract class ProductState {
}*/
abstract class ProductState {
  List<Product> get products => const [];
  
}
class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  @override
  final List<Product> products;
  
  ProductLoadedState(this.products);

  
}

class ProductErrorState extends ProductState {}
