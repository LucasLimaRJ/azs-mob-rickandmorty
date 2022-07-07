// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<List<dynamic>>? _$resultadoBuscaComputed;

  @override
  List<dynamic> get resultadoBusca => (_$resultadoBuscaComputed ??=
          Computed<List<dynamic>>(() => super.resultadoBusca,
              name: '_HomeControllerBase.resultadoBusca'))
      .value;

  late final _$episodesAtom =
      Atom(name: '_HomeControllerBase.episodes', context: context);

  @override
  List<dynamic> get episodes {
    _$episodesAtom.reportRead();
    return super.episodes;
  }

  @override
  set episodes(List<dynamic> value) {
    _$episodesAtom.reportWrite(value, super.episodes, () {
      super.episodes = value;
    });
  }

  late final _$searchAtom =
      Atom(name: '_HomeControllerBase.search', context: context);

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  late final _$getAllEpisodesAsyncAction =
      AsyncAction('_HomeControllerBase.getAllEpisodes', context: context);

  @override
  Future getAllEpisodes() {
    return _$getAllEpisodesAsyncAction.run(() => super.getAllEpisodes());
  }

  late final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase', context: context);

  @override
  dynamic searchListByName(String searchText) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.searchListByName');
    try {
      return super.searchListByName(searchText);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
episodes: ${episodes},
search: ${search},
resultadoBusca: ${resultadoBusca}
    ''';
  }
}
