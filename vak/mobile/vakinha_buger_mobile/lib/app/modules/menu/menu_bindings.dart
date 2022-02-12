import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/repositories/products/produtct_repository.dart';
import 'package:vakinha_burger_mobile/app/repositories/products/produtct_repository_impl.dart';
import './menu_controller.dart';

class MenuBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProdutctRepository>(
        () => ProdutctRepositoryImpl(restClient: Get.find()));
    Get.put(MenuController(produtctRepository: Get.find()));
  }
}
