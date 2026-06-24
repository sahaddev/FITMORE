import 'package:e_commerce/features/home/domain/entitiy/banner_res_entitiy.dart';

import '../../domain/repositories/home_repositories.dart';
import '../../domain/entitiy/home_res_entitiy.dart';
import '../datasource/home_datasource.dart';

class HomeRepoImpl implements HomeRepositories {
  HomeDatasource homeDatasource = HomeDatasourceImpl();

  @override
  Future<HomeResEntitiy> getAllProduct({String? search, String? category}) {
    return homeDatasource
        .getAllProduct(search: search, category: category)
        .then((value) => value.toEntity());
  }

  @override
  Future<BannerResEntitiy> getBanner() {
    return homeDatasource.getBanner().then((value) => value.toEntity());
  }
}
