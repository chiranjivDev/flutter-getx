import 'package:ecommerce_app/app/models/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductController extends GetxController {
  // create a reactive list of products
  var products = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  // fetch products from the api
  void fetchProducts() async {
    try {
      isLoading(true);
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        var productList = json.decode(response.body) as List;
        products.value =
            productList.map((json) => Product.fromJson(json)).toList();
      } else {
        Get.snackbar('Error', 'Failed to load products');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred');
    } finally {
      // isLoading.value = false;
      isLoading(false);
    }
  }
}
