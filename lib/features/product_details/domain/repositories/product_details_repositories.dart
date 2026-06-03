import '../entitiy/product_details_res_entitiy.dart';

abstract class ProductDetailsRepositories {
  Future<ProductDetailsResEntitiy> productById({required int id});
}
