import 'package:mobx/mobx.dart';
import '../../../shared/service/sqllite.dart';

part 'controller.g.dart';

class FavoriteController = _FavoriteControllerBase with _$FavoriteController;

abstract class _FavoriteControllerBase with Store {
    SqlLite db = SqlLite();

  @observable 
  List ListFavorite = [];
 
  @action
  getListEpisodeDbFavorites () async {
     List results =  ListFavorite = await db.getEpisodes();

     List<Map<String, dynamic>?> data = [
      for (var result in results) result
    ];
    
   ListFavorite = data;
   print(data);

  }
}