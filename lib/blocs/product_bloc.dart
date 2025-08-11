import 'package:bloc/bloc.dart';
import 'package:e_commerce/blocs/product_events.dart';
import 'package:e_commerce/blocs/product_state.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/models/product_list.dart';

class ProductBloc extends Bloc<ProductEvents, ProductState> {
  final ProductList productList;

  ProductBloc(this.productList) : super(ProductLoadingState());

  @override
  
  Stream<ProductState> mapEventToState(ProductEvents event) async* {
    if (event is FetchProductsEvents) {
      yield ProductLoadingState();
      try {
        yield ProductLoadedState(productList.items);
      } catch (_) {
        yield ProductErrorState();
      }
    }
      else if (event is FilterProductsEvents) {
        yield ProductLoadedState(
          productList.items,
        );
      }
    }
  }
