import 'package:mobx/mobx.dart';
import 'package:rickandmorty/shared/repository/repository.dart';
part 'controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;
abstract class _HomeControllerBase with Store {
 final Repository _repository = Repository();
  @observable
  List<dynamic> episodes = [];
  
  @observable
  String search = ''; 

  @computed
  List get resultadoBusca {
    if (search.isEmpty) {
      return episodes;
    } else {
      return episodes
          .where((element) => element["name"]
              .toLowerCase()
              .contains(search.toLowerCase()))
          .toList();
    }
  }

  @action
   getAllEpisodes() async{
    episodes = await _repository.getAllEpisodeFromService();
  }

   @action
   searchListByName(String searchText){
    search = searchText;
   }
}