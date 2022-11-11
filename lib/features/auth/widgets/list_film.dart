import 'package:flutter/material.dart';
import 'package:review_film/constaints/global_variables.dart';

class ListFilm extends StatefulWidget {
  const ListFilm({super.key});

  @override
  State<ListFilm> createState() => _ListFilmState();
}

class _ListFilmState extends State<ListFilm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
      child: ListView.builder(
          itemCount: GlobalVariables.film.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Container(
                    height: 40,
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 10, top: 15),
                    child: Text(
                      GlobalVariables.film[index]['type']!,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Container(
                      width: 400,
                      padding: const EdgeInsets.all(10),
                      child: Image.network(
                        GlobalVariables.film[index]['image']!,
                        fit: BoxFit.fitHeight,
                        width: 180,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
