class EpisodeSqlModel {
  int? id;
  int? episodeId = 0;
  int? favorite = 0;
  int? watched = 0;
  String? name = '';
   String? episode = '';
    String? dateRelease = '';
  EpisodeSqlModel({
    this.id,
    required this.episodeId,
    required this.favorite,
    required this.watched,
    required this.name,
    required this.episode,
    required this.dateRelease,


        

  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'episodeId': episodeId,
      'favorite': favorite,
      'watched': watched,
      'name':name,
      'episode':episode,
      'dateRelease':dateRelease
    };
  }
}
