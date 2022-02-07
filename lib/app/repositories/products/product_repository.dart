import 'package:dartweek/app/models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> findAll() {
    throw UnimplementedError();
  }
}
