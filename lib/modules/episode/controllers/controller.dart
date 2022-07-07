import 'package:mobx/mobx.dart';
import 'package:rickandmorty/shared/repository/repository.dart';
import '../../../shared/service/sqllite.dart';
import '../models/episodeSqlModel.dart';

part 'controller.g.dart';

class EpisodeController = _EpisodeControllerBase with _$EpisodeController;

abstract class _EpisodeControllerBase with Store {
  final Repository repository = Repository();
  SqlLite db = SqlLite();

  @observable
  List<dynamic> episodeList = [];

  @observable
  List<dynamic> charactersList = [];

  @observable
  String seasonAndEpisode = '';

  @observable
  String? name;

  @observable
  String? dateRelease;

  @observable
  String? characterCount;

  @observable
  int favorite = 0;

  @observable
  int watched = 0;

  @action
  getEpisodeById(int id) async {
    episodeList = await repository.getEpisodeByIdFromService(id);
    getInfoEpisode();
    insertEpisode(id);
  }

  @action
  getInfoEpisode() {
    seasonAndEpisode = episodeList[0]['episode']['episode'];
    name = episodeList[0]['episode']['name'];
    dateRelease = episodeList[0]['episode']['air_date'];
    charactersList = episodeList[0]['episode']['characters'];
    characterCount = episodeList[0]['episode']['characters'].length.toString();
  }

  @action
  insertEpisode(int id) async {
    var exist = await db.existEpisodesById(id);
    if (exist == false) {
      EpisodeSqlModel model = EpisodeSqlModel(
          episodeId: id,
          favorite: 0,
          watched: 1,
          name: name,
          episode: seasonAndEpisode,
          dateRelease: dateRelease);
      db.insert(model);
    }
    getEpisodeFavoriteStatusAndwatched(id);
  }

  @action
  getEpisodeFavoriteStatusAndwatched(int episodeId) async {
    var data = await db.getdbEpisodeInfo(episodeId);

    favorite = data['favorite'];
    watched = data['watched'];
  }

  @action
  updateEpisodeFavorite(int episodeId, favorite) {
    db.updateEpisode(episodeId, favorite);
  }
}
