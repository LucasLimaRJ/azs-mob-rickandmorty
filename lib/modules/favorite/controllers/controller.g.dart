// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoriteController on _FavoriteControllerBase, Store {
  late final _$listFavoriteAtom =
      Atom(name: '_FavoriteControllerBase.listFavorite', context: context);

  @override
  List<dynamic> get listFavorite {
    _$listFavoriteAtom.reportRead();
    return super.listFavorite;
  }

  @override
  set listFavorite(List<dynamic> value) {
    _$listFavoriteAtom.reportWrite(value, super.listFavorite, () {
      super.listFavorite = value;
    });
  }

  late final _$getListEpisodeDbFavoritesAsyncAction = AsyncAction(
      '_FavoriteControllerBase.getListEpisodeDbFavorites',
      context: context);

  @override
  Future getListEpisodeDbFavorites() {
    return _$getListEpisodeDbFavoritesAsyncAction
        .run(() => super.getListEpisodeDbFavorites());
  }

  @override
  String toString() {
    return '''
listFavorite: ${listFavorite}
    ''';
  }
}
