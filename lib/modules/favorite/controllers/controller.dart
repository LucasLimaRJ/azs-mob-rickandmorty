import 'package:mobx/mobx.dart';
import '../../../shared/service/sqllite.dart';

part 'controller.g.dart';

class FavoriteController = _FavoriteControllerBase with _$FavoriteController;

abstract class _FavoriteControllerBase with Store {
    SqlLite db = SqlLite();

  @observable 
  List listFavorite = [];
 
  @action
  getListEpisodeDbFavorites () async {
     List results =  listFavorite = await db.getEpisodes();
     List<Map<String, dynamic>?> data = [
      for (var result in results) result
    ];
    
   listFavorite = data;

  }
}