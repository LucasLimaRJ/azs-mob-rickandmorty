import 'package:flutter/material.dart';
import '../../../shared/styles/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../controllers/controller.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  FavoriteController controller = FavoriteController();
  
  @override
  Widget build(BuildContext context) {
    controller.getListEpisodeDbFavorites();
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
       
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: FittedBox(
              child: Observer(
                  builder: ((_) => Text(
                      'Curtidos: ${controller.ListFavorite.length.toString()}',
                      style: styleTitle))),
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
              flex: 2,
              child: Observer(builder: (_) {
                if (controller.ListFavorite.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                } else {

                  return ListView.builder(
                      itemCount: controller.ListFavorite.length,
                      itemBuilder: (BuildContext context, index) {
                        if(controller.ListFavorite[index]['favorite'] == 0 ){
                         
                        }
                        return episodeCard(
                            context,
                            controller.ListFavorite[index]['episodeId'].toString(),
                            controller.ListFavorite[index]['episode'].toString(),
                            controller.ListFavorite[index]['name'].toString(),
                            controller.ListFavorite[index]['dateRelease'].toString());
                      });
                }
              })),
        ],
      ),
    );
  }
}


Widget episodeCard(context, String episodeId, episode, name, dateRelease) {
  return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/episode',
            arguments: {'episodeId': episodeId});
      },
      child: FittedBox(
        child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Color.fromRGBO(0, 0, 0, 0.7), BlendMode.darken),
                    image:
                        AssetImage("assets/images/background_episode_Card.jpg"),
                    fit: BoxFit.cover),
                color: Colors.white,
                borderRadius: BorderRadius.circular(6)),
            child: ListTile(
              leading: Text(episode, style: styleTitleEpisodeCard),
              title: Text(name,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w700)),
              subtitle:
                  Text(dateRelease, style: TextStyle(color: Colors.white)),
            )),
      ));
}
