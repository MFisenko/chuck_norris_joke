import 'package:chuck_norris_joke_app/providers/joke_provider.dart';
import 'package:chuck_norris_joke_app/repositories/categories_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  static const routeName = "/";

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "CHUCK NORRIS",
              style: TextStyle(
                color: Color.fromRGBO(224, 100, 55, 1),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SearchBar(),
            Text("Or choose a random category"),
            CategoriesGrid(),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 40, right: 40, top: 24, bottom: 24),
      child: TextField(
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          border: InputBorder.none,
          filled: true,
          fillColor: Color.fromRGBO(250, 250, 250, 0.93),
          prefixIcon: Icon(Icons.search, size: 28),
          hintText: "Search a random joke",
        ),
      ),
    );
  }
}

class CategoriesGrid extends StatefulWidget {
  const CategoriesGrid({Key? key}) : super(key: key);

  @override
  State<CategoriesGrid> createState() => _CategoriesGridState();
}

class _CategoriesGridState extends State<CategoriesGrid> {
  Future<List<String>> _categories = Future(() => []);

  @override
  initState() {
    super.initState();
    _categories = fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    final jokeData = Provider.of<JokeProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: FutureBuilder<List<String>>(
        future: _categories,
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            List<String>? myCategories = snapshot.data as List<String>;
            return GridView.builder(
                itemCount: snapshot.data?.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 50,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, int index) {
                  return SizedBox(
                    child: MaterialButton(
                      elevation: 8,
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        jokeData.setCategory(myCategories[index]);
                      },
                      child: Center(
                        child: Text(
                          myCategories[index].capitalize(),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
