import '../entitiy/home_res_entitiy.dart';
import '../entitiy/banner_res_entitiy.dart';

abstract class HomeRepositories {
  Future<HomeResEntitiy> getAllProduct({String? search, String? category});
  Future<BannerResEntitiy> getBanner();
}
