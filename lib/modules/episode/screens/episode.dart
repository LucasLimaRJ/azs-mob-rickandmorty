import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rickandmorty/shared/styles/theme.dart';

import '../controllers/controller.dart';

class Episode extends StatefulWidget {
  const Episode({super.key, required episodeId});

  @override
  State<Episode> createState() => _EpisodeState();
}

class _EpisodeState extends State<Episode> {
  EpisodeController controller = EpisodeController();

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    int episodeId = int.parse(arguments['episodeId']);
    controller.getEpisodeById(episodeId);
    controller.insertEpisode(episodeId);
    print(controller.favorite);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
      
      ),
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Image(
                width: MediaQuery.of(context).size.width * 0.6,
                image: AssetImage("assets/images/logo.png"),
                fit: BoxFit.cover),
          ),
          Expanded(
              flex: 2,
              child: Observer(builder: (_) {
                if (controller.episodeList.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return episodeDescriptionCard(
                      context,
                      controller,
                      episodeId,
                      controller.seasonAndEpisode,
                      controller.name,
                      controller.dateRelease,
                      controller.characterCount);
                }
              })),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: FittedBox(
              child: Text('Personagens do episódio', style: styleTitle),
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
              flex: 1,
              child: Observer(
                builder: (context) {
                  if (controller.episodeList.isEmpty) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.charactersList.length,
                        itemBuilder: (context, index) {
                          var data = controller.charactersList[index];
                          return characterCard(context, data);
                        });
                  }
                },
              )),
        ],
      ),
    );
  }
}

Widget characterCard(context, dynamic data) {
  return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/character', arguments: {
            'characterId': data['id'],
            'characterName': data['name'],
            'characterSpecie': data['species'],
            'characterStatus': data['status'],
            'characterUrlImage': data['image']
          }),
      child: Hero(
          tag: data['id'],
          child: Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.all(3),
            width: MediaQuery.of(context).size.width * 0.44,
            height: MediaQuery.of(context).size.height * 0.12,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: (NetworkImage(data['image'])),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Color.fromRGBO(0, 0, 0, 0.1), BlendMode.darken)),
                color: Colors.white,
                borderRadius: BorderRadius.circular(6)),
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.03,
              color: Color.fromRGBO(0, 0, 0, 0.6),
              child: FittedBox(
                child: Text(data['name'], style: styleTitleEpisodeCard),
                fit: BoxFit.fitWidth,
              ),
            ),
          )));
}

Widget episodeDescriptionCard(
    context, controller, int episodeId, String episode, name, dateRelease, charactersCount) {
  return FittedBox(
      child: Container(
          padding: EdgeInsets.all(12),
          alignment: Alignment.center,
          margin: EdgeInsets.all(1),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Color.fromRGBO(0, 0, 0, 0.7), BlendMode.darken),
                  image:
                      AssetImage("assets/images/background_episode_Card.jpg"),
                  fit: BoxFit.cover),
              color: Colors.white,
              borderRadius: BorderRadius.circular(6)),
          child: Column(children: [
            Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.justify,
            ),
            Text(
                'Foi ao ar em $dateRelease com a participação de $charactersCount personagens.',
                style: TextStyle(color: Colors.white, fontSize: 17)),
            SizedBox(
              height: 5,
            ),
            Text('Para conhecer melhor os personagens toque sobre eles.',
                style: TextStyle(color: Colors.white, fontSize: 17)),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Container(
                    child: Column(
                      children: [
                        IconButton(
                            icon: Icon(
                              controller.favorite == 0
                                  ? Icons.favorite_border_outlined
                                  : Icons.favorite,
                              color: Colors.white,
                              size: 32,
                            ),
                            onPressed: () {
                              switch (controller.favorite) {
                                case 0:
                                  controller.favorite = 1;
                                  controller.updateEpisodeFavorite(
                                      episodeId, 1);
                                  break;
                                case 1:
                                 controller.favorite = 0;
                                  controller.updateEpisodeFavorite(
                                      episodeId, 0);
                                  ;
                                  break;
                              }
                            }),
                        Text(
                          controller.favorite == 0 ? 'Curtir' : 'Curtido',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Column(
                      children: [
                        IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.done_all,
                              color: Colors.white,
                              size: 32,
                            )),
                        Text(
                          'Visto',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ])));
}
