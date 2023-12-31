import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Card(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Text('Tus fotos', style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.start,)
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Column(
                children: [
                  Text('Tus fotos')
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
