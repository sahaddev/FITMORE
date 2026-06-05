import '../repositories/product_details_repositories.dart';
import '../entitiy/product_details_res_entitiy.dart';
import '../../data/repositories_impl/product_details_repo_impli.dart';

class ProductDetailsUsecase {
  ProductDetailsRepositories productDetailsRepositories = ProductDetailsRepoImpl();

  Future<ProductDetailsResEntitiy> productById({required int id}) {
    return productDetailsRepositories.productById(id: id);
  }
}
