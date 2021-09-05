import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_with_provider/models/films.dart';
import 'package:state_management_with_provider/widgets/film_item.dart';

class FilmsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var films = context.read<FilmsModel>();
    return ListView.builder(
        itemCount: films.length,
        itemBuilder: (BuildContext context, int index) {
          return FilmItem(index + 1);
        });
  }
}
