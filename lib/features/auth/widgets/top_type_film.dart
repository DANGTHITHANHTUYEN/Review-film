import 'package:flutter/material.dart';
import 'package:review_film/constaints/global_variables.dart';

class TopTypeFilm extends StatelessWidget {
  const TopTypeFilm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: ListView.builder(
        itemCount: GlobalVariables.typeFilm.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 150,
            color: GlobalVariables.scrollDirectionColor,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
              ),
              child: Center(
                  child: Text(
                GlobalVariables.typeFilm[index]['name']!,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              )),
            ),
          );
        },
      ),
    );
  }
}
