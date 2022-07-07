import 'package:flutter/material.dart';
import '../../../shared/styles/theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../modules/home/controllers/controller.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController controller = HomeController();
  TextEditingController textController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    textController.addListener(() => {controller.searchListByName( textController.text)});
    controller.getAllEpisodes();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite_border_outlined,
            ),
            onPressed: () {
             Navigator.pushNamed(context, '/favorite');
            },
          ),
       
                 AnimSearchBar(
                autoFocus: true,
                closeSearchOnSuffixTap: true,
                color: primaryColor,
                style: TextStyle(color: Colors.white),
                width: 200,
                textController: textController,
                helpText: 'Procurar...',
                onSuffixTap: () {
                    textController.clear();
                },
                
                prefixIcon: Icon(Icons.search),
              )
        ],
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
              child: Text('Principais personagens', style: styleTitle),
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
              flex: 1,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  characterCard(context, "Rick Sanchez", "Rick"),
                  characterCard(context, "Morty Smith", "Morty"),
                  characterCard(context, "Summer Smith", "Summer"),
                  characterCard(context, "Beth Smith", "Beth"),
                  characterCard(context, "Jerry Smith", "Jerry"),
                ],
              )),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: FittedBox(
              child: Observer(
                  builder: ((_) => Text(
                      'Episódios: ${controller.resultadoBusca.length.toString()}',
                      style: styleTitle))),
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
              flex: 2,
              child: Observer(builder: (_) {
                if (controller.resultadoBusca.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                      itemCount: controller.resultadoBusca.length,
                      itemBuilder: (BuildContext context, index) {
                        return episodeCard(
                            context,
                            controller.resultadoBusca[index]['id'],
                            controller.resultadoBusca[index]['episode'],
                            controller.resultadoBusca[index]['name'],
                            controller.resultadoBusca[index]['air_date']);
                      });
                }
              })),
        ],
      ),
    );
  }
}

Widget characterCard(context, String characterName, characterImage) {
  return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.all(3),
      width: MediaQuery.of(context).size.width * 0.44,
      height: MediaQuery.of(context).size.height * 0.12,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/$characterImage.jpeg"),
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
          child: Text(characterName, style: styleTitleEpisodeCard),
          fit: BoxFit.fitWidth,
        ),
      ));
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
