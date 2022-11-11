import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_film/constaints/global_variables.dart';
import 'package:review_film/features/auth/widgets/carousel_image.dart';
import 'package:review_film/features/auth/widgets/list_film.dart';
import 'package:review_film/features/auth/widgets/top_type_film.dart';
import 'package:review_film/providers/user_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> countries = [
    "Brazil",
    "Nepal",
    "India",
    "China",
    "USA",
    "Canada"
  ];
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                color: GlobalVariables.appbarColor,
                // gradient: GlobalVariables.appBarGrandient,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 42,
                    margin: const EdgeInsets.only(left: 15),
                    // alignment: Alignment.topLeft,
                    child: Material(
                      borderRadius: BorderRadius.circular(7),
                      elevation: 1,
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(left: 6),
                              child: Icon(Icons.search,
                                  color: Colors.black, size: 23),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(top: 10),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            borderSide: BorderSide(
                              color: Colors.black38,
                              width: 1,
                            ),
                          ),
                          hintText: 'Search iSITD',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  height: 42,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Icon(
                    Icons.mic,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              TopTypeFilm(),
              CarouselImage(),
              ListFilm(),
            ],
          ),
        ));
  }
}
