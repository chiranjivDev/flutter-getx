import 'package:get/get.dart';
import 'package:ecommerce_app/app/views/home_view.dart';

class AppPages {
  static const initial = '/home';

  static final routes = [GetPage(name: '/home', page: () => HomeView())];
}
