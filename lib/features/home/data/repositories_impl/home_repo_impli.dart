import '../../domain/repositories/home_repositories.dart';
import '../../domain/entitiy/home_res_entitiy.dart';
import '../datasource/home_datasource.dart';

class HomeRepoImpl implements HomeRepositories {
  HomeDatasource homeDatasource = HomeDatasourceImpl();

  @override
  Future<HomeResEntitiy> getAllProduct() {
    return homeDatasource
        .getAllProduct()
        .then((value) => value.toEntity());
  }
}
