import 'package:cached_network_image/cached_network_image.dart';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.changeIndex});
  final Function changeIndex;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HomeCard("Tus Fotos", widget.changeIndex, 1), HomeCard("Fotos en la Nube", widget.changeIndex, 2)
        ],
      ),
    );
  }
}
class HomeCard extends StatefulWidget {
  final String title;


  final Function changeIndex;

  final int changeIndexValue;

  const HomeCard(this.title, this.changeIndex, this.changeIndexValue, {super.key});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> with SingleTickerProviderStateMixin {
  List<String?> images = [null, null];
  late Animation<double> animation;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 700), vsync: this);

    animation = Tween<double>(begin: 0, end: 0.4).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut)
    )
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object's value.
        });
      });
    fetchImages();

  }
  void fetchImages() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.fetchAndActivate();
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(seconds: 10),
    ));

    setState(() {
      images[0] = remoteConfig.getString('homeCard1').toString();
      images[1] = remoteConfig.getString('homeCard2').toString();
    });
    controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              opacity: animation.value,
              image: CachedNetworkImageProvider(images[widget.changeIndexValue - 1] ?? "https://raw.githubusercontent.com/oriolgds/Ors-Photos/main/placeholder.jpg"),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),

          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title, style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.start,),
                  Expanded(child: Container()),
                  FilledButton(
                    onPressed: (){
                      widget.changeIndex(widget.changeIndexValue);
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Ver'),
                        SizedBox(
                          width: 6,
                        ),
                        Icon(Icons.arrow_right_alt_rounded)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

