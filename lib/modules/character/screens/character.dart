import '../../../shared/styles/theme.dart';
import 'package:flutter/material.dart';

class Character extends StatefulWidget {
  const Character(
      {super.key,
      required characterId,
      required characterName,
      required characterSpecie,
      required characterStatus,
      required characterUrlImage});

  @override
  State<Character> createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(
                  Icons.heart_broken,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              FittedBox(
                fit: BoxFit.fitWidth,
              ),
            ],
          )
        ],
      ),
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Image(
                width: MediaQuery.of(context).size.width * 0.6,
                image: AssetImage("assets/images/logo.png"),
                fit: BoxFit.cover),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: FittedBox(
              child: Text('Personagem', style: styleTitle),
              fit: BoxFit.fitWidth,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Hero(
                  tag: arguments['characterId'],
                  child: characterCard(context, arguments['characterUrlImage']),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Nome: ${arguments['characterName']}  ',
                            style: styleTitleEpisodeCard),
                        Text('Espécie: ${arguments['characterSpecie']}',
                            style: styleTitleEpisodeCard),
                        Text('Status:  ${arguments['characterStatus']}',
                            style: styleTitleEpisodeCard)
                      ],
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 0.6, color: Colors.white)),
              child: Text(
                'Voltar',
                style: styleTitleEpisodeCard,
              ))
        ],
      ),
    );
  }
}

Widget characterCard(context, characterImage) {
  return Container(
    alignment: Alignment.bottomCenter,
    margin: const EdgeInsets.all(10),
    width: MediaQuery.of(context).size.width * 0.42,
    height: MediaQuery.of(context).size.height * 0.20,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(characterImage),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Color.fromRGBO(0, 0, 0, 0.1), BlendMode.darken)),
        color: Colors.white,
        borderRadius: BorderRadius.circular(6)),
  );
}
