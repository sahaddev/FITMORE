import '../repositories/home_repositories.dart';
import '../entitiy/home_res_entitiy.dart';
import '../../data/repositories_impl/home_repo_impli.dart';

class HomeUsecase {
  HomeRepositories homeRepositories = HomeRepoImpl();

  HomeUsecase({required this.homeRepositories});

  Future<HomeResEntitiy> getAllProduct() {
    return homeRepositories.getAllProduct();
  }
}
