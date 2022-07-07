// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EpisodeController on _EpisodeControllerBase, Store {
  late final _$episodeListAtom =
      Atom(name: '_EpisodeControllerBase.episodeList', context: context);

  @override
  List<dynamic> get episodeList {
    _$episodeListAtom.reportRead();
    return super.episodeList;
  }

  @override
  set episodeList(List<dynamic> value) {
    _$episodeListAtom.reportWrite(value, super.episodeList, () {
      super.episodeList = value;
    });
  }

  late final _$charactersListAtom =
      Atom(name: '_EpisodeControllerBase.charactersList', context: context);

  @override
  List<dynamic> get charactersList {
    _$charactersListAtom.reportRead();
    return super.charactersList;
  }

  @override
  set charactersList(List<dynamic> value) {
    _$charactersListAtom.reportWrite(value, super.charactersList, () {
      super.charactersList = value;
    });
  }

  late final _$seasonAndEpisodeAtom =
      Atom(name: '_EpisodeControllerBase.seasonAndEpisode', context: context);

  @override
  String get seasonAndEpisode {
    _$seasonAndEpisodeAtom.reportRead();
    return super.seasonAndEpisode;
  }

  @override
  set seasonAndEpisode(String value) {
    _$seasonAndEpisodeAtom.reportWrite(value, super.seasonAndEpisode, () {
      super.seasonAndEpisode = value;
    });
  }

  late final _$nameAtom =
      Atom(name: '_EpisodeControllerBase.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$dateReleaseAtom =
      Atom(name: '_EpisodeControllerBase.dateRelease', context: context);

  @override
  String? get dateRelease {
    _$dateReleaseAtom.reportRead();
    return super.dateRelease;
  }

  @override
  set dateRelease(String? value) {
    _$dateReleaseAtom.reportWrite(value, super.dateRelease, () {
      super.dateRelease = value;
    });
  }

  late final _$characterCountAtom =
      Atom(name: '_EpisodeControllerBase.characterCount', context: context);

  @override
  String? get characterCount {
    _$characterCountAtom.reportRead();
    return super.characterCount;
  }

  @override
  set characterCount(String? value) {
    _$characterCountAtom.reportWrite(value, super.characterCount, () {
      super.characterCount = value;
    });
  }

  late final _$favoriteAtom =
      Atom(name: '_EpisodeControllerBase.favorite', context: context);

  @override
  int get favorite {
    _$favoriteAtom.reportRead();
    return super.favorite;
  }

  @override
  set favorite(int value) {
    _$favoriteAtom.reportWrite(value, super.favorite, () {
      super.favorite = value;
    });
  }

  late final _$watchedAtom =
      Atom(name: '_EpisodeControllerBase.watched', context: context);

  @override
  int get watched {
    _$watchedAtom.reportRead();
    return super.watched;
  }

  @override
  set watched(int value) {
    _$watchedAtom.reportWrite(value, super.watched, () {
      super.watched = value;
    });
  }

  late final _$getEpisodeByIdAsyncAction =
      AsyncAction('_EpisodeControllerBase.getEpisodeById', context: context);

  @override
  Future getEpisodeById(int id) {
    return _$getEpisodeByIdAsyncAction.run(() => super.getEpisodeById(id));
  }

  late final _$insertEpisodeAsyncAction =
      AsyncAction('_EpisodeControllerBase.insertEpisode', context: context);

  @override
  Future insertEpisode(int id) {
    return _$insertEpisodeAsyncAction.run(() => super.insertEpisode(id));
  }

  late final _$getEpisodeFavoriteStatusAndwatchedAsyncAction = AsyncAction(
      '_EpisodeControllerBase.getEpisodeFavoriteStatusAndwatched',
      context: context);

  @override
  Future getEpisodeFavoriteStatusAndwatched(int episodeId) {
    return _$getEpisodeFavoriteStatusAndwatchedAsyncAction
        .run(() => super.getEpisodeFavoriteStatusAndwatched(episodeId));
  }

  late final _$_EpisodeControllerBaseActionController =
      ActionController(name: '_EpisodeControllerBase', context: context);

  @override
  dynamic getInfoEpisode() {
    final _$actionInfo = _$_EpisodeControllerBaseActionController.startAction(
        name: '_EpisodeControllerBase.getInfoEpisode');
    try {
      return super.getInfoEpisode();
    } finally {
      _$_EpisodeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateEpisodeFavorite(int episodeId, dynamic favorite) {
    final _$actionInfo = _$_EpisodeControllerBaseActionController.startAction(
        name: '_EpisodeControllerBase.updateEpisodeFavorite');
    try {
      return super.updateEpisodeFavorite(episodeId, favorite);
    } finally {
      _$_EpisodeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
episodeList: ${episodeList},
charactersList: ${charactersList},
seasonAndEpisode: ${seasonAndEpisode},
name: ${name},
dateRelease: ${dateRelease},
characterCount: ${characterCount},
favorite: ${favorite},
watched: ${watched}
    ''';
  }
}
