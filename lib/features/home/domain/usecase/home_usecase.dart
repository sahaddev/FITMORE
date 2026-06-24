import 'package:e_commerce/features/home/domain/entitiy/banner_res_entitiy.dart';

import '../repositories/home_repositories.dart';
import '../entitiy/home_res_entitiy.dart';
import '../../data/repositories_impl/home_repo_impli.dart';

class HomeUsecase {
  HomeRepositories homeRepositories = HomeRepoImpl();

  Future<HomeResEntitiy> getAllProduct({String? search, String? category}) {
    return homeRepositories.getAllProduct(search: search, category: category);
  }

  Future<BannerResEntitiy> getBanner() {
    return homeRepositories.getBanner();
  }
}
