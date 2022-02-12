import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burger_mobile/app/core/bindings/application_binding.dart';
import 'package:vakinha_burger_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burger_mobile/app/routes/auth_routers.dart';
import 'package:vakinha_burger_mobile/app/routes/home_routers.dart';
import 'package:vakinha_burger_mobile/app/routes/orders_routers.dart';
import 'package:vakinha_burger_mobile/app/routes/product_routers.dart';
import 'package:vakinha_burger_mobile/app/routes/splsh_routers.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const VakinhaBugerMainApp());
}

class VakinhaBugerMainApp extends StatelessWidget {
  const VakinhaBugerMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vakinha Buger',
      theme: VakinhaUI.theme,
      initialBinding: ApplicationBinding(),
      getPages: [
        ...SplshRouters.routers,
        ...AuthRouters.routers,
        ...HomeRouters.routers,
        ...ProductRouters.routers,
        ...OrdersRouters.routers,
      ],
    );
  }
}
