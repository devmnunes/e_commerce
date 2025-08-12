import 'package:e_commerce/models/product.dart';

abstract class CartEvent {}

class addItemEvent extends CartEvent {
  final Product product;

  addItemEvent( this.product);
}