import 'package:vakinha_burger_mobile/app/models/product_model.dart';

abstract class ProdutctRepository {
  Future<List<ProductModel>> findAll();
}
