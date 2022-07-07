import '../../../shared/service/graphql.dart';

class Repository {
  getAllEpisodeFromService() async {
    Graphql graphql = Graphql();
    List results = await Future.wait([
      graphql.getAllEpisodes(page: 1),
      graphql.getAllEpisodes(page: 2),
      graphql.getAllEpisodes(page: 3),
    ]);
    List<Map<String, dynamic>?> data = [
      for (var result in results) result.data
    ];

    return [
      ...data[0]!['episodes']['results'],
      ...data[1]!['episodes']['results'],
      ...data[2]!['episodes']['results'],
    ];
  }

  getEpisodeByIdFromService(int id) async {
    Graphql graphql = Graphql();

    List results = await Future.wait([graphql.getEpisode(id: id)]);

    List<Map<String, dynamic>?> data = [
      for (var result in results) result.data
    ];
    return data;
  }
}
