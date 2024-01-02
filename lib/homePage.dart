import 'package:flutter/material.dart';

import 'main.dart' as main;


class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.changeIndex});
  final Function changeIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HomeCard("Tus Fotos", 'img/home/cards/agila.jpg', changeIndex, 1), HomeCard("Fotos en la Nube", "img/home/cards/pajaros.jpg", changeIndex, 2)
      ],
    );
  }
}
class HomeCard extends StatefulWidget {
  final String title;

  final String image;

  final Function changeIndex;

  final int changeIndexValue;

  const HomeCard(this.title, this.image, this.changeIndex, this.changeIndexValue, {super.key});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
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
              opacity: 0.4,
              image: AssetImage(widget.image),
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

