import '../../domain/repositories/product_details_repositories.dart';
import '../../domain/entitiy/product_details_res_entitiy.dart';
import '../datasource/product_details_datasource.dart';

class ProductDetailsRepoImpl implements ProductDetailsRepositories {
  ProductDetailsDatasource productDetailsDatasource = ProductDetailsDatasourceImpl();

  @override
  Future<ProductDetailsResEntitiy> productById({required int id}) {
    return productDetailsDatasource
        .productById(id: id)
        .then((value) => value.toEntity());
  }
}
