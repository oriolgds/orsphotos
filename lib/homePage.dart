import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HomeCard("Tus Fotos", 'img/home/cards/agila.jpg'), HomeCard("Fotos en la Nube", "img/home/cards/pajaros.jpg")
      ],
    );
  }
}
class HomeCard extends StatelessWidget {
  final String title;

  final String image;

  const HomeCard(this.title, this.image,{super.key});

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
              image: AssetImage(image),
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
                  Text(title, style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.start,),
                  Expanded(child: Container()),
                  FilledButton(
                    onPressed: (){

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

