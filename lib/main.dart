import 'package:rickandmorty/modules/favorite/screens/favorite.dart';
import '../modules/home/screens/home.dart';
import 'package:flutter/material.dart';
import 'modules/character/screens/character.dart';
import 'modules/episode/screens/episode.dart';
import 'shared/styles/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'The Rick and Morty World',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
          primaryColor: primaryColor,
        ),
        routes: {
          '/': (context) => Home(),
          '/episode': (context) {
            final args = ModalRoute.of(context)?.settings.arguments as Map;
            return Episode(episodeId: args['episodeId']);
          },
          '/character': (context) {
            final args = ModalRoute.of(context)?.settings.arguments as Map;
            return Character(
                characterId: args['characterId'],
                characterName: args['characterName'],
                characterSpecie: args['characterSpecie'],
                 characterStatus: args['characterStatus'],
                  characterUrlImage: args['characterUrlImage']);
          },
           '/favorite': (context) => const Favorite(),
        },
        initialRoute: '/');
  }
}
